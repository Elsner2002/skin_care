//
//  ProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 26/07/23.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var vm = CloudKitModel()
    @State private var showSheet: Bool = false
    let product: ListProduct?
    var addRoutine: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 231/255, green: 231/255, blue: 231/255)
                    .ignoresSafeArea()
                
                if let product {
                    if let url = product.image, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                        HStack(alignment: .center){
                            Image(uiImage: imageProduct)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 450, height: 450)
                                .position(x: 200, y: 220)
                                .clipped()
                        }
                    }
                    
                    Button (""){
                    }
                    .sheet(isPresented: $showSheet){
                        SheetProduct(product: product, addRoutine: addRoutine)
                            .presentationDetents([.fraction(0.7), .medium])
                            .presentationDragIndicator(.hidden)
                            .interactiveDismissDisabled()
                            .presentationCornerRadius(40)
                            .presentationBackgroundInteraction(
                                .enabled(upThrough: .medium)
                            )

                    }
                    .onAppear {
                        showSheet = true
                    }
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                   dismiss()
                    showSheet = false
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 12.5, height: 22)
                    }
                    .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct SheetProduct: View {
    let product: ListProduct
    var addRoutine: Bool
    
    init(product: ListProduct, addRoutine: Bool) {
        self.product = product
        self.addRoutine = addRoutine
    }
    
    @State private var option = "Sobre"
    var optionsLits = ["Sobre", "Como Usar", "Fórmula"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.systemBG
                    .ignoresSafeArea()
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        Picker("Product Options", selection: $option) {
                            ForEach(optionsLits, id: \.self) { op in
                                Text(op)
                            }
                        }
                        .pickerStyle(.segmented)
                        .colorMultiply(Color.brandGreen)
                        .padding(.top, 30)
                        .padding(.horizontal, 20)
                        
                        switch option {
                        case "Sobre":
                            AboutProductView(product: product, addRoutine: addRoutine)
                                .padding(.top, 31)
                        case "Como Usar":
                            HowUseProductView(product: product)
                        case "Fórmula":
                            VStack{
                                ForEach(0..<product.ingredients.count) { position in
                                    Button {
                                        print(product.ingredients[position])
                                    } label: {
                                        Text(product.ingredients[position].capitalized)
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                    }
                                    .customButtonStyle(buttonType: .largeRounded)
                                    .padding(.horizontal, 33)
                                }
                            }
                            .padding(.top, 32)
                        default:
                            EmptyView()
                        }
                    }
                    .background(Color.systemBG)
                }
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [], categories: [])!, addRoutine: true)
    }
}

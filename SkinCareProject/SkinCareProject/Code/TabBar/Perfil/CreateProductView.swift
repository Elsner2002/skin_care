//
//  CreateProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct CreateProductView: View {
    
    @State var changeProductImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var productName: String = ""
    @State var productBrand: String = ""
    
    var daysWeek = ["S", "T", "Q", "Q", "S", "S", "D"]
    var daysWeekChoose = [false, false, false, false, false, false, false]
    
    var categories = ["Hidratante", "Protetor Solar", "Sabonete", "Tratamento"]
    var categoriesChoose = [false, false, false, false]
    
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Button {
                        chosePhoto.toggle()
                        
                    } label: {
                        ZStack{
                            Color.black
                            if changeProductImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 163, height: 167, alignment: .topLeading)
                                    .clipShape(Rectangle())
                            }
                            else{
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Rectangle())
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(0)
                        .frame(width: 163, height: 167, alignment: .topLeading)
                        .cornerRadius(15)
                    }
                    .confirmationDialog("Como você quer colocar a foto do produto?", isPresented: $chosePhoto, titleVisibility: .visible) {
                        Button {
                            sourceType = .camera
                            openCameraRoll = true
                        } label: {
                            Text("Câmera")
                        }
                        Button {
                            sourceType = .photoLibrary
                            openCameraRoll = true
                        } label: {
                            Text("Galeria")
                        }
                    }
                }
                    .sheet(isPresented: $openCameraRoll) {
                        ImagePicker(selectedImage: $image, changeImage: $changeProductImage, sourceType: sourceType)
                    }
                Text("adicionar foto")
                    .font(Font.custom("SF Pro", size: 12))
                    .multilineTextAlignment(.center)
                
                VStack{
                    Text("ADICIONAR DETALHES DO PRODUTO")
                        .font(Font.custom("SF Pro", size: 13))
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                        .multilineTextAlignment(.leading)
                    HStack(alignment: .top, spacing: 0) {
                        Text("Nome ")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(.black)
                        .frame(width: 100, height: 42, alignment: .center)
                        TextField("Nome do produto", text: $productName)
                            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
                    }
                    .background(.white)
                    .cornerRadius(10)
                    HStack(alignment: .top, spacing: 0) {
                        Text("Marca ")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(.black)
                        .frame(width: 100, height: 42, alignment: .center)
                        TextField("Marca do produto", text: $productBrand)
                            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
                    }
                    .background(.white)
                    .cornerRadius(10)
                }
                .padding(.all, 16)
                
                VStack{
                    Text("DIAS DA SEMANA QUE EU USO")
                        .font(Font.custom("SF Pro", size: 13))
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                    HStack{
                        ForEach(0..<7) { position in
                            CircleDayButton(dayString: daysWeek[position], selectedButton: daysWeekChoose[position])
                        }
                    }
                    
                }
                .padding(.all, 16)
                
                Text("CATEGORIA")
                    .font(Font.custom("SF Pro", size: 13))
                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                HStack{
                    RectangleCategoryButton(categoryString: categories[0], selectedButton: categoriesChoose[0])
                    RectangleCategoryButton(categoryString: categories[1], selectedButton: categoriesChoose[1])
                }
                HStack{
                    RectangleCategoryButton(categoryString: categories[2], selectedButton: categoriesChoose[2])
                    RectangleCategoryButton(categoryString: categories[3], selectedButton: categoriesChoose[3])
                }

            }
        }
        
    }
    
    init() {
      UITextField.appearance().clearButtonMode = .whileEditing
    }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView()
    }
}

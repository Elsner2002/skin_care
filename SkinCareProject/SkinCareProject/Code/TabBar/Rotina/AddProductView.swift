//
//  AddProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: CloudKitModel
    @State private var searchText = ""
    @State private var isActive = false
    @Binding var routine: Routine
    
    var body: some View {
        NavigationStack{
            ZStack {
                if routine.name == "Rotina Diurna" {
                    Color.brandGreen.ignoresSafeArea()
                } else {
                    Color.brandPink.ignoresSafeArea()
                }
                Rectangle()
                    .offset(y: 350)
                    .ignoresSafeArea()
                    .foregroundColor(Color.systemBG)
                VStack{
                    HStack (alignment: .center, spacing: 16){
                        Button {
                            dismiss()
                        } label: {
                            HStack{
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .frame(width: 12.5, height: 22)
                            }
                            .foregroundColor(Color.black)
                        }
                        Spacer()
                        Text("Adicionar produto")
                            .font(Font.custom("SF Pro", size: 18))
                            .padding(.trailing, 16)
                            .foregroundColor(.black)
                        Spacer()
                        NavigationLink {
                            CreateProductView(routine: $routine)
                                .environmentObject(vm)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                    
                    VStack () {
                        SearchbarAddProduct(searchText: $searchText, routine: $routine, showCreateProduct: true, addRoutine: false)
                            .padding(.bottom, 10)
                            .padding(.top, 20)
                        
                        if self.isActive {
                            VerticalScrollProductsView(searchText: searchText, addRoutine: true)
                        } else {
                            LottieView(name: "animationLoading")
                                .frame(width: 60, height: 60)
                                .padding(.top, 16)
                        }
                        Spacer()
                    }
                    .background(Color.systemBG)
                    .cornerRadius(40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(routine: .constant(Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])))
    }
}

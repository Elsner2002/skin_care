//
//  CreateProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct CreateProductView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var changeProductImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var productName: String = ""
    @State var productBrand: String = ""
    
//    @Binding var path: [Int]
//    let count: Int
    
    var daysWeek = ["S", "T", "Q", "Q", "S", "S", "D"]
    var daysWeekChoose = [false, false, false, false, false, false, false]
    
    var categories = [("Hidratante", false), ("Protetor Solar", false), ("Limpeza", false), ("Tratamento", false)]
    
    var body: some View {
        ScrollView{
            VStack {
                VStack{
                    ZStack {
                        Button {
                            chosePhoto.toggle()
                            
                        } label: {
                            ZStack{
                                Color.systemBG
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
                                        .foregroundColor(.brandGray)
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
                }
                .padding(.all, 8)
                
                VStack{
                    Text("ADICIONAR DETALHES DO PRODUTO")
                        .font(Font.custom("SF Pro", size: 13))
                        .foregroundColor(Color.systemLabelSecondary)
                        .multilineTextAlignment(.leading)
                    
                    CreateProductTextField(productName: $productName, title: "Nome", subTitle: "Nome do produto")
                    
                    CreateProductTextField(productName: $productBrand, title: "Marca", subTitle: "Marca do produto")
                }
                .padding(.all, 8)
                
                VStack{
                    Text("DIAS DA SEMANA QUE EU USO")
                        .font(Font.custom("SF Pro", size: 13))
                        .foregroundColor(Color.systemLabelSecondary)
                    HStack{
                        ForEach(0..<7) { position in
                            CircleDayButton(dayString: daysWeek[position], selectedButton: daysWeekChoose[position])
                        }
                    }
                    
                }
                .padding(.all, 8)
                
                VStack{
                    Text("CATEGORIA")
                        .font(Font.custom("SF Pro", size: 13))
                        .foregroundColor(Color.systemLabelSecondary)
                    HStack{
                        RectangleCategoryButton(categoryString: categories[0].0, selectedButton: categories[0].1)
                        RectangleCategoryButton(categoryString: categories[1].0, selectedButton: categories[1].1)
                    }
                    HStack{
                        RectangleCategoryButton(categoryString: categories[2].0, selectedButton: categories[2].1)
                        RectangleCategoryButton(categoryString: categories[3].0, selectedButton: categories[3].1)
                    }
                }
                .padding(.all, 8)
                
                VStack{
                    Button {
                        //add produto na rotina
                        dismiss()
                    } label: {
                        Text("Salvar")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .customButtonStyle(buttonType: .largeRounded)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Excluir")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .customButtonStyle(buttonType: .largeRounded)
                }
                .padding(.top, 18)
                .padding(.horizontal, 30)
            }
        }
        .navigationTitle("Adicionar Produto")
        
    }
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
}

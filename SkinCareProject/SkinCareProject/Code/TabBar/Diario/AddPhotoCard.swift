//
//  AddPhotoCard.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 08/08/23.
//

import SwiftUI

struct AddPhotoCard: View {
    @State private var showSheet: Bool = false
    @State var changeProductImage = false
    @State var chosePhoto = false
    @State var openCameraRoll = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        VStack {
            ZStack {
                Button {
                    chosePhoto.toggle()
                    
                } label: {
                    ZStack{
                        Color.componentFill
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
                .multilineTextAlignment(.center)    }
    }
}

       

struct AddPhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        AddPhotoCard()
    }
}

//
//  ProfileView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if changeProfileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }
            else{
                Image("ProfileDefault")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }
            Button {
                chosePhoto.toggle()
                
            } label: {
                Image(systemName: "plus")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(Circle())
            }
            .confirmationDialog("Como você quer colocar a sua foto?", isPresented: $chosePhoto, titleVisibility: .visible) {
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
                ImagePicker(selectedImage: $image, changeImage: $changeProfileImage, sourceType: sourceType)
            }

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

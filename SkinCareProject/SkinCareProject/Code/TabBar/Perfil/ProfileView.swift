//
//  ProfileView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm = CloudKitModel()
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    let skinQuiz: [(String, String)] = [("Gênero e Idade", "star"), ("Tipo de Pele","star"), ("Fotótipo", "star"), ("Condições de Pele", "star"), ("Preocupações com a Pele", "star")]
    let about: [String] = ["Termos e condições", "Politica de privacidade"]
    let account: [String] = ["Sair", "Apagar conta"]
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    ZStack(alignment: .bottomTrailing) {
                        //tirar esse if e colocar para pegar a foto do usuário que no padrao vai ser a "ProfileDefault"
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
                    VStack{
                        HStack{
                            Text("Oi, ")
                                .font(Font.custom("SF Pro", size: 34)
                                    .weight(.bold))
                            Spacer()
                        }
                        HStack{
                            Text("\(vm.userName)!")
                                .font( Font.custom("SF Pro", size: 34)
                                    .weight(.bold))
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .padding(.all)
                List {
                    Section("QUIZ DA PELE") {
                        ForEach(0..<skinQuiz.count) { position in
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image(systemName: skinQuiz[position].1)
                                        .foregroundColor(Color.brandPink)
                                    Text(skinQuiz[position].0)
                                }
                            }
                            
                        }
                    }
                    Section("SOBRE") {
                        ForEach(about, id: \.self) { aboutText in
                            NavigationLink {
                                //
                            } label: {
                                Text(aboutText)
                            }
                        }
                    }
                    Section("CONTA") {
                        ForEach(account, id: \.self) { accountText in
                            NavigationLink {
                                //
                            } label: {
                                Text(accountText)
                            }
                        }
                    }
                }
            }
            .background(Color.systemBG)
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

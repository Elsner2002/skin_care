//
//  ProfileView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var vm: CloudKitModel

    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    let skinQuiz: [String] = ["Gênero e Idade", "Tipo de Pele", "Fotótipo", "Condições de Pele", "Ambiente", "Preocupações com a Pele", "Preferência"]
    let about: [String] = ["Termos e condições", "Politica de privacidade"]
    let account: [String] = ["Apagar conta"]
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    ZStack(alignment: .bottomTrailing) {
                        //tirar esse if e colocar para pegar a foto do usuário que no padrao vai ser a "ProfileDefault"
//                        if changeProfileImage {
//                            Image(uiImage: image)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 120, height: 120)
//                                .clipShape(Circle())
//                        }
                            if let url = vm.user[0].profileImage, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                                Image(uiImage: imageProduct)
                                    .resizable()
                                    .scaledToFill()
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
                            .onDisappear {
                                if changeProfileImage {
                                    vm.user[0].updateImage(newImage: CloudKitUtility.makeURL(image: image))
                                }
                            }
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
                                switch position {
                                case 0: QuestionnairePage1(buttonLabel: .save)
                                case 1: QuestionnairePage2(buttonLabel: .save)
                                case 2: QuestionnairePage3(buttonLabel: .save)
                                case 3: QuestionnairePage4(buttonLabel: .save)
                                case 4: QuestionnairePage6(buttonLabel: .save)
                                case 5: QuestionnairePage5(buttonLabel: .save)
                                case 6: QuestionnairePage7(buttonLabel: .save)
                                default:
                                    EmptyView()
                                }
                            } label: {
                                HStack {
                                    Image("QuestionnaireSymbol")
                                        .foregroundColor(Color.brandPink)
                                    Text(skinQuiz[position])
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

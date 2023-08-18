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
    @State var image = Constants.shared.loadImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingPopover = false
    @State private var returnToStart = false
    
    let skinQuiz: [String] = ["Gênero e Idade", "Tipo de Pele", "Fotótipo", "Condições de Pele", "Ambiente", "Preocupações com a Pele", "Preferência"]
    let about: [String] = ["Termos e condições", "Politica de privacidade"]
    let account: String = "Apagar conta"
    
    func deleteUser() {
        //delete user
        vm.deleteUser(publicDb: false)
        
        //user default first time here ir pra true
        UserDefaults.standard.set(true, forKey: "firstTimeHere")
        Constants.shared.saveImage(image: UIImage(named: "ProfileDefault")!)
        
        returnToStart.toggle()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.systemBG
                    .ignoresSafeArea()
                VStack{
                    HStack (spacing: 20){
                        ZStack(alignment: .bottomTrailing) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                            
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
                                        Constants.shared.saveImage(image: image)
                                        //vm.user[0].updateImage(newImage: CloudKitUtility.makeURL(image: image))
                                    }
                                }
                        }
                        
                        VStack{
                            HStack{
                                Text("Oi, ")
                                    .font( Font.custom("New York", size: 34)
                                        .weight(.bold))
                                    .fontDesign(.serif)
                                Spacer()
                            }
                            HStack{
                                Text("\(vm.userName)!")
                                    .font( Font.custom("New York", size: 34)
                                        .weight(.bold))
                                    .fontDesign(.serif)
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
                        } .listRowBackground(Color.systemMaterialSecondary)
                        Section("SOBRE") {
                            ForEach(about, id: \.self) { aboutText in
                                NavigationLink {
                                    if aboutText == "Politica de privacidade" {
                                        PolicyView()
                                    }
                                    else {
                                        TermsView()
                                    }
                                } label: {
                                    Text(aboutText)
                                }
                            }
                        } .listRowBackground(Color.systemMaterialSecondary)
                        Section("CONTA") {
                            Button {
                                showingPopover = true
                            } label: {
                                Text(account)
                                    .foregroundColor(Color.systemLabel)
                            }  .alert("Apagar Conta", isPresented: $showingPopover) {
                                Button("Voltar", role: .cancel) { }
                                Button("Apagar", role: .destructive) {
                                    deleteUser()
                                    if returnToStart {
                                        NavigationLink(destination: TabBarQuest()
                                            .navigationBarBackButtonHidden(true)
                                            .environmentObject(vm),
                                                       label: { Text("")
                                        })
                                    }
                                }
                            }
                        } .listRowBackground(Color.systemMaterialSecondary)
                    }
                    .scrollIndicators(.hidden)
                    .background(Color.systemBG)
                    .scrollContentBackground(.hidden)
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

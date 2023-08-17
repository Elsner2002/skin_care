//
//  HomeView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI
import CloudKit

struct HomeView: View {
    @EnvironmentObject var vm: CloudKitModel

    var routineImages: [String] = ["sun.max.fill", "moon.stars.fill"]
    var routineColor: [Color] = [Color.brandPink, Color.brandGreen]
    @State var routineList: [Routine] = [Constants.shared.dayRoutine, Constants.shared.nightRoutine]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    HStack{
                        if let url = vm.user[0].profileImage, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                            Image(uiImage: imageProduct)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 87, height: 87)
                                .clipShape(Circle())
                                .padding(.leading, 28)
                        }
                        VStack{
                            HStack{
                                Text("Oi, ")
                                    .font(.system(size: 34))
                                    .fontDesign(.serif)
                            }
                            HStack{
                                Text("\(vm.userName)!")
                                    .font(.system(size: 34))
                                    .fontDesign(.serif)
//                                        .weight(.bold))
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Text("Rotinas")
                            .font(Font.custom("SF Pro", size: 20)
                                .weight(.semibold))
                        Spacer()
                    }
                    .padding(.leading, 28)
                    
                    HStack{
                        ForEach(0..<routineImages.count) { position in
                            NavigationLink {
                                RoutineView(routine: routineList[position])
                                    .environmentObject(vm)
                            } label: {
                                RoutineButton(image: Image(systemName: routineImages[position]), color: routineColor[position])
                            }
                        }
                    }
                    .padding()
                    
                    HStack{
                        Text("Recomendados para você")
                            .font(Font.custom("SF Pro", size: 18)
                                .weight(.regular))
                        Spacer()
                    }
                    .padding(.leading, 14)
                    
                    HorizontalScrollProductsView()
                    
                    HStack{
                        Text("Dica do Dia")
                            .font(Font.custom("SF Pro", size: 18)
                                .weight(.regular))

                        Spacer()
                    }
                    .padding(.leading, 28)
                    TipsView(tip: Constants.shared.randomTip!)
                    
                    
                } .onAppear{
                    UserDefaults.standard.set(false, forKey: "firstTimeHere")
                }
            }
            .navigationTitle("Peach")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}

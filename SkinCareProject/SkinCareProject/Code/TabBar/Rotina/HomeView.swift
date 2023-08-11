//
//  HomeView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI
import CloudKit

struct HomeView: View {
    @StateObject private var vm = Constants.shared.vm
    
    var routineImages: [String] = ["sun.max.fill", "moon.stars.fill"]
    var routineColor: [Color] = [Color.brandPink, Color.brandGreen]
    var routineList: [Routine] = [Routine(name: "Rotina Diurna", completition: 0, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: []), Routine(name: "Rotina Noturna", completition: 0, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    HStack{
                        Image("ProfileDefault")
                            .resizable()
                            .frame(width: 87, height: 87)
                            .clipShape(Circle())
                            .padding(.leading, 28)
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
                    .padding(.vertical)
                    
                    HStack{
                        Text("Rotinas")
                            .font(Font.custom("SF Pro", size: 22)
                                .weight(.bold))
                        Spacer()
                    }
                    .padding(.leading, 28)
                    
                    HStack{
                        ForEach(0..<routineImages.count) { position in
                            NavigationLink {
                                RoutineView(routine: routineList[position])
                            } label: {
                                RoutineButton(image: Image(systemName: routineImages[position]), color: routineColor[position])
                            }
                        }
                    }
                    .padding()
                    
                    HStack{
                        Text("Recomendados para seu tipo de pele")
                            .font(Font.custom("SF Pro", size: 15)
                                .weight(.bold))
                        Spacer()
                    }
                    .padding(.leading, 28)
                    
                    HorizontalScrollProductsView()
                    
                    HStack{
                        Text("Dica do Dia")
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 15)
                   // TipsView(tip: Constants.shared.randomTip!)
                    
                    
                } .onAppear{
                    UserDefaults.standard.set(false, forKey: "firstTimeHere")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}

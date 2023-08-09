//
//  RoutineSheet.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 04/08/23.
//

import SwiftUI

struct RoutineView: View {
    @State private var showSheet: Bool = false
    let routine: Routine

    var body: some View {
        NavigationStack {
            ZStack {
                //background: day/night
                if routine.name == "Rotina Noturna"{
                    Color(red: 0.16, green: 0.39, blue: 0.47)
                        .ignoresSafeArea()
                        .brightness(0.07)
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .frame(width: 226, height: 243, alignment: .top)
                        .position(CGPoint(x: 226, y: 212.66409))
                        .foregroundColor(Color.brandGreen)
                        .brightness(0.05)
                    
                } else {
                    Color(red: 0.6, green: 0.76, blue: 0.75)
                        .ignoresSafeArea()
                        .brightness(0.07)
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .frame(width: 216, height: 212.66409, alignment: .top)
                        .position(CGPoint(x: 216, y: 212.66409))
                        .foregroundColor(Color.brandPink)
                        .brightness(0.02)
                }
                
                Button (""){
                }
                .sheet(isPresented: $showSheet){
                    SheetRoutine(routine: routine)
                        .presentationDetents([.fraction(0.7), .medium])
                        .presentationDragIndicator(.hidden)
                        .interactiveDismissDisabled()
                        .presentationCornerRadius(40)
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .medium)
                        )
                    
                }
                .onAppear {
                    showSheet = true
                }
            }
        }
    }
}

struct SheetRoutine: View {
    let routine: Routine
    var listLimpeza: ListView
    var listTratamentos: ListView
    var listHidratante: ListView
    var listProtetor: ListView
    
    init(routine: Routine) {
        self.routine = routine
        self.listLimpeza = ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza", routine: routine)
        
        self.listTratamentos = ListView(description: "Segundo passo: Use seu tônico e produtos de tratamento nesta etapa, adicione quantos você quiser", category: "Tônicos & Tratamentos", routine: routine)
        
        self.listHidratante = ListView(description: "Terceiro passo: Aplique seus produtos com componentes hidratantes", category: "Hidratante", routine: routine)
        
        self.listProtetor = ListView(description: "Quarto passo: Aplique uma generosa camada do seu protetor solar e proteja-se contra os raios UVA e UVB", category: "Protetor Solar", routine: routine)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.systemBG.ignoresSafeArea()
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        RoutineProgress(title: routine.name, completion: routine.completition)
                            .padding(EdgeInsets(top: 38, leading: 24, bottom: 32, trailing: 24))
                        if routine.name == "Rotina Noturna" {
                            RoutineAlarm(title: "Noite", time: Constants.shared.nightTime, isOn: Constants.shared.nightNotification)
                        } else {
                            RoutineAlarm(title: "Dia", time: Constants.shared.morningTime, isOn: Constants.shared.morningNotification)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Meus produtos")
                                .font(
                                    Font.custom("SF Pro", size: 20)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color.systemLabelPrimary)
                                .padding(.top, 32)
                                .padding(.bottom, -10)
                            
                            listLimpeza
                            listTratamentos
                            listHidratante
                            
                            if routine.name != "Rotina Noturna" {
                                listProtetor
                            }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.systemBG)
                }
            }
        }
    }
}

struct RoutineView_Previews: PreviewProvider {
    static let url: URL = CloudKitUtility.makeURLJPG(image: "gato-cinza")
    static let array: [RoutineProduct] = [RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza"])!]
    
    static var previews: some View {
        RoutineView(routine: Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: []))
    }
}

//
//  RoutineSheet.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 04/08/23.
//

import SwiftUI

struct RoutineView: View {
    @State private var showSheet: Bool = false
    @Environment(\.dismiss) private var dismiss
    let routine: Routine
    var scaleEffect: CGFloat = 1 //0.67 when smaller
    var offsetValue: CGFloat = -200 //define when smaller -300?
    
    var body: some View {
        NavigationStack {
            ZStack {
                //background: day/night
                if routine.name == "Rotina Noturna"{
                    Color(UIColor(Color.brandPink))
                        .ignoresSafeArea()
                        .brightness(0.07)
                    HStack (alignment: .center) {
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .frame(width: 212.66409, height: 226, alignment: .top)
                            .offset(y: offsetValue)
                            .foregroundColor(Color.brandGreen)
                            .brightness(0.05)
                            .scaleEffect(scaleEffect)
                    }
                    
                } else {
                    Color(UIColor(Color.brandGreen))
                        .ignoresSafeArea()
                        .brightness(0.07)
                    HStack (alignment: .center) {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 212.66409, height: 216, alignment: .top)
                            .offset(y: offsetValue)
                            .foregroundColor(Color.brandPink)
                            .brightness(0.02)
                            .scaleEffect(scaleEffect)
                    }
                }
                
                Button (""){
                }
                .sheet(isPresented: $showSheet){
                    Sheet(routine: routine)
                        .presentationDetents([.fraction(0.7), .medium])
                        .presentationDragIndicator(.hidden)
                        .interactiveDismissDisabled()
                        .presentationCornerRadius(40)
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .medium)
                        )
                    // .preferredColorScheme(.dark)
                }
                .onAppear {
                    showSheet = true
                }
            }
        } .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       dismiss()
                        showSheet = false
                    } label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .frame(width: 12.5, height: 22)
                        }
                        .foregroundColor(Color.black)
                    }
                }
            }
        
    }
}

struct Sheet: View {
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
                            RoutineAlarm(title: "Manhã", time: Constants.shared.morningTime, isOn: Constants.shared.morningNotification)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Meus produtos")
                                .font(
                                    Font.custom("SF Pro", size: 28)
                                        .weight(.bold)
                                )
                                .padding()
                                .foregroundColor(Color.systemLabelPrimary)
                                .padding(.bottom, -20)
                            
                            listLimpeza
                            listTratamentos
                            listHidratante
                            
                            if routine.name != "Rotina Noturna" {
                                listProtetor
                            }
                            Spacer()
                        } .padding()
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
        // .preferredColorScheme(.dark)
    }
}

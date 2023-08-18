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
    @EnvironmentObject var vm: CloudKitModel
    
    @State var routine: Routine
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
                    SheetRoutine(routine: $routine, listLimpeza: ListView(description: "Primeiro passo: Comece higienizando seu rosto e retirando impurezas", category: "Limpeza", productList: $routine.categoryLimpeza, routine: $routine), listTratamentos: ListView(description: "Segundo passo: Use seu tônico e produtos de tratamento nesta etapa, adicione quantos você quiser", category: "Tônicos & Tratamentos", productList: $routine.categoryTratamentos,  routine: $routine), listHidratante: ListView(description: "Terceiro passo: Aplique seus produtos com componentes hidratantes", category: "Hidratante", productList: $routine.categoryHidratante,  routine: $routine), listProtetor: ListView(description: "Quarto passo: Aplique uma generosa camada do seu protetor solar e proteja-se contra os raios UVA e UVB", category: "Protetor Solar", productList: $routine.categoryProtetor,  routine: $routine))
                        .environmentObject(Constants())
                        .presentationDetents([.fraction(0.7), .medium])
                        .presentationDragIndicator(.hidden)
                        .interactiveDismissDisabled()
                        .presentationCornerRadius(40)
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .medium)
                        )
                }
                .onAppear {
                    vm.routineProducts.forEach { product in
                        let category: String = product.categories[0]
                        if product.routine == routine.name {
                            switch category {
                            case ProductCategory.moisturizer.rawValue:
                                routine.categoryHidratante.append(product)
                            case ProductCategory.treatment.rawValue:
                                routine.categoryTratamentos.append(product)
                            case ProductCategory.sunscreen.rawValue:
                                routine.categoryProtetor.append(product)
                            default:
                                routine.categoryLimpeza.append(product)
                            }
                        }
                    }
                    showSheet = true
                }
                .onDisappear{
                    routine.categoryHidratante.removeAll()
                    routine.categoryLimpeza.removeAll()
                    routine.categoryProtetor.removeAll()
                    routine.categoryTratamentos.removeAll()
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

struct SheetRoutine: View {
    @Binding var routine: Routine
    @EnvironmentObject var constants: Constants
    @EnvironmentObject var vm: CloudKitModel
    
    @State var completedProducts: Int = 0
    @State var totalProducts: Int = 0
    
    var listLimpeza: ListView
    var listTratamentos: ListView
    var listHidratante: ListView
    var listProtetor: ListView
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.systemBG.ignoresSafeArea()
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        RoutineProgress(title: routine.name, completion: routine.completition, totalProducts: totalProducts)
                            .padding(EdgeInsets(top: 38, leading: 24, bottom: 32, trailing: 24))
                        if routine.name == "Rotina Noturna" {
                            RoutineAlarm(title: "Noite", time: $constants.nightTime, isOn: $constants.nightNotification)
                        } else {
                            RoutineAlarm(title: "Manhã", time: $constants.morningTime, isOn: $constants.morningNotification)
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
            .onAppear{
                vm.routineProducts.forEach { product in
                    let category: String = product.categories[0]
                    if product.routine == routine.name {
                        totalProducts += 1
                        if product.isCompleted {
                            completedProducts += 1
                        }
                        routine.completition = completedProducts
                    }
                }
            }
        }
    }
    
    struct RoutineView_Previews: PreviewProvider {
        static let url: URL = CloudKitUtility.makeURLJPG(image: "gato-cinza")
        static let array: [RoutineProduct] = [RoutineProduct(image: url, name: "test", brand: "test", isCompleted: false, barcode: 12345, frequency: [1], categories: ["Limpeza"], routine: "Rotina Diurna")!]
        
        static var previews: some View {
            RoutineView(routine: Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: []))
        }
    }
}

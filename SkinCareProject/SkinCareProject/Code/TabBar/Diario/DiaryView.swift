//
//  JournalView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct DiaryView: View {
    @State private var showSheet: Bool = false
    @State var date: Date = Date.now
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                GraphicPicker(selectedDate: $date)
                    .padding(EdgeInsets(top: -157, leading: 0, bottom: 0, trailing: 0))
                    .onChange(of: date, perform: { newValue in
                        showSheet = true
                    })
            
                Button (""){
                    showSheet.toggle()
                }
                .sheet(isPresented: $showSheet){
                    SheetDiary(date: date)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(40)
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .large)
                        )
                    
                }
            }
            .navigationTitle("Diário")
        }
    }
}


struct SheetDiary: View {
    @State var notes: String = ""
    @State var dayRoutineProgress = 2
    @State var nightRoutineProgress = 0
    @StateObject var vm = CloudKitModel()
    var date: Date

    var body: some View {
        NavigationStack {
            ZStack {
                Color.systemBG.ignoresSafeArea()
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        Spacer(minLength: 20)
                        AddPhotoCard()
                            .padding(EdgeInsets(top: 38, leading: 24, bottom: 20, trailing: 24))
                        VStack(alignment: .leading) {
                            Text("ROTINAS DO DIA")
                                .foregroundColor(.systemLabelSecondary)
                                .padding(EdgeInsets(top: 20, leading: 32, bottom: 10, trailing: 32))
                            VStack(spacing: 20) {
                                RoutineProgress(title: "Rotina Diurna", completion: dayRoutineProgress)
                                RoutineProgress(title: "Rotina Noturna", completion: nightRoutineProgress)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("ANOTAÇÕES")
                                .foregroundColor(.systemLabelSecondary)
                                .padding(EdgeInsets(top: 20, leading: 32, bottom: 10, trailing: 32))
                            
                            TextField("", text: $notes, axis: .vertical)
                                .textFieldStyle(.roundedBorder)
                                .lineLimit(6, reservesSpace: true)
                                .background(Color.textfield)
                                .cornerRadius(10)
                        }
                        .frame(width: 349.82715, height: 161, alignment: .topLeading)
                        
                        Spacer(minLength: 90)
                        
                        VStack {
                            CustomButton(label: "Salvar", action: {}, description: "", buttonType: .largeRounded)
                            CustomButton(label: "Excluir", action: {}, description: "", buttonType: .largeRounded)                         
                        }
                        .frame(width: 324, alignment: .center)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.systemBG).ignoresSafeArea()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

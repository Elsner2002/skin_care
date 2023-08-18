//
//  CreateProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 01/08/23.
//

import SwiftUI

struct CreateProductView: View {    
    @Environment(\.dismiss) var dismiss
    @Binding var routine: Routine
    @EnvironmentObject var vm: CloudKitModel
    @State var saveConfirm = false
    
    @State var changeProductImage = false
    @State var openCameraRoll = false
    @State var chosePhoto = false
    @State var image = UIImage()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var productName: String = ""
    @State var productBrand: String = ""
    let daysWeek: [String] = ["S", "T", "Q", "Q", "S", "S", "D"]
    let daysValue: [Int] = [1, 2, 3, 4, 5, 6, 7]
    @State var frequency: [Int] = []
    @State var selectedCategory: String = ""
    var categories: [ProductCategory] = [.moisturizer, .sunscreen, .cleanser, .treatment]
    
    //optional info you might get from
    var ckName: String?
    var ckBrand: String?
    var ckImage: URL?
    var ckCategory: String?
    var ckFrequency: [Int]?
    
    func saveProduct() {
        //creates routine product object
        let newProduct: RoutineProduct = RoutineProduct(image: CloudKitUtility.makeURL(image: image), name: productName, brand: productBrand, isCompleted: false, barcode: 0, frequency: frequency, categories: [selectedCategory], routine: routine.name)!
        
        //adds in Cloudkit
        vm.addProduct(publicDb: false, name: productName, recordType: CloudKitUtility.CloudKitTypes.RoutineProduct, newProduct: newProduct)
        
        //adds in Routine
        switch selectedCategory {
        case ProductCategory.moisturizer.rawValue:
            routine.categoryHidratante.append(newProduct)
        case ProductCategory.treatment.rawValue:
            routine.categoryTratamentos.append(newProduct)
        case ProductCategory.sunscreen.rawValue:
            routine.categoryProtetor.append(newProduct)
        default:
            routine.categoryLimpeza.append(newProduct)
        }
        
        vm.fetchItems(publicDb: false, recordType: CloudKitUtility.CloudKitTypes.RoutineProduct)
    }
    
    var body: some View {
        ZStack {
            if routine.name == "Rotina Diurna" {
                Color.brandGreen.ignoresSafeArea()
            } else {
                Color.brandPink.ignoresSafeArea()
            }
            Rectangle()
                .offset(y: 350)
                .ignoresSafeArea()
                .foregroundColor(Color.systemBG)
            VStack {
                HStack (alignment: .center){
                    Button {
                        dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .frame(width: 12.5, height: 22)
                        }
                        .foregroundColor(Color.black)
                    }
                    Spacer()
                    Text("Adicionar produto")
                        .font(Font.custom("SF Pro", size: 18))
                        .padding(.trailing, 16)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, 20)
                .padding(.top, 20)
                
                ScrollView(showsIndicators: false){
                    VStack {
                        //camera
                        VStack{
                            ZStack {
                                Button {
                                    chosePhoto.toggle()
                                } label: {
                                    ZStack{
                                        Color.systemMaterial
                                        if changeProductImage || ckName != nil {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 163, height: 167, alignment: .topLeading)
                                                .clipShape(Rectangle())
                                        }
                                        else{
                                            Image(systemName: "camera.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Rectangle())
                                                .foregroundColor(.brandGray)
                                        }
                                    }
                                    .padding(0)
                                    .frame(width: 163, height: 167, alignment: .topLeading)
                                    .cornerRadius(15)
                                }
                                .padding(.top, 20)
                                .confirmationDialog("Como você quer colocar a foto do produto?", isPresented: $chosePhoto, titleVisibility: .visible) {
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
                                ImagePicker(selectedImage: $image, changeImage: $changeProductImage, sourceType: sourceType)
                            }
                            Text("adicionar foto")
                                .font(Font.custom("SF Pro", size: 12))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.all, 8)
                        
                        //name and brand
                        VStack (alignment: .leading){
                            
                            Text("ADICIONAR DETALHES DO PRODUTO")
                                .font(Font.custom("SF Pro", size: 13))
                                .foregroundColor(Color.systemLabelSecondary)
                                .multilineTextAlignment(.leading)
                            
                            CreateProductTextField(productName: $productName, title: "Nome", subTitle: "Nome do produto")
                            
                            CreateProductTextField(productName: $productBrand, title: "Marca", subTitle: "Marca do produto")
                        }
                        .padding(.all, 8)
                        
                        //days frequency
                        VStack (alignment: .leading){
                            Text("DIAS DA SEMANA QUE EU USO")
                                .font(Font.custom("SF Pro", size: 13))
                                .foregroundColor(Color.systemLabelSecondary)
                            HStack{
                                ForEach(0..<7) { position in
                                    CircleDayButton(dayString: daysWeek[position], frequencyDescription: daysValue[position], frequency: $frequency)
                                }
                            }
                        }
                        .padding(.all, 8)
                        
                        //categories
                        VStack (alignment: .leading){
                            Text("CATEGORIA")
                                .font(Font.custom("SF Pro", size: 13))
                                .foregroundColor(Color.systemLabelSecondary)
                            HStack{
                                RectangleCategoryButton(categoryString: categories[0].rawValue, selected: $selectedCategory)
                                RectangleCategoryButton(categoryString: categories[1].rawValue, selected: $selectedCategory)
                            }
                            HStack{
                                RectangleCategoryButton(categoryString: categories[2].rawValue, selected: $selectedCategory)
                                RectangleCategoryButton(categoryString: categories[3].rawValue, selected: $selectedCategory)
                            }
                        }
                        .padding(.all, 8)
                        
                        //save and delete
                        VStack{
                            if !(productName.isEmpty) && !(productBrand.isEmpty) && !(frequency.isEmpty) && !(selectedCategory.isEmpty) && !(image == nil) {
                                ZStack {
                                    CustomButton(label: "Salvar", description: "", buttonType: .largeRounded, action: {
                                        saveProduct()
                                        dismiss()
                                    })
                                }
                                .padding()
                            } else {
                                ZStack {
                                    CustomButton(label: "Salvar", description: "", buttonType: .largeRounded, action: {saveConfirm.toggle()
                                    })
                                }
                                .confirmationDialog("Preencha todos os campos para salvar!", isPresented: $saveConfirm, titleVisibility: .visible) {
                                    Button("Voltar", role: .cancel) {
                                    }
                                }
                                .padding()
                            }
                            CustomButton(label: "Excluir", description: "", buttonType: .largeRounded, action: {dismiss()})
                                .padding()
                                .padding(.top, -30)
                        }
                        .padding(.top, 18)
                        .padding(.horizontal, 30)
                    }
                }
                .background(Color.systemBG)
                .cornerRadius(40)
            }
        } .navigationBarBackButtonHidden(true)
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
                if ckName != nil {
                    productName = ckName!
                    productBrand = ckBrand!
                    selectedCategory = ckCategory!
                    if let url = ckImage, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                        image = imageProduct
                    }
                }
                if ckFrequency != nil{
                    frequency = ckFrequency!
                }
            }
    }
    
//    init() {
//        UITextField.appearance().clearButtonMode = .whileEditing
//    }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView(routine: .constant(Routine(name: "Rotina Diurna", completition: 2, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])), ckName: nil, ckBrand: nil, ckImage: nil, ckCategory: nil, ckFrequency: nil)
    }
}

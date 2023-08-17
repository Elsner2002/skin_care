//
//  ListProductComponent.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct ListProductComponent: View {
    @Binding var product: RoutineProduct
    @EnvironmentObject var vm: CloudKitModel
    var image: UIImage?
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            
            if let url = product.image, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                Image(uiImage: imageProduct)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
            
            
            VStack(alignment: .leading, spacing: -4) {
                Text(product.name)
                //.font(Font.custom("SF Pro", size: 17))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                Text(product.categories[0])
                    .font(Font.custom("SF Pro", size: 13)) //.caption
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 18, maxHeight: 18, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
            
            Button {
                withAnimation {
                    product.isCompleted.toggle()
                    HapticService.instance.impact(style: .light)
                }
                vm.updateItemCheck(publicDb: false, routineProduct: product, recordType: CloudKitUtility.CloudKitTypes.RoutineProduct, completition: product.isCompleted)
            } label: {
                if product.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color.brandPink)
                        .frame(width: 23, height: 23, alignment: .center)
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .foregroundColor(Color.brandPink)
                        .frame(width: 23, height: 23, alignment: .center)
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, minHeight: 75, maxHeight: 75, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
    }
}

struct ListProductComponent_Previews: PreviewProvider {
    static let url: URL? = URL(string: "https://google.com")
    static let product: RoutineProduct = RoutineProduct(image: url, name: "name", brand: "test", isCompleted: false, barcode: 1234, frequency: [1], categories: ["Limpeza"], routine: "Rotina Diurna")!
    
    static var previews: some View {
        ListProductComponent(product: .constant(product))
    }
}

//
//  ListProductComponent.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 02/08/23.
//

import SwiftUI

struct ListProductComponent: View {
    let product: RoutineProduct
    var image: UIImage?
    
    init(product: RoutineProduct) {
        self.product = product
        self.image = CloudKitUtility().image(url: product.image) ?? UIImage(named: "logo")
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 42, height: 42)
              .background(
                VStack {
                    if let image = image{
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 42, height: 42)
                            .clipped()
                    }
                }
              )
            
            VStack(alignment: .leading, spacing: -4) {
                Text(product.name)
                  .font(Font.custom("SF Pro", size: 17))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                Text(product.categories[0])
                  .font(Font.custom("SF Pro", size: 13))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, minHeight: 18, maxHeight: 18, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
            Button {
                product.isCompleted.toggle()
            } label: {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.brandPink)
                    .frame(width: 18, height: 22, alignment: .center)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
    }
}

struct ListProductComponent_Previews: PreviewProvider {
    static let url: URL? = URL(string: "https://google.com")
    static let product: RoutineProduct = RoutineProduct(image: url, name: "name", brand: "test", isCompleted: false, barcode: 1234, frequency: [1], categories: ["Limpeza"])!
    
    static var previews: some View {
        ListProductComponent(product: product)
    }
}

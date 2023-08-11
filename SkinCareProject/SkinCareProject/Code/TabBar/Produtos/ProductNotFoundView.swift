//
//  ProductNotFoundView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 10/08/23.
//

import SwiftUI

struct ProductNotFoundView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var showCreateProduct: Bool
    @State var isShowingCreateProductView: Bool = false
    
    var body: some View {
        VStack{
            Text("Não encontramos este produto")
                .font(
                Font.custom("SF Pro", size: 22)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.systemLabelSecondary)
                .frame(width: 329, alignment: .top)
                .padding(.top, 161)
            Text("no nosso banco de dados")
                .font(
                Font.custom("SF Pro", size: 22)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.systemLabelSecondary)
                .frame(width: 329, alignment: .top)
            
            Image("NotFoundImage")
                .frame(width: 57, height: 64)
                .padding(.top, 76)
            
            VStack{
                if showCreateProduct{
                    CustomButton(label: "Cadastrar Produto", action: {
                        self.isShowingCreateProductView = true
                    }, description: "", buttonType: .largeRounded)
                }
                CustomButton(label: "Voltar", action: {
                    dismiss()
                }, description: "", buttonType: .largeRounded)
                
                NavigationLink(isActive: self.$isShowingCreateProductView, destination: { CreateProductView() }, label: { EmptyView() })
            }
            .padding(.horizontal, 33)
            .padding(.bottom, 85)
            .padding(.top, 245)

        }
    }
}

struct ProductNotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNotFoundView(showCreateProduct: true)
    }
}

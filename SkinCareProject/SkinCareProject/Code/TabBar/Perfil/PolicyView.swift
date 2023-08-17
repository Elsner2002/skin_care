//
//  PolicyView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 17/08/23.
//

import SwiftUI

struct PolicyView: View {
    
    var terms: String = ""
    
    var body: some View {
        ScrollView{
            Text(terms)
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.custom("SF Pro", size: 15))
                .foregroundColor(Color.systemLabelPrimary)
                .frame(width: 327, height: 136, alignment: .topLeading)
                .padding(.vertical, 20)
        }
    }
}

struct PolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}

/*
 POLÍTICA DE PRIVACIDADE DO APLICATIVO\n\nÚltima atualização: 16/08/2023\n\nA equipe do Peach se preocupa com a sua privacidade e está comprometida em proteger as suas informações pessoais. Esta Política de Privacidade descreve como coletamos, usamos, compartilhamos e protegemos as suas informações pessoais ao utilizar o nosso aplicativo Peach.\n\nAo utilizar o Aplicativo, você concorda com a coleta e utilização das suas informações pessoais de acordo com esta Política de Privacidade. Se você não concorda com esta Política de Privacidade, por favor, não utilize o Aplicativo.\n\n1. Informações Coletadas\n\nColetamos informações que você nos fornece diretamente ao utilizar o Aplicativo, como o seu nome, endereço de e-mail, informações de login e outras informações pessoais que você escolher compartilhar.\n\n2. Uso das Informações\n\nUtilizamos as informações coletadas para:\n\nFornecer e melhorar o Aplicativo;\nPersonalizar a sua experiência de uso;\nEnviar comunicações relacionadas ao Aplicativo;\nMonitorar a utilização do Aplicativo para melhorar o desempenho e a usabilidade.\n\n3. Compartilhamento de Informações\n\nNão compartilhamos as suas informações pessoais com terceiros, exceto em situações limitadas, como:

 Quando você nos autoriza explicitamente a compartilhar suas informações;
 Para cumprir obrigações legais;
 Para proteger os direitos, propriedade ou segurança da [Nome da Empresa] ou de terceiros.
 4. Segurança

 Empregamos medidas de segurança técnicas e organizacionais para proteger as suas informações pessoais contra acesso não autorizado, uso indevido ou divulgação. No entanto, nenhum método de transmissão pela internet ou método de armazenamento eletrônico é completamente seguro, e não podemos garantir a segurança absoluta das suas informações.

 5. Cookies e Tecnologias Semelhantes

 Utilizamos cookies e tecnologias semelhantes para coletar informações sobre o uso do Aplicativo e melhorar a sua experiência. Você pode optar por não aceitar cookies nas configurações do seu navegador, mas isso pode afetar a funcionalidade do Aplicativo.

 6. Menores de Idade

 O Aplicativo não é direcionado a menores de idade. Não coletamos intencionalmente informações pessoais de menores de 13 anos. Se tomarmos conhecimento de que coletamos informações de um menor de 13 anos, tomaremos medidas para excluir essas informações o mais rápido possível.

 7. Alterações na Política de Privacidade

 Reservamos o direito de modificar esta Política de Privacidade a qualquer momento, sem aviso prévio. É responsabilidade do usuário revisar periodicamente a Política de Privacidade para estar ciente de quaisquer alterações.
 */

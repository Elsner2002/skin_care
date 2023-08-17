//
//  TermsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 17/08/23.
//

import SwiftUI

struct TermsView: View {
    
    var terms: String = "TERMOS E CONDIÇÕES DE USO DO APLICATIVO\n\nÚltima atualização: 16/08/2023\n\nPor favor, leia atentamente estes Termos e Condições de Uso antes de utilizar o nosso aplicativo Peach. Estes Termos estabelecem os direitos e obrigações entre você e a equipe do Peach, proprietária do Aplicativo. Ao utilizar o Aplicativo, você concorda em cumprir e ficar vinculado a estes Termos. Se você não concorda com estes Termos, por favor, não utilize o Aplicativo.\n\n1. Aceitação dos Termos\n\nAo acessar ou utilizar o Aplicativo, você declara ter lido, compreendido e aceitado estes Termos, bem como nossa Política de Privacidade. Se você não concorda com qualquer parte destes Termos, não está autorizado a utilizar o Aplicativo.\n\n2. Uso do Aplicativo\n\nO Aplicativo destina-se ao uso pessoal e não comercial. Você concorda em não utilizar o Aplicativo para fins ilegais, ofensivos, prejudiciais ou de qualquer forma que viole estes Termos. Além disso, você concorda em não tentar acessar áreas não autorizadas do Aplicativo, realizar engenharia reversa, modificar ou interferir de qualquer forma com o Aplicativo.\n\n3. Conta do Usuário\n\nPara utilizar certas funcionalidades do Aplicativo, você pode precisar criar uma conta de usuário. Você é responsável por manter a confidencialidade de suas informações de login e por todas as atividades que ocorram em sua conta. Você concorda em fornecer informações precisas e atualizadas ao criar sua conta.\n\n4. Privacidade\n\nNossa Política de Privacidade detalha como coletamos, utilizamos e protegemos suas informações pessoais. Ao utilizar o Aplicativo, você concorda com a coleta e utilização de suas informações de acordo com a nossa Política de Privacidade.\n\n5. Propriedade Intelectual\n\nTodo o conteúdo presente no Aplicativo, incluindo mas não limitado a textos, imagens, gráficos, logotipos, ícones e software, é protegido por direitos autorais e outras leis de propriedade intelectual. Você concorda em não reproduzir, distribuir, modificar ou criar obras derivadas do conteúdo do Aplicativo sem nossa autorização por escrito.\n\n6. Limitação de Responsabilidade\n\nO Aplicativo é fornecido \"no estado em que se encontra\" e \"conforme disponível\", sem garantias de qualquer tipo, expressas ou implícitas. Não nos responsabilizamos por quaisquer danos diretos, indiretos, incidentais, especiais ou consequenciais decorrentes do uso ou incapacidade de uso do Aplicativo.\n\n7. Alterações nos Termos\n\nReservamos o direito de modificar estes Termos a qualquer momento, sem aviso prévio. É responsabilidade do usuário revisar periodicamente os Termos para estar ciente de quaisquer alterações. O uso continuado do Aplicativo após as alterações dos Termos constitui a aceitação dessas alterações.\n\n8. Lei Aplicável\n\nEstes Termos serão regidos e interpretados de acordo com as leis do Brasil, sem considerar os princípios de conflitos de leis.\n\nAo utilizar o Aplicativo, você concorda em cumprir estes Termos e qualquer legislação ou regulamentação aplicável. Se você não concorda com estes Termos, por favor, não utilize o Aplicativo."
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text(terms)
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(Color.systemLabelPrimary)
                        .frame(width: 327, height: 2100, alignment: .topLeading)
                        .padding(.vertical, 20)
                }
            }            
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
    }
}


/*
 TERMOS E CONDIÇÕES DE USO DO APLICATIVO\n\nÚltima atualização: 16/08/2023\n\nPor favor, leia atentamente estes Termos e Condições de Uso antes de utilizar o nosso aplicativo Peach. Estes Termos estabelecem os direitos e obrigações entre você e a equipe do Peach, proprietária do Aplicativo. Ao utilizar o Aplicativo, você concorda em cumprir e ficar vinculado a estes Termos. Se você não concorda com estes Termos, por favor, não utilize o Aplicativo.\n\n1. Aceitação dos Termos\n\nAo acessar ou utilizar o Aplicativo, você declara ter lido, compreendido e aceitado estes Termos, bem como nossa Política de Privacidade. Se você não concorda com qualquer parte destes Termos, não está autorizado a utilizar o Aplicativo.\n\n2. Uso do Aplicativo\n\nO Aplicativo destina-se ao uso pessoal e não comercial. Você concorda em não utilizar o Aplicativo para fins ilegais, ofensivos, prejudiciais ou de qualquer forma que viole estes Termos. Além disso, você concorda em não tentar acessar áreas não autorizadas do Aplicativo, realizar engenharia reversa, modificar ou interferir de qualquer forma com o Aplicativo.\n\n3. Conta do Usuário\n\nPara utilizar certas funcionalidades do Aplicativo, você pode precisar criar uma conta de usuário. Você é responsável por manter a confidencialidade de suas informações de login e por todas as atividades que ocorram em sua conta. Você concorda em fornecer informações precisas e atualizadas ao criar sua conta.\n\n4. Privacidade\n\nNossa Política de Privacidade detalha como coletamos, utilizamos e protegemos suas informações pessoais. Ao utilizar o Aplicativo, você concorda com a coleta e utilização de suas informações de acordo com a nossa Política de Privacidade.\n\n5. Propriedade Intelectual\n\nTodo o conteúdo presente no Aplicativo, incluindo mas não limitado a textos, imagens, gráficos, logotipos, ícones e software, é protegido por direitos autorais e outras leis de propriedade intelectual. Você concorda em não reproduzir, distribuir, modificar ou criar obras derivadas do conteúdo do Aplicativo sem nossa autorização por escrito.\n\n6. Limitação de Responsabilidade\n\nO Aplicativo é fornecido "no estado em que se encontra" e "conforme disponível", sem garantias de qualquer tipo, expressas ou implícitas. Não nos responsabilizamos por quaisquer danos diretos, indiretos, incidentais, especiais ou consequenciais decorrentes do uso ou incapacidade de uso do Aplicativo.\n\n7. Alterações nos Termos\n\nReservamos o direito de modificar estes Termos a qualquer momento, sem aviso prévio. É responsabilidade do usuário revisar periodicamente os Termos para estar ciente de quaisquer alterações. O uso continuado do Aplicativo após as alterações dos Termos constitui a aceitação dessas alterações.\n\n8. Lei Aplicável\n\nEstes Termos serão regidos e interpretados de acordo com as leis do [País], sem considerar os princípios de conflitos de leis.\n\nAo utilizar o Aplicativo, você concorda em cumprir estes Termos e qualquer legislação ou regulamentação aplicável. Se você não concorda com estes Termos, por favor, não utilize o Aplicativo.
 */

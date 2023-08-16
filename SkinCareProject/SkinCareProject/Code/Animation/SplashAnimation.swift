//
//  SplashAnimation.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 16/08/23.
//

import SwiftUI
import Lottie

struct SplashAnimation: View {
    var body: some View {
        LottieView(name: "animationSplash")
    }
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    
    init(name: String, loopMode: LottieLoopMode = .playOnce, animationSpeed: CGFloat = 1) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed //default is 1
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct SplashAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SplashAnimation()
    }
}

//how to call in view:    let animationView = LottieAnimationView(asset: name)


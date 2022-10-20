//
//  UINavigationBar+Blur.swift
//  Furdresser
//
//  Created by Iga Hupalo on 19/05/2021.
//

import UIKit

extension UINavigationBar {
    func setBlurEffect() {
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()

        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight

        let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.isUserInteractionEnabled = false
        blurView.frame = blurFrame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.zPosition = -1

        addSubview(blurView)
    }
}

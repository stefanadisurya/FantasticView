//
//  SceneDelegate+Extension.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 02/09/23.
//

import UIKit

extension SceneDelegate {
    public func configure(
        with windowScene: UIWindowScene,
        vc: UIViewController
    ) {
        self.window = UIWindow()
        self.window?.windowScene = windowScene
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

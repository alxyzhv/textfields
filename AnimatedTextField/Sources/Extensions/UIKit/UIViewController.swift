//
//  UIViewController.swift
//  AnimatedTextField
//
//  Created by Alexey Zhulikov on 18.10.2019.
//  Copyright © 2019 Alexey Zhulikov. All rights reserved.
//

import UIKit

extension UIViewController {

    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Can't instantiate \(self) from storyboard")
        }
        return viewController
    }
}

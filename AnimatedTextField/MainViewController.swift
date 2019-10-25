//
//  MainViewController.swift
//  AnimatedTextField
//
//  Created by Alexey Zhulikov on 18.10.2019.
//  Copyright © 2019 Alexey Zhulikov. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - UIViewController

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

// MARK: - Actions

private extension MainViewController {

    @objc
    func tapGesture() {
        view.endEditing(true)
    }

}

// MARK: - Private Configuration

private extension MainViewController {

    func configure() {
        configureTapGesture()
    }

    func configureTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

}

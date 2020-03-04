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
        setupUI()
    }
}

// MARK: - Actions

private extension MainViewController {

    @objc
    func tapGesture() {
        view.endEditing(true)
    }
}

// MARK: - Private Setup

private extension MainViewController {

    func setupUI() {
        setupTapGesture()
    }

    func setupTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
}

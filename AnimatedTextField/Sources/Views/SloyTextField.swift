//
//  SloyTextField.swift
//  AnimatedTextField
//
//  Created by Alexey Zhulikov on 20.10.2019.
//  Copyright © 2019 Alexey Zhulikov. All rights reserved.
//

import UIKit

final class SloyTextField: UITextField {

    // MARK: - Constants

    private enum Constants {
        static let duration: TimeInterval = 0.25
        static let offset: CGFloat = 8
        static let placeholderSize: CGFloat = 14
    }

    // MARK: - Subviews

    private var border = UIView()
    private var label = UILabel()

    // MARK: - Private Properties

    private var labelHeight: CGFloat {
        ceil(font?.withSize(Constants.placeholderSize).lineHeight ?? 0)
    }

    private var textHeight: CGFloat {
        ceil(font?.lineHeight ?? 0)
    }

    private var isEmpty: Bool {
        text?.isEmpty ?? true
    }

    private lazy var textInsets = UIEdgeInsets(
        top: Constants.offset + labelHeight,
        left: 0,
        bottom: Constants.offset,
        right: 0
    )

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    // MARK: - UITextField

    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
        updateLabel(animated: false)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: textInsets.top + textHeight + textInsets.bottom)
    }

    override var placeholder: String? {
        didSet {
            label.text = placeholder
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ])
        }
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    // MARK: - Private Methods

    private func configure() {
        borderStyle = .none

        border.backgroundColor = .gray
        border.isUserInteractionEnabled = false
        addSubview(border)

        label.textColor = .gray
        label.font = font?.withSize(Constants.placeholderSize)
        label.text = placeholder
        label.isUserInteractionEnabled = false
        addSubview(label)

        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ])

        addTarget(self, action: #selector(handleEditing), for: .allEditingEvents)
    }

    @objc
    private func handleEditing() {
        updateLabel()
        updateBorder()
    }

    private func updateBorder() {
        let borderColor = isFirstResponder ? tintColor : .gray
        UIView.animate(withDuration: Constants.duration) {
            self.border.backgroundColor = borderColor
        }
    }

    private func updateLabel(animated: Bool = true) {
        let alpha: CGFloat = isEmpty ? 0 : 1
        let y = isEmpty ? labelHeight * 0.5 : 0
        let labelFrame = CGRect(x: 0, y: y, width: bounds.width, height: labelHeight)

        guard animated else {
            label.frame = labelFrame
            label.alpha = alpha
            return
        }

        UIView.animate(withDuration: Constants.duration) {
            self.label.frame = labelFrame
            self.label.alpha = alpha
        }
    }

}

//
//  UITextField+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit

extension UITextField {
    func configurePlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor : placeholderColor]
        )
    }
    
    func configureBorderBottom(width borderWidth: CGFloat, color: UIColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
        bottomLine.backgroundColor = color.cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
    }
    
    func configureLeftPadding(_ width: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        leftViewMode = .always
    }
    
    func configureBorder(width borderWidth: CGFloat, radius cornerRadius: CGFloat, color borderColor: UIColor) {
        borderStyle = .roundedRect
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
    
    func removeCursor() {
        tintColor = .clear
    }
}

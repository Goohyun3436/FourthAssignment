//
//  UIView+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import UIKit

extension UIStackView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(0, frame.size.height - width, frame.size.width, width)
        layer.addSublayer(border)
    }
}

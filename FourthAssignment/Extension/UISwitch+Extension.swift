//
//  UISwitch+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit

extension UISwitch {
    func configureColor(bg backgroundColor: UIColor?, on onTintColor: UIColor?, tb thumbTintColor: UIColor? = UIColor.white) {
        layer.cornerRadius = 16
        self.backgroundColor = backgroundColor
        self.onTintColor = onTintColor
        self.thumbTintColor = thumbTintColor
    }
}

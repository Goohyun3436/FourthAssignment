//
//  UILabel+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import UIKit

extension UILabel {
    func configureCircle() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}

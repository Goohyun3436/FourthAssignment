//
//  UIImageView+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

extension UIImageView {
    func configureCircle() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}

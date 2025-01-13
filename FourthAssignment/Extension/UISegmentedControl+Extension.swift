//
//  UISegmentedControl+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit

extension UISegmentedControl {
    func configureAttributes(color normalColor: UIColor, bg backgroundColor: UIColor, selectedColor selectedColor: UIColor, selectedBgColor selectedBackgroundColor: UIColor, size fontSize: CGFloat, weight fontWeight: UIFont.Weight) {
        setTitleTextAttributes([.foregroundColor: normalColor, .font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)], for: .normal)
        setTitleTextAttributes([.foregroundColor: selectedColor, .font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)], for: .selected)
        self.backgroundColor = backgroundColor
        selectedSegmentTintColor = selectedBackgroundColor
    }
}

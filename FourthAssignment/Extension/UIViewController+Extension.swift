//
//  UIViewController+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

extension UIViewController {
    func addSubviewBackButton() {
        let btn = UIButton()
        
        view.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.size.equalTo(44)
        }
        
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = UIColor.white
        
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}

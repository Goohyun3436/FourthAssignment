//
//  SignUpViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    //MARK: - Property
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.size.equalTo(44)
        }
        
        backButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        backButton.tintColor = UIColor.white
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}

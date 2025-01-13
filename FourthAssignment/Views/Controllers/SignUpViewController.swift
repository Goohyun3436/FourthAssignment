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
    let logoImageView = UIImageView()

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        addSubviewBackButton()
        configureLayout()
        configureDesing()
    }
}

//MARK: - Method
extension SignUpViewController {
    func configureLayout() {
        logoImageViewLayout()
    }
    
    func configureDesing() {
        logoImageViewDesign()
    }
}

//MARK: - Layout
extension SignUpViewController {
    func logoImageViewLayout() {
        view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(120)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.7)
            make.height.equalTo(40)
        }
    }
}

//MARK: - Design
extension SignUpViewController {
    func logoImageViewDesign() {
        logoImageView.image = UIImage(named: "gooflix")
        logoImageView.contentMode = .scaleAspectFit
    }
}

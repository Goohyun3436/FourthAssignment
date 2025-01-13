//
//  SignUpViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

enum TextFieldType: CaseIterable {
    case email, password, nickname, location, promocode
    
    var placeholder: String {
        switch self {
            case .email:
                return "이메일 주소 또는 전화번호"
            case .password:
                return "비밀번호"
            case .nickname:
                return "닉네임"
            case .location:
                return "위치"
            case .promocode:
                return "추천 코드 입력"
        }
    }
}

class SignUpViewController: UIViewController {
    //MARK: - Property
    let logoImageView = UIImageView()
    let formWrapView = UIStackView()
    let textFieldWrapView = UIStackView()
    lazy var textFields = makeTextFields()
    let signupButton = UIButton()
    let additionalInfoWrap = UIStackView()
    let additionalInfoLabel = UILabel()
    let additionalInfoSwitch = UISwitch()

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
        formWrapViewLayout()
        textFieldWrapViewLayout()
        textFieldLayout()
        signupButtonLayout()
        additionalInfoWrapLayout()
        additionalInfoLabelLayout()
        additionalInfoSwitchLayout()
    }
    
    func configureDesing() {
        logoImageViewDesign()
        signupButtonDesign()
        additionalInfoLabelDesign()
        additionalInfoSwitchDesign()
    }
    
    func makeTextFields() -> [UITextField] {
        var result = [UITextField]()
        
        for item in TextFieldType.allCases {
            let tf = UITextField()
            
            tf.placeholder = item.placeholder
            
            textFieldDesign(tf)
            
            result.append(tf)
        }
        
        return result
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
    
    func formWrapViewLayout() {
        view.addSubview(formWrapView)
        
        formWrapView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
        }
        
        formWrapView.axis = .vertical
        formWrapView.spacing = 16
    }
    
    func textFieldWrapViewLayout() {
        formWrapView.addArrangedSubview(textFieldWrapView)
        
        textFieldWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        textFieldWrapView.axis = .vertical
        textFieldWrapView.spacing = 16
    }
    
    func textFieldLayout() {
        for tf in textFields {
            textFieldWrapView.addArrangedSubview(tf)
            
            tf.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.height.equalTo(34)
            }
        }
    }
    
    func signupButtonLayout() {
        formWrapView.addArrangedSubview(signupButton)
    
        signupButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    func additionalInfoWrapLayout() {
        formWrapView.addArrangedSubview(additionalInfoWrap)
        
        additionalInfoWrap.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        additionalInfoWrap.axis = .horizontal
        additionalInfoWrap.distribution = .equalSpacing
    }
    
    func additionalInfoLabelLayout() {
        additionalInfoWrap.addArrangedSubview(additionalInfoLabel)
        
        additionalInfoLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func additionalInfoSwitchLayout() {
        additionalInfoWrap.addArrangedSubview(additionalInfoSwitch)
        
        additionalInfoSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        
        additionalInfoSwitch.setOn(false, animated: true)
    }
}

//MARK: - Design
extension SignUpViewController {
    func logoImageViewDesign() {
        logoImageView.image = UIImage(named: "gooflix")
        logoImageView.contentMode = .scaleAspectFit
    }
    
    func textFieldDesign(_ textField: UITextField) {
        textField.layer.cornerRadius = 4
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.darkGray
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        textField.textColor = UIColor.white
        textField.setPlaceholderColor(UIColor.systemGray4)
    }
    
    func signupButtonDesign() {
        signupButton.setTitle("회원가입", for: .normal)
        signupButton.layer.cornerRadius = 8
        signupButton.backgroundColor = UIColor.white
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signupButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func additionalInfoLabelDesign() {
        additionalInfoLabel.text = "추가 정보 입력"
        additionalInfoLabel.font = UIFont.systemFont(ofSize: 14)
        additionalInfoLabel.textColor = UIColor.systemGray4
    }
    
    func additionalInfoSwitchDesign() {
        additionalInfoSwitch.layer.cornerRadius = 16
        additionalInfoSwitch.backgroundColor = UIColor.darkGray
        additionalInfoSwitch.onTintColor = UIColor.systemRed
    }
}

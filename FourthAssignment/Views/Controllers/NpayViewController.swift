//
//  NpayViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class NpayViewController: UIViewController {
    //MARK: - Property
    static let segmentItems = ["멤버십", "현장결제", "쿠폰"]
    let segmentedControl = UISegmentedControl(items: NpayViewController.segmentItems)
    let modalWrapView = UIView()
    let modalTopWrapView = UIView()
    let modalLogoImageView = UIImageView()
    let modalGrayLabel = UILabel()
    let modalCancelButton = UIButton()
    let modalImageView = UIImageView()
    let modalBoldLabel = UILabel()
    let modalCheckButton = UIButton()
    let modalOkButton = UIButton()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewBackButton()
        configureLayout()
        configureDesign()
    }
}

//MARK: - Method
extension NpayViewController {
    func configureLayout() {
        segmentedControlLayout()
        modalWrapViewLayout()
        modalTopWrapViewLayout()
        modalLogoImageViewLayout()
        modalGrayLabelLayout()
        modalCancelButtonLayout()
        modalImageViewLayout()
        modalBoldLabelLayout()
        modalOkButtonLayout()
        modalCheckButtonLayout()
    }
    
    func configureDesign() {
        view.backgroundColor = UIColor(named: "NpayBackgroundColor")
        segmentedControlDesign()
        modalWrapViewDesign()
        modalLogoImageViewDesign()
        modalGrayLabelDesign()
        modalCancelButtonDesign()
        modalImageViewDesign()
        modalBoldLabelDesign()
        modalOkButtonDesign()
        modalCheckButtonDesign()
    }
}

//MARK: - Layout
extension NpayViewController {
    func segmentedControlLayout() {
        view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.9)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.height.equalTo(34)
        }
        
        segmentedControl.selectedSegmentIndex = 1
    }
    
    func modalWrapViewLayout() {
        view.addSubview(modalWrapView)
        
        modalWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.height.equalTo(500)
        }
    }
    
    func modalTopWrapViewLayout() {
        modalWrapView.addSubview(modalTopWrapView)
        
        modalTopWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(25)
        }
    }
    
    func modalLogoImageViewLayout() {
        modalTopWrapView.addSubview(modalLogoImageView)
        
        modalLogoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalToSuperview()
        }
    }
    
    func modalGrayLabelLayout() {
        modalTopWrapView.addSubview(modalGrayLabel)
        
        modalGrayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(modalLogoImageView.snp.trailing).offset(3)
        }
    }
    
    func modalCancelButtonLayout() {
        modalTopWrapView.addSubview(modalCancelButton)
        
        modalCancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(25)
        }
    }
    
    func modalImageViewLayout() {
        modalWrapView.addSubview(modalImageView)
        
        modalImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(modalTopWrapView.snp.bottom).offset(50)
            make.height.equalTo(100)
        }
    }
    
    func modalBoldLabelLayout() {
        modalWrapView.addSubview(modalBoldLabel)
        
        modalBoldLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(modalImageView.snp.bottom).offset(24)
        }
    }
    
    func modalCheckButtonLayout() {
        modalWrapView.addSubview(modalCheckButton)
        
        modalCheckButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(modalOkButton.snp.top).offset(-34)
            
//            안 되는 이유..? -> 찾아보기
//            make.bottom.equalTo(modalOkButton.snp.top).inset(34)
        }
    }
    
    func modalOkButtonLayout() {
        modalWrapView.addSubview(modalOkButton)
        
        modalOkButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(24)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(48)
        }
    }
}

//MARK: - Design
extension NpayViewController {
    func segmentedControlDesign() {
        segmentedControl.configureAttributes(
            color: UIColor.lightGray,
            bg: UIColor.black,
            selectedColor: UIColor.white,
            selectedBgColor: UIColor.darkGray,
            size: 14,
            weight: .semibold
        )
    }
    
    func modalWrapViewDesign() {
        modalWrapView.layer.cornerRadius = 16
        modalWrapView.backgroundColor = UIColor.white
    }
    
    func modalLogoImageViewDesign() {
        modalLogoImageView.image = UIImage(named: "npay")
        modalLogoImageView.contentMode = .scaleAspectFit
    }
    
    func modalCancelButtonDesign() {
        modalCancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        modalCancelButton.tintColor = UIColor.black
    }
    
    func modalGrayLabelDesign() {
        modalGrayLabel.text = "국내"
        modalGrayLabel.font = UIFont.systemFont(ofSize: 12)
        modalGrayLabel.textColor = UIColor.systemGray
    }
    
    func modalImageViewDesign() {
        modalImageView.image = UIImage(systemName: "lock.shield.fill")
        modalImageView.contentMode = .scaleAspectFit
        modalImageView.tintColor = UIColor.systemGreen
    }
    
    func modalBoldLabelDesign() {
        modalBoldLabel.text = "한 번만 인증하고\n비밀번호 없이 결제하세요"
        modalBoldLabel.numberOfLines = 0
        modalBoldLabel.textAlignment = .center
        modalBoldLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        modalBoldLabel.textColor = UIColor.black
    }
    
    func modalCheckButtonDesign() {
        modalCheckButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        modalCheckButton.setTitle("바로결제 사용하기", for: .normal)
        modalCheckButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        modalCheckButton.tintColor = UIColor.systemGreen
        modalCheckButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func modalOkButtonDesign() {
        modalOkButton.setTitle("확인", for: .normal)
        modalOkButton.layer.cornerRadius = 24
        modalOkButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        modalOkButton.backgroundColor = UIColor.systemGreen
    }
}

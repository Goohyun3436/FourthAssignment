//
//  LottoViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    //MARK - Property
    private let textField = UITextField()
    
    //MARK - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        addSubviewBackButton(color: UIColor.black)
        configureHierarchy()
        configureLayout()
        configureDesign()
    }
}

//MARK - Method
extension LottoViewController {
    func configureHierarchy() {
        view.addSubview(textField)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
        }
    }
    
    func configureDesign() {
        textField.configureBorder(width: 0.8, radius: 8, color: UIColor.separator)
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
}

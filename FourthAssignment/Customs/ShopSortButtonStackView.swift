//
//  ShopSortButtonStackView.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import SnapKit

class SortButton: CustomButton {
    
    //MARK: - Property
//    var select: Bool = false
    
    init(title: String) {
        super.init(frame: .zero)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.label.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        backgroundColor = UIColor.systemBackground
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        setTitleColor(UIColor.label, for: .normal)
    }
    
    @objc func buttonTapped() {
//        select.toggle()
//        print(select)
        print(#function)
//        callShopRequest
//        backgroundColor = select ? UIColor.label : UIColor.systemBackground
    }
}

class ShopSortButtonStackView: CustomStackView {
    
    //MARK: - UI Property
    let buttons = [
        SortButton(title: "정확도"),
        SortButton(title: "날짜순"),
        SortButton(title: "가격높은순"),
        SortButton(title: "가격낮은순"),
    ]
    
    //MARK: - Override Method
//    init(action: ) {
//        super.init(frame: .zero)
//        
//        configureStackView()
//        configureButtons()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureStackView()
        configureButtons()
    }
    
    //MARK: - Configure Method
    func configureStackView() {
        axis = .horizontal
        spacing = 8
    }
    
    func configureButtons() {
        for item in buttons {
            addArrangedSubview(item)
            
            item.snp.makeConstraints { make in
                make.height.equalTo(30)
            }
        }
    }
    
}

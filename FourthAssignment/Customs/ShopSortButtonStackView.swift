//
//  ShopSortButtonStackView.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import SnapKit

enum Sort: String {
    case sim, date, asc, dsc
    
    var title: String {
        switch self {
            case .sim:
                return "정확도"
            case .date:
                return "날짜순"
            case .dsc:
                return "가격높은순"
            case .asc:
                return "가격낮은순"
        }
    }
}

class SortButton: CustomButton {
    
    //MARK: - Property
    var sort = Sort.sim
    
    init(_ type: Sort) {
        super.init(frame: .zero)
        
        let isActive = sort == type
        
        self.sort = type
        setTitle(type.title, for: .normal)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.label.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        configureColor(isActive)
    }
    
    func configureColor(_ isActive: Bool) {
        backgroundColor = isActive ? UIColor.label : UIColor.systemBackground
        setTitleColor(isActive ? UIColor.systemBackground : UIColor.label, for: .normal)
    }
    
}

class ShopSortButtonStackView: CustomStackView {
    
    //MARK: - UI Property
    let buttons = [
        SortButton(Sort.sim),
        SortButton(Sort.date),
        SortButton(Sort.dsc),
        SortButton(Sort.asc),
    ]
    
    //MARK: - Override Method
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
    
    func changeButtonColors(selected: Sort) {
        for item in buttons {
            item.configureColor(item.sort == selected)
        }
    }
    
}

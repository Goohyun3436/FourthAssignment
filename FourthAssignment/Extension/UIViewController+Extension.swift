//
//  UIViewController+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

extension UIViewController {
    func addSubviewBackButton(color: UIColor = .white) {
        let btn = UIButton()
        
        view.addSubview(btn)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.size.equalTo(44)
        }
        
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = color
        
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let inset: CGFloat = 16
        let spacing: CGFloat = 16
        let width: CGFloat = UIScreen.main.bounds.width - inset * 2
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 28)
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = spacing
        
        return layout
    }
}

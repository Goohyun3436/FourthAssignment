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
    }
    
    func configureDesign() {
        view.backgroundColor = UIColor(named: "NpayBackgroundColor")
        segmentedControlDesign()
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
}

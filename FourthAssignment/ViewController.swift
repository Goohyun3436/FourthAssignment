//
//  ViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

struct VC {
    let vc: UIViewController
    let title: String
}

class ViewController: UIViewController {
    //MARK - Property
    private let vcs = [
//        VC(vc: LottoViewController(), title: "로또 API"),
//        VC(vc: SearchViewController(), title: "영화진흥위원회 API"),
        VC(vc: ShopSearchViewController(), title: "도봉러의 쇼핑쇼핑")
    ]
    private let buttonWrapView = UIStackView()
    private lazy var navButtons = makeNavButtons()

    //MARK - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        configureHierarchy()
        configureLayout()
    }
}

//MARK - Method
extension ViewController {
    private func configureHierarchy() {
        view.addSubview(buttonWrapView)
        
        for btn in navButtons {
            buttonWrapView.addArrangedSubview(btn)
        }
    }
    
    private func configureLayout() {
        buttonWrapView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        buttonWrapView.axis = .vertical
        buttonWrapView.spacing = 8
        
        
        for i in navButtons.indices {
            navButtons[i].snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
                make.height.equalTo(50)
            }
            navButtons[i].backgroundColor = UIColor.black
            navButtons[i].titleLabel?.textColor = UIColor.white
        }
    }
    
    private func makeNavButtons() -> [UIButton] {
        var result = [UIButton]()
        
        for i in vcs.indices {
            let btn = UIButton()
            btn.tag = i
            btn.setTitle(vcs[i].title, for: .normal)
            btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            result.append(btn)
        }
        
        return result
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let vc = vcs[sender.tag].vc
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(nav, animated: true)
    }
}

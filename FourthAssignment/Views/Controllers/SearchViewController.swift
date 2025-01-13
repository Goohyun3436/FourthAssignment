//
//  SearchViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    //MARK: - Property
    let backgroundImageView = UIImageView()

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewBackButton()
        configureLayout()
        configureDesign()
    }
}

//MARK: - Method
extension SearchViewController {
    func configureLayout() {
        backgroundImageViewLayout()
    }
    
    func configureDesign() {
        view.backgroundColor = UIColor.black
        backgroundImageViewDesign()
    }
}

//MARK: - Layout
extension SearchViewController {
    func backgroundImageViewLayout() {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

//MARK: - Design
extension SearchViewController {
    func backgroundImageViewDesign() {
        backgroundImageView.image = UIImage(named: "searchBackground")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.3
    }
}

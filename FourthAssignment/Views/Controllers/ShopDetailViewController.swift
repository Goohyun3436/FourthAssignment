//
//  ShopDetailViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

class ShopDetailViewController: UIViewController, ViewConfiguration {
    
    //MARK: - Property
    var searchText: String?

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = searchText
    }

}

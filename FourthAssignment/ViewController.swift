//
//  ViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit

class ViewController: UIViewController {
    private let vc = [SignUpViewController(), NpayViewController(), SearchViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print(#function)
        let vc = vc[sender.tag]
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true)
    }
}


//
//  UIViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

protocol ViewConfiguration: AnyObject {
    func configureHierarchy()
    func configureLayout()
    func configureView()
}

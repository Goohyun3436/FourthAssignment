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
    private let pickerView = UIPickerView()
    private let drwNoRange = [Int](800...1154)
    
    //MARK - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        addSubviewBackButton(color: UIColor.black)
        configureHierarchy()
        configureLayout()
        configureDesign()
        configurePickerView()
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
    
    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
    }
}

//MARK - PickerView
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drwNoRange.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(drwNoRange[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}

//
//  LottoViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import UIKit
import Alamofire
import SnapKit

class LottoViewController: UIViewController {
    //MARK - UI Property
    private let textField = UITextField()
    private let pickerView = UIPickerView()
    private let topWrapView = UIStackView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    //MARK - Property
    private let drwNoList = [Int](800...1154)
    private var selectedDrwNo: Int = 0 {
        didSet {
            print(selectedDrwNo)
            textField.text = "\(selectedDrwNo)"
            getLottoResult()
        }
    }
    private var lotto: Lotto? {
        didSet {
            guard let lotto else {
                return
            }
            
            dateLabel.text = "\(lotto.drwNoDate) 추첨"
        }
    }
    
    //MARK - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lastNo = drwNoList.last {
            selectedDrwNo = lastNo
        }

        view.backgroundColor = UIColor.white
        addSubviewBackButton(color: UIColor.black)
        configureHierarchy()
        configureLayout()
        configureDesign()
        configurePickerView()
    }
    
    override func viewDidLayoutSubviews() {
        topWrapView.addBottomBorderWithColor(color: UIColor.lightGray, width: 1)
    }
}

//MARK - Method
extension LottoViewController {
    func configureHierarchy() {
        view.addSubview(textField)
        view.addSubview(topWrapView)
        topWrapView.addArrangedSubview(titleLabel)
        topWrapView.addArrangedSubview(dateLabel)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(32)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
        }
        
        topWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(textField.snp.bottom).offset(32)
            make.height.equalTo(40)
        }
        topWrapView.axis = .horizontal
        topWrapView.distribution = .equalSpacing
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
    }
    
    func configureDesign() {
        textField.removeCursor()
        textField.configureBorder(width: 0.8, radius: 8, color: UIColor.separator)
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        titleLabel.text = "당첨번호 안내"
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = UIColor.systemGray
    }
    
    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
    }
    
    func getLottoResult() {
        let url = Lotto.url + "\(selectedDrwNo)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let res):
                self.lotto = res
                print(res)
            case .failure(let err):
                self.lotto = nil
                print(err)
            }
        }
    }
}

//MARK - PickerView
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drwNoList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(drwNoList[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDrwNo = drwNoList[row]
    }
}

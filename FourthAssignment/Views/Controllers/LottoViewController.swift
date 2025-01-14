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
    
    private let drwNoWrapView = UIStackView()
    private let drwNoLabel = UILabel()
    private let drwNoBlackLabel  = UILabel()
    
    private let drwtNoWrapView = UIStackView()
    private let drwtNoLabels = [UILabel(), UILabel(), UILabel(), UILabel(), UILabel(), UILabel()]
//    private let drwtNoLabels = Array(repeating: UILabel(), count: 6) -> 레이블 6개의 메모리 주소값이 다 똑 같음.. -> 찾아보기
    private let plusLabel = {
        let label = UILabel()
        label.text = "+"
        return label
    }()
    private let bnusNoLabel = UILabel()
    private let bnusNoTextLabel = {
        let label = UILabel()
        label.text = "보너스"
        return label
    }()
    
    
    //MARK - Property
    private let drwNoList = [Int](800...1154)
    private var selectedDrwNo: Int = 0 {
        didSet {
            textField.text = "\(selectedDrwNo)"
            getLottoResult()
        }
    }
    private var lotto: Lotto? {
        didSet {
            guard let lotto else {
                dateLabel.isHidden = true
                drwNoLabel.isHidden = true
                drwNoBlackLabel.text = "결과가 없습니다."
                drwtNoWrapView.isHidden = true
                bnusNoTextLabel.isHidden = true
                return
            }
            
            dateLabel.isHidden = false
            drwNoLabel.isHidden = false
            drwNoBlackLabel.text = "당첨결과"
            drwtNoWrapView.isHidden = false
            bnusNoTextLabel.isHidden = false
            
            dateLabel.text = "\(lotto.drwNoDate) 추첨"
            drwNoLabel.text = "\(lotto.drwNo)회"
            drwtNoLabels[0].text = "\(lotto.drwtNo1)"
            
            let drwts = [lotto.drwtNo1, lotto.drwtNo2, lotto.drwtNo3, lotto.drwtNo4, lotto.drwtNo5, lotto.drwtNo6]
            for i in drwts.indices {
                drwtNoLabels[i].text = "\(drwts[i])"
            }
            bnusNoLabel.text = "\(lotto.bnusNo)"
        }
    }
    
    //MARK - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
        addSubviewBackButton(color: UIColor.label)
        configureHierarchy()
        configureLayout()
        configureDesign()
        configurePickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let lastNo = drwNoList.last {
            selectedDrwNo = lastNo
        } else {
            lotto = nil
        }
    }
    
    override func viewDidLayoutSubviews() {
        topWrapView.addBottomBorderWithColor(color: UIColor.lightGray, width: 1)
        
        for item in drwtNoLabels {
            item.configureCircle()
        }
        bnusNoLabel.configureCircle()
    }
}

//MARK - Method
extension LottoViewController {
    func configureHierarchy() {
        view.addSubview(textField)
        
        view.addSubview(topWrapView)
        topWrapView.addArrangedSubview(titleLabel)
        topWrapView.addArrangedSubview(dateLabel)
        
        view.addSubview(drwNoWrapView)
        drwNoWrapView.addArrangedSubview(drwNoLabel)
        drwNoWrapView.addArrangedSubview(drwNoBlackLabel)
        
        view.addSubview(drwtNoWrapView)
        for item in drwtNoLabels {
            drwtNoWrapView.addArrangedSubview(item)
        }
        drwtNoWrapView.addArrangedSubview(plusLabel)
        drwtNoWrapView.addArrangedSubview(bnusNoLabel)
        
        view.addSubview(bnusNoTextLabel)
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
        
        drwNoWrapView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topWrapView.snp.bottom).offset(30)
        }
        drwNoWrapView.axis = .horizontal
        drwNoWrapView.spacing = 8
        
        drwNoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        drwNoBlackLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        drwtNoWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(drwNoWrapView.snp.bottom).offset(30)
        }
        drwtNoWrapView.axis = .horizontal
        drwtNoWrapView.spacing = 4
        drwtNoWrapView.distribution = .equalSpacing
        
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        let inset: CGFloat = 24
        let ballSpacing: CGFloat = 4
        let ballCount: CGFloat = 8
        let ballWidth = (deviceWidth - inset * 2 - ballSpacing * (ballCount - 1)) / ballCount
        
        for item in drwtNoLabels {
            item.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.size.equalTo(ballWidth)
            }
        }
        
        plusLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(ballWidth)
        }
        
        bnusNoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(ballWidth)
        }
        
        bnusNoTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bnusNoLabel).inset(24)
            make.top.equalTo(bnusNoLabel.snp.bottom).offset(4)
        }
    }
    
    func configureDesign() {
        textField.removeCursor()
        textField.configureBorder(width: 0.8, radius: 8, color: UIColor.separator)
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textField.textColor = UIColor.label
        
        titleLabel.text = "당첨번호 안내"
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = UIColor.label
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = UIColor.systemGray
        
        drwNoLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        drwNoLabel.textColor = UIColor.systemOrange
        
        drwNoBlackLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        drwNoBlackLabel.textColor = UIColor.label
        
        for i in drwtNoLabels.indices {
            if i == 0 {
                drwtNoLabels[i].backgroundColor = UIColor.systemOrange
            } else if i == 1 || i == 2 {
                drwtNoLabels[i].backgroundColor = UIColor.systemCyan
            } else if i == 3 || i == 4 {
                drwtNoLabels[i].backgroundColor = UIColor.systemRed
            } else {
                drwtNoLabels[i].backgroundColor = UIColor.systemGray
            }
            drwtNoLabels[i].textAlignment = .center
            drwtNoLabels[i].font = UIFont.systemFont(ofSize: 12, weight: .bold)
            drwtNoLabels[i].textColor = UIColor.white
            drwtNoLabels[i].text = "37"
        }
        
        plusLabel.textAlignment = .center
        plusLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        plusLabel.textColor = UIColor.label
        
        bnusNoLabel.backgroundColor = UIColor.systemGray
        bnusNoLabel.textAlignment = .center
        bnusNoLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        bnusNoLabel.textColor = UIColor.white
        
        bnusNoTextLabel.textAlignment = .center
        bnusNoTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        bnusNoTextLabel.textColor = UIColor.systemGray
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
            case .failure(_):
                self.lotto = nil
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

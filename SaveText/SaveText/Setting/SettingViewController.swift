//
//  SettingViewController.swift
//  SaveText
//
//  Created by Taillook on 2017/11/09.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let userDefaults = UserDefaults.standard
    var disposeBag = DisposeBag()
    let viewModel = SettingViewModel()
    let dataList = [Int](10...30)
    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: dataList[row])
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        viewModel.saveFont(isBold: switchView.isOn, fontSize: dataList[pickerView.selectedRow(inComponent: 0)])
        self.dismiss(animated: true,completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

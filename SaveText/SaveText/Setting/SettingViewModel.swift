//
//  SettingViewModel.swift
//  SaveText
//
//  Created by Taillook on 2017/11/09.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct SettingViewModel {
    let userDefaults = UserDefaults.standard
    
    internal func saveFont(isBold: Bool, fontSize: Int) {
        if isBold {
            userDefaults.set(UIFont.boldSystemFont(ofSize: CGFloat(fontSize)), forKey: "font")
        }else {
            userDefaults.set(UIFont.systemFont(ofSize: CGFloat(fontSize)), forKey: "font")
        }
    }
}

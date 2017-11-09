//
//  EditViewModel.swift
//  SaveText
//
//  Created by Taillook on 2017/11/09.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import RxSwift

struct EditViewModel {
    let userDefaults = UserDefaults.standard
    var text = Variable<String>("")
    
    init() {
        if let savedText = userDefaults.string(forKey: "text") {
           text.value = savedText
        }
    }
    
    internal func saveText(text: String) {
        userDefaults.set(text, forKey: "text")
    }
}

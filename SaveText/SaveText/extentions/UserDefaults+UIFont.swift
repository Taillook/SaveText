//
//  UserDefaults+UIFont.swift
//  SaveText
//
//  Created by Taillook on 2017/11/09.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

extension UserDefaults {
    open func font(forKey: String) -> UIFont? {
        var font: UIFont?
        if let fontData = data(forKey: forKey) {
            font = (NSKeyedUnarchiver.unarchiveObject(with: fontData) as? UIFont)!
        }
        return font
    }
    
    open func set(_ value: UIFont?, forKey defaultName: String) {
        var fontData: Data?
        if let font = value {
            fontData = NSKeyedArchiver.archivedData(withRootObject: font) as Data?
        }
        set(fontData, forKey: defaultName)
    }
}

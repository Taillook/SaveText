//
//  EditViewController.swift
//  SaveText
//
//  Created by Taillook on 2017/11/08.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    let userDefaults = UserDefaults.standard
    var disposeBag = DisposeBag()
    let viewModel = EditViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let savedFont = userDefaults.font(forKey: "font") {
            textView.font = savedFont
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboardopen
        textView.becomeFirstResponder()
        //bindToViwwMoldel
        bindToViewModel()
        //keyboardNotifiObserve
        keyboardNotifi()
    }

    private func keyboardNotifi() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow(notification:)),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: NSNotification.Name.UIKeyboardWillHide,
            object: nil
        )
    }
    
    private func bindToViewModel() {
        viewModel.text.asObservable().bind(to: textView.rx.text).disposed(by: disposeBag)
        
        textView.rx.text.asObservable()
            .bind(onNext: { text in
                self.viewModel.saveText(text: text!)
            })
            .disposed(by: disposeBag)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardRectValue = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.textView.frame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height - keyboardRectValue.height)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.textView.frame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


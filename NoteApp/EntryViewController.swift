//
//  EntryViewController.swift
//  NoteApp
//
//  Created by Mac on 16/04/2022.
//

import UIKit

class EntryViewController: UIViewController {
   
    @IBOutlet var titlefield : UITextField!
    @IBOutlet  var noteField: UITextView!
    
    public var completion: ((String,String) -> Void )?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlefield.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))

    }
    @objc func didTapSave () {
        if let text = titlefield.text, !text.isEmpty, !noteField.text!.isEmpty  {
            completion?(text,noteField.text!)
            
        }
        UserDefaults.standard.set(titlefield.text, forKey: "myText")
    }
        
}

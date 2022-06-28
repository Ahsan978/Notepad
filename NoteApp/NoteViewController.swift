//
//  NoteViewController.swift
//  NoteApp
//
//  Created by Mac on 16/04/2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titlelable: UILabel!
    @IBOutlet var notelable: UITextView!
    
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlelable.text = noteTitle
        notelable.text = note
      
    }
    

   

}

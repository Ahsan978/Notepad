//
//  ViewController.swift
//  NoteApp
//
//  Created by Mac on 16/04/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = model[indexPath.row].title
        cell.detailTextLabel?.text = model[indexPath.row].note
       

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        let models = model[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note ") as? NoteViewController
        else {
            return
        }
        vc.title = "Note"
        vc.noteTitle = models.title
        vc.note = models.note

        
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var lable: UILabel!
    
    var model : [(title:String, note:String)] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        table.delegate = self
        table.dataSource = self
        
        let value = UserDefaults.standard.string(forKey: "myText")
        if value != nil {
            lable.text = value
        }
        

    
    }
    
    @IBAction func didTapNewNote() {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController
        else {
            return
        }
        
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(
                animated: true)
            self.model.append((title: noteTitle, note: note))
            self.table.reloadData()
            self.lable.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        
      
        navigationController?.pushViewController(vc, animated: true)
        
    }
    


}


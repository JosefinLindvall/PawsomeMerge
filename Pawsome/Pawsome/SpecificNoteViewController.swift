//
//  SpecificNoteViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-15.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit
import SQLite

class SpecificNoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var titleNavbar: UINavigationItem!
    
    @IBOutlet weak var commentTextView: UITextView!

    @IBOutlet weak var dateField: UITextField!

    var database: DataHandler?
    
    var navbarTitle = "Navbar title placeholder"
    var titleText = "Title placeholder"
    var dateText = "Date placeholder"
    var commentText = "Comment placeholder"
    var noteID: Int!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleNavbar.title = navbarTitle
        titleField.text = titleText
        dateField.text = dateText
        commentTextView.text = commentText
        commentTextView.delegate = self
    }
    
    
    
    @IBAction func titleClicked(_ sender: UITextField) {
            
        if let title = titleField.text{
            database?.updateData(noteID, title, "title")
        }
        
    }
    
    @IBAction func dateClicked(_ sender: Any) {
        if let date = dateField.text{
             database?.updateData(noteID, date, "date")
         }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if let comment = commentTextView.text{
             database?.updateData(noteID, comment, "comment")
         }
    }
    
    
    
    
}

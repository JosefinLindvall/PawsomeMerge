//
//  addNewNoteViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-19.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit
import SQLite

class addNewNoteViewController: UIViewController {

    
    @IBOutlet weak var invalidInput: UILabel!
    
    @IBOutlet weak var inputTitle: UITextField!
    
    
    @IBOutlet weak var inputDate: UITextField!
    
    @IBOutlet weak var inputComment: UITextView!
    
    var database: DataHandler?
    
    var activeTable: Table?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    @IBAction func finishButtonClicked(_ sender: UIButton) {
        if inputTitle.text == ""{
            invalidInput.text = "Add a title!"
        }
        else if inputDate.text == ""{
            invalidInput.text = "Add the date!"
        }
        else if inputComment.text == ""{
            invalidInput.text = "You need to enter a comment!"
        }
        else{
            database?.insertData(inputTitle: inputTitle.text, inputDate: inputDate.text, inputComment: inputComment.text)
            dismiss(animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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

    
    
    @IBOutlet weak var inputTitle: UITextField!
    
    
    @IBOutlet weak var inputDate: UITextField!
    
    @IBOutlet weak var inputComment: UITextView!
    
    var database: DataHandler?
    
    var activeTable: Table?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    @IBAction func finishButtonClicked(_ sender: UIButton) {
        
        print(database?.getActiveTable())
        
        if let title = inputTitle.text,
            let date = inputDate.text,
            let comment = inputComment.text,
            let dbTitle = database?.dbTitle,
            let dbDate = database?.dbDate,
            let dbComment = database?.dbComment,
            let insertNote = database?.getActiveTable()?.insert(dbTitle <- title, dbDate <- date, dbComment <- comment){
            
            do{
                try self.database?.db.run(insertNote)
                print("Inserted Note!")
            }catch{
                print(error)
            }
        }
        dismiss(animated: true, completion: nil)
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

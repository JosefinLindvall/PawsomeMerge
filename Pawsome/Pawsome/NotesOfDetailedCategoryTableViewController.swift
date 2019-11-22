//
//  NotesOfDetailedCategoryTableViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-08.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit
import SQLite


class NotesOfDetailedCategoryTableViewController: UITableViewController {
    
    @IBOutlet weak var navbar: UINavigationItem!
    
    var database: DataHandler?
    
    var detailedCategoryArray: [NotesCategories] = []
    var navbarCategoryTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbar.title = navbarCategoryTitle
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return detailedCategoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NotesCellOfDetailedCategoryTableViewCell
        
        do{
            if let activeTable = database?.getActiveTable(),
                let id = database?.dbId,
                let title = database?.dbTitle,
                let date = database?.dbDate,
                let detailedCategoryNotes = try database?.db.prepare(activeTable){
                
                //let values = detailedCategoryNotes[indexPath.row]
                
                //for note in detailedCategoryNotes{
                    
                    //cell?.titleLabel.text = detailedCategoryNotes[title]

                    cell?.titleLabel.text = detailedCategoryArray[indexPath.row].title
                    cell?.dateLabel.text = detailedCategoryArray[indexPath.row].date
                    //print("NoteID: \(note[id]), Title: \(note[title]), Date: \(note[date])")
                //}
                
            }
            
            
        }catch{
            
            print(error)
            
        }
        
       

        return cell!
    }
    
    // MARK: - Navigation

    
    @IBAction func newNoteClicked(_ sender: UIButton) {
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "segueToSpecificNote", sender: indexPath)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSpecificNote"{
            if let nextVC = segue.destination as? SpecificNoteViewController,
                let index = sender as? IndexPath{
                nextVC.navbarTitle = navbarCategoryTitle
                nextVC.titleText = detailedCategoryArray[index.row].title
                nextVC.dateText = detailedCategoryArray[index.row].date
                nextVC.commentText = detailedCategoryArray[index.row].comment
                
            }
        }
        
        if segue.identifier == "segueToNewNote"{
            
            if let nextVC = segue.destination as? addNewNoteViewController{
                nextVC.database = database
            }
            
        }
        
    }
    
    // MARK: - Data handler
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
  
    

}

//
//  SpecificNoteViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-15.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class SpecificNoteViewController: UIViewController {

    @IBOutlet weak var titleNavbar: UINavigationItem!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    var navbarTitle = "Navbar title placeholder"
    var titleText = "Title placeholder"
    var dateText = "Date placeholder"
    var commentText = "Comment placeholder"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleNavbar.title = navbarTitle
        titleLbl.text = titleText
        dateLbl.text = dateText
        contentTextView.text = commentText
        
        
        // Do any additional setup after loading the view.
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

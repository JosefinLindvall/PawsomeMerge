//
//  ServiceDetailViewController.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-14.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class ServiceDetailViewController: UIViewController
{
    //Name of service
    
    @IBOutlet weak var nameOfServiceView: UIView!
    
    @IBOutlet weak var nameOfServiceLabel: UILabel!
    
    // Telephone number of service
    
    @IBOutlet weak var telNrForServiceView: UIView!
    
    @IBOutlet weak var telNrForServiceLabel: UILabel!
    
    //Variable containing data
    var service : Service?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
           
        // Name of service label
        let boldTextOnNameOfServiceLabel = "Name: "
        let attributesForboldTextOnNameOfServiceLabel = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attributedStringOnNameOfServiceLabel = NSMutableAttributedString(string:boldTextOnNameOfServiceLabel, attributes:attributesForboldTextOnNameOfServiceLabel)

        if self.service?.name != nil
        {
            let textWithName = self.service?.name
            let stringWithName = NSMutableAttributedString(string: textWithName!) // ok to have exclamaiton mark here? Is there a better solution?
            attributedStringOnNameOfServiceLabel.append(stringWithName)
            nameOfServiceLabel.attributedText = attributedStringOnNameOfServiceLabel
        }
        
        
        
        
        //  Telephone number of service label (Continue here next time)
        
        
        
          
    }
}

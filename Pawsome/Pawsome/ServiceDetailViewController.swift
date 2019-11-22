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
    @IBOutlet weak var nameOfServiceLabel: UILabel!
    
    // Telephone number of service
    @IBOutlet weak var telNrForServiceLabel: UILabel!
    
    //Address of service
    @IBOutlet weak var addressOfServiceLabel: UILabel!
    
    //Link to website of service
    @IBOutlet weak var websiteOfServiceLabel: UILabel!
    
    //Email of service
    @IBOutlet weak var emailOfServiceLabel: UILabel!
    
    
    
    
    //Variable containing data
    var service : Service?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
           
        // Name of service label
        nameOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Name: ", "name")
        
        telNrForServiceLabel.attributedText = getTextToBePutInServiceLabel("Tel: ", "telephoneNumber")
        
        addressOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Address: ", "address")
        
        websiteOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Website: ", "linkToWebsite")
        
        emailOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Email: ", "email")
        
        
        
        /*let boldTextOnNameOfServiceLabel = "Name: "
        let attributesForboldTextOnNameOfServiceLabel = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attributedStringOnNameOfServiceLabel = NSMutableAttributedString(string:boldTextOnNameOfServiceLabel, attributes:attributesForboldTextOnNameOfServiceLabel)

        if self.service?.name != nil
        {
            let textWithName = self.service?.name
            let stringWithName = NSMutableAttributedString(string: textWithName!) // ok to have exclamaiton mark here? Is there a better solution?
            attributedStringOnNameOfServiceLabel.append(stringWithName)
            nameOfServiceLabel.attributedText = attributedStringOnNameOfServiceLabel
        } */
        
        
        
        
        //  Telephone number of service label (Continue here next time)
        
        
        
          
    }
    
    
    func  getTextToBePutInServiceLabel (_ boldText: String, _ valueInService: String) -> NSMutableAttributedString
    {
        let attributesForboldText = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attributesForboldText)

        let normalText = self.service?.getAttributeFromString(valueInService)
        
        if normalText != nil
        {
            let normalTextAsAttributedString = NSMutableAttributedString(string: normalText!) // ok to have exclamaiton mark here? Is there a better solution?
            attributedString.append(normalTextAsAttributedString)
            return attributedString
        }
        
        else
        {
            return NSMutableAttributedString(string: "(There is no data for this fild)")
        }
    }

    
}



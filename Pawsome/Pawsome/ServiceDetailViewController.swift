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
    
    @IBOutlet weak var nameOfServiceLabel: UILabel!
    
    
    @IBOutlet weak var telNrForServiceLabel: UILabel!
    
  
    @IBOutlet weak var addressOfServiceLabel: UILabel!
    
   
    @IBOutlet weak var websiteOfServiceLabel: UILabel!
    
   
    @IBOutlet weak var emailOfServiceLabel: UILabel!
    

    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    //This data comes either from ServiceTableViewController or from EditServiceViewController (not fetched in database)
    var service = Service()
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
          
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    override func viewWillAppear(_ animated: Bool)
    {
      
        nameOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Name: ", "name")
            
        telNrForServiceLabel.attributedText = getTextToBePutInServiceLabel("Tel: ", "telephoneNumber")
            
        addressOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Address: ", "address")
            
        websiteOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Website: ", "linkToWebsite")
            
        emailOfServiceLabel.attributedText = getTextToBePutInServiceLabel("Email: ", "email")
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    func  getTextToBePutInServiceLabel (_ boldText: String, _ valueInService: String) -> NSMutableAttributedString
    {
        let attributesForboldText = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attributesForboldText)

        let normalText = self.service.getAttributeFromString(valueInService)
        
        if normalText != nil
        {
            let normalTextAsAttributedString = NSMutableAttributedString(string: normalText!) // ok to have exclamaiton mark here? Is there a better solution?
            attributedString.append(normalTextAsAttributedString)
            return attributedString
        }
        
        else
        {
            return NSMutableAttributedString(string: "(There is no data for this field)")
        }
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @IBAction func editButtonClicked (_sender : UIBarButtonItem)
    {
        performSegue(withIdentifier: "segueToEditServiceViewController", sender: editButton)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
       if segue.identifier == "segueToEditServiceViewController" ,
          let segueTo =  segue.destination as? EditServiceViewController
       {
            segueTo.service = service
       }
        
    }
    

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
}



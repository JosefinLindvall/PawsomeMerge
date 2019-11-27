//
//  EditServiceViewController.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-23.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class EditServiceViewController: UIViewController
{
    var service = Service()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var invalidInputLabel: UILabel!
    
   
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        nameTextField.text = service.name
        telTextField.text = service.telephoneNumber
        emailTextField.text = service.email
        addressTextField.text = service.address
        websiteTextField.text = service.linkToWebsite
        
        // Do any additional setup after loading the view.
    }
    
    

    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func saveButtonClicked (_sender : Any)
    {
        
        service = getServiceDataFromTextFields(service, nameTextField, telTextField, addressTextField, websiteTextField, emailTextField)
        
        if inputForServiceIsValid (service)
        {
            //Put service in data base here
            self.navigationController?.popViewController(animated: true)
        }
        
        else
        {
            animateButtonToIndicateFaultyInput (saveButton)
            self.invalidInputLabel.text = "Must fill in all fields!"
        }
        
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

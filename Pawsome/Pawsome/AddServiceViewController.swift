//
//  AddServiceViewController.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-21.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class AddServiceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    var service = Service()
    
    let categoryPickerData = [String](arrayLiteral: "Veterinarian", "Dog sitter", "Dog groomer")
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var invalidInputLabel: UILabel!
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let categoryPicker = UIPickerView()
        categoryTextField.inputView = categoryPicker
        categoryPicker.delegate = self
       
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    @IBAction func dismissButtonClicked (_sender : Any)
    {
        dismiss( animated : true, completion : nil)
           
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func finishedButtonClicked (_sender : Any)
    {
        service.category = categoryTextField.text ?? ""
        service = getServiceDataFromTextFields(service, nameTextField, telTextField, addressTextField, websiteTextField, emailTextField)
        
        //put service in database here
        
        if inputForServiceIsValid(service)
        {
            //Put service in data base here
            dismiss( animated : true, completion : nil)
        }
        
        else
        {
            animateButtonToIndicateFaultyInput (finishButton)
            self.invalidInputLabel.text = "Must fill in all fields!"
        }
        
    }
    
    

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // MARK: UIPickerView Delegation

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return categoryPickerData.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return categoryPickerData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        categoryTextField.text = categoryPickerData[row]
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    

}

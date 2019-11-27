//
//  InvalidInputHandler.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-23.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit


func animateButtonToIndicateFaultyInput (_ buttonToBeAnimated: UIButton)    
{
    buttonToBeAnimated.layoutIfNeeded()
    
    var initialBackgroundColorOfButton : UIColor
    initialBackgroundColorOfButton = buttonToBeAnimated.backgroundColor ?? UIColor.green
    buttonToBeAnimated.backgroundColor = UIColor.red
    
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.3
    pulse.fromValue = 0.8
    pulse.toValue = 1
    pulse.autoreverses = true
    pulse.repeatCount = 2
    pulse.initialVelocity = 0.3
    pulse.damping = 10
    pulse.stiffness = 50
   
    buttonToBeAnimated.layer.add(pulse, forKey: nil)
    
    //buttonToBeAnimated.backgroundColor = initialBackgroundColorOfButton //Why is this executed before the code above (asynchroious?) ? How to fix this?
    
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


func  inputForServiceIsValid (_ service: Service) -> Bool
{
    return (service.category != "" && service.name != "" && service.telephoneNumber != "" && service.address != "" && service.linkToWebsite != "" && service.email != "" )
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



func  getServiceDataFromTextFields (_ service: Service, _ nameTextField: UITextField, _ telTextField: UITextField, _ addressTextField: UITextField, _ websiteTextField: UITextField, _ emailTextField: UITextField) -> Service
{
    service.name = nameTextField.text ?? ""
    service.telephoneNumber = telTextField.text ?? ""
    service.address = addressTextField.text ?? ""
    service.linkToWebsite = websiteTextField.text ?? ""
    service.email = emailTextField.text ?? ""
    
    return service
}

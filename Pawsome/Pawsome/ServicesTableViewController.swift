//
//  ServicesTableViewController.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-08.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController
{
    var services = [[Service]]() //Array containing arrays that in turn contain elements of class Service
    var ServicesOptional : [[Any]] = []
    var veterinarians = [Service]()
    var dogSitters = [Service]()
    var dogGroomers = [Service]()
    
    var headersForSections = ["Veterinarians" , "Dog sitters" , "Dog groomers"]
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.title = "Services"
        
        // Putting in the data (fetch data differently later on)
        
        veterinarians.append(Service (name : "Vet Kelly" , telephoneNumber : "12345678910" , address : "Paw street 20" , linkToWebsite : "www.kelly.com", email : "kelly@gmail.com"))
        dogSitters.append(Service (name : "Bruno the dog sitter" , telephoneNumber : "12345678910" , address : "Tail street 20" , linkToWebsite : "www.bruno.com" , email : "bruno@gmail.com"))
        dogGroomers.append(Service (name : "Sara the groomer" , telephoneNumber : "12345678910" , address : "Fur street 20" , linkToWebsite : "www.sara.com", email : "sara@gmail.com" ))

        
        services = [veterinarians, dogSitters, dogGroomers]
        print(services.count)
        print(services[0])
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func numberOfSections(in tableView: UITableView) -> Int
        {
            return services.count
        }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return services[section].count
        }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInServicesTable", for: indexPath) as! cellInServicesTable
            
            let currentElementInServicesArray = services[indexPath.section][indexPath.row]
            cell.nameLabel.text = currentElementInServicesArray.name
            cell.telephoneNumberLabel.text = currentElementInServicesArray.telephoneNumber


            return cell
        }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
        {
            return headersForSections[section]
        }
        
        
   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            performSegue(withIdentifier: "segueToServiceDetailViewController", sender: indexPath) // Function performSegue will call function "prepare for segue" below
            
        }
        
      
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            
           if segue.identifier == "segueToServiceDetailViewController" ,
              let segueTo =  segue.destination as? ServiceDetailViewController ,
              let index = sender as? IndexPath
           {
                let service = services[index.section][index.row]
                segueTo.service = service
                            
           }
         }
        
        
        
        
}




//
//  cellInServicesTable.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-08.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class cellInServicesTable : UITableViewCell
{
     
    @IBOutlet weak var upperHalfOfCellView: UIView!
    
    @IBOutlet weak var lowerHalfOfCellView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var telephoneNumberLabel: UILabel!
    
    @IBOutlet weak var serviceImage: UIImageView!
    
    @IBOutlet weak var phoneImage: UIImageView!
    
     override func awakeFromNib()
     {
         super.awakeFromNib()
     }

     override func setSelected(_ selected: Bool, animated: Bool)
     {
         super.setSelected(selected, animated: animated)

     }
}

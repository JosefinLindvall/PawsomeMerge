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
    
     override func awakeFromNib()
     {
         super.awakeFromNib()
         // Initialization code
     }

     override func setSelected(_ selected: Bool, animated: Bool)
     {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }
}

//
//  NotesCellOfDetailedCategoryTableViewCell.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-08.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class NotesCellOfDetailedCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

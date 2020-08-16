//
//  MenuListTableViewCell.swift
//  movieAplication
//
//  Created by WKN-72 on 13/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var name: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

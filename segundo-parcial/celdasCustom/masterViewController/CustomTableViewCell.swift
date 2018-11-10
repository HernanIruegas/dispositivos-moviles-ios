//
//  CustomTableViewCell.swift
//  masterViewController
//
//  Created by Hernán Iruegas Villarreal on 05/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSueldo: UILabel!
    @IBOutlet weak var lbDepartamento: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

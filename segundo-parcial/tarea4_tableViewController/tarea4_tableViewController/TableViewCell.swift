//
//  TableViewCell.swift
//  tarea4_tableViewController
//
//  Created by Hernán Iruegas Villarreal on 10/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivFoto: UIImageView!
    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ProductsViewCell.swift
//  GAPSI
//
//  Created by Sokolabs on 13/11/20.
//  Copyright © 2020 josue. All rights reserved.
//

import UIKit

class ProductsViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

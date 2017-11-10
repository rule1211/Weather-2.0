//
//  SevenDaysCell.swift
//  Weather 2.0
//
//  Created by Stefan Ruzic on 10.11.17..
//  Copyright © 2017. Stefan Ruzic. All rights reserved.
//

import UIKit

class SevenDaysCell: UITableViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

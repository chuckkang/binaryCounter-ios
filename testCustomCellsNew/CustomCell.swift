//
//  CustomCell.swift
//  testCustomCellsNew
//
//  Created by Chucks Mac Book on 11/14/17.
//  Copyright © 2017 Chucks Mac Book. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var powerLevelLabel: UILabel!

    var delegate: calculateDelegate?
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBAction func calculateButton(_ sender: UIButton)
    {
        var total = Int(valueLabel.text!)
        if sender.titleLabel?.text == "Subtract"{
            total = -total!
        }
        
        delegate?.calculate(addAmount: total!)
    }

}

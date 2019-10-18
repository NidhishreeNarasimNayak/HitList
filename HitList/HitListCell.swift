//
//  HitListCell.swift
//  HitList
//
//  Created by Nidhishree on 16/10/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class HitListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CharacterCell.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

class CharacterCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = .disclosureIndicator
        
    }

}

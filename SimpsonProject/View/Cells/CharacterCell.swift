//
//  CharacterCell.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

class CharacterCell: UITableViewCell {
    var titleLabel = UILabel()
    var normalizedName = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupSubViews()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = .disclosureIndicator
        
        
    }
    
    func setupSubViews() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        normalizedName.translatesAutoresizingMaskIntoConstraints = false
        normalizedName.textColor = .black
        normalizedName.font = UIFont.systemFont(ofSize: 12)


        contentView.addSubview(titleLabel)
        contentView.addSubview(normalizedName)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor ),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            normalizedName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            normalizedName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            normalizedName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(with data: CharacterModel){
        titleLabel.text = data.name
        normalizedName.text = data.normalizedName
        print("customLabel.text: \(titleLabel.text ?? "Boş")")
        print("normalizedName.text: \(normalizedName.text ?? "Boş")")
    }
}

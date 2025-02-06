//
//  SettingsViewController.swift
//  AccauntPage
//
//  Created by MakOSim on 05.02.2025.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    let icon = UIImageView()
    let nameSettings =  UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        [nameSettings, icon ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview($0)
    }
        
        NSLayoutConstraint.activate([
        
          
            
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameSettings.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            nameSettings.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            nameSettings.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            nameSettings.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        
        
        
        
        ])
        
    }
    
    func configure(menu: SetupMenu) {
        nameSettings.text = menu.name
        icon.image = menu.image
        
        
        icon.tintColor = .white
        icon.layer.cornerRadius = 7
        icon.backgroundColor = menu.color
        icon.clipsToBounds = true
        
    }
    
    
}

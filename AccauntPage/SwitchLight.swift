//
//  switchLight.swift
//  AccauntPage
//
//  Created by MakOSim on 25.01.2025.
//

import Foundation
import UIKit

class SwitchLight: UIView {
    
    let switchLabel = UILabel()
    
    let table = UIView()
    let icon  = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        table.frame = CGRect(x: 0, y: 0, width: 429, height: 44)
        
        
        switchLabel.text = "Вимикач світла"
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.textColor = .black
        
        icon.image = UIImage(systemName: "lamp.ceiling.fill")
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 7
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        
        
        self.addSubview(table)
        table.addSubview(switchLabel)
        table.addSubview(icon)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            switchLabel.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: table.leadingAnchor, constant: 62),
            
            icon.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: table.leadingAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    
}

        
        
        
        
    

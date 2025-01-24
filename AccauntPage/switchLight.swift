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
    let lightSwitch = UISwitch()
    let table = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Ініціалізація table
        table.frame = CGRect(x: 0, y: 0, width: 366, height: 44)
        self.addSubview(table)
        
        // Додавання підвидів до table
        table.addSubview(lightSwitch)
        table.addSubview(switchLabel)
        
        // Встановлюємо обмеження
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupConstraints() {
        // Вимикаємо translatesAutoresizingMaskIntoConstraints для кожного елемента, щоб працювали обмеження
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Налаштовуємо обмеження
        NSLayoutConstraint.activate([
            // Обмеження для lightSwitch
            lightSwitch.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            lightSwitch.leadingAnchor.constraint(equalTo: table.leadingAnchor, constant: 10),
            
            // Обмеження для switchLabel
            switchLabel.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: lightSwitch.trailingAnchor, constant: 10),
            switchLabel.trailingAnchor.constraint(equalTo: table.trailingAnchor, constant: -10)
        ])
    }
}
        
        
        
        
        
        
    

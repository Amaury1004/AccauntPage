//
//  SwitchLightView.swift
//  AccauntPage
//
//  Created by Dmitry on 26.01.25.
//

import Foundation
import UIKit

protocol SwitchLightDelegate: AnyObject {
    func switchAction(sender: SwitchLightView)
}

class SwitchLightView: UIView {
    
    weak var delegate: SwitchLightDelegate?
    
    let lightSwitch = UISwitch()
    let iconImageView = InsetImageView()
    let switchLabel = UILabel()
    let isDarkMode = UserDefaults.standard.bool(forKey: "LightSwitch")  
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        
        let isOn = UserDefaults.standard.bool(forKey: "LightSwitch")
        lightSwitch.isOn = isOn
        
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        lightSwitch.addTarget(self, action: #selector(actionForSwitch), for: .valueChanged)

        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.setup(image: UIImage(systemName: "lightbulb.fill")!.withRenderingMode(.alwaysTemplate), insets: UIEdgeInsets(top: 7, left: 5, bottom: 7, right: 5))
        iconImageView.tintColor = .white
         
        iconImageView.contentMode = .scaleAspectFit
        
        iconImageView.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        iconImageView.layer.cornerRadius = 7
        iconImageView.clipsToBounds = true
        
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.text = "Вимикач світла"
        switchLabel.textColor  = isDarkMode ? .white : .black
        switchLabel.font = UIFont.systemFont(ofSize: 16)
        switchLabel.adjustsFontSizeToFitWidth = true
        
        addSubview(lightSwitch)
        addSubview(switchLabel)
        addSubview(iconImageView)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 35),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            
            switchLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),

            lightSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lightSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
    
            
        ])
    }
    
    @objc func actionForSwitch(sender: UISwitch) {
            delegate?.switchAction(sender: self)
        }
}

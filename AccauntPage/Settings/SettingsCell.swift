//
//  SettingsViewController.swift
//  AccauntPage
//
//  Created by MakOSim on 05.02.2025.
//

import UIKit

protocol SettingsCellDelegate: AnyObject {
    func didSwitchChangedAction(sender: SettingsCell, isOn: Bool)
}

class SettingsCell: UITableViewCell {
    
    let icon = UIImageView()
    let nameSettings =  UILabel()
    let cellSwitch = UISwitch()
    let descriptionLabel = UILabel()
    
    var model: SetupMenu?
    
    weak var delegate: SettingsCellDelegate?

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        [nameSettings, icon].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview($0)
    }
        
        var constraints: [NSLayoutConstraint] = [
            
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameSettings.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            nameSettings.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            nameSettings.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        if model?.type == .toggle {
            cellSwitch.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(cellSwitch)
            cellSwitch.addTarget(self, action: #selector(switchChangedAction(sender:)), for: .valueChanged)
            constraints.append(contentsOf: [
                cellSwitch.heightAnchor.constraint(equalToConstant: 31),
                
                cellSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
                cellSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        if model?.type == .label {
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(descriptionLabel)
            constraints.append(contentsOf: [
                
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
                descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func configure(menu: SetupMenu) {
        self.model = menu
        
        nameSettings.text = menu.name
        descriptionLabel.text = menu.description
        descriptionLabel.textColor = .lightGray
        
        icon.image = menu.image
        icon.tintColor = .white
        icon.layer.cornerRadius = 7
        icon.backgroundColor = menu.color
        icon.clipsToBounds = true
        
        setupCell()
        setupSeparator()
    }
    
    @objc func switchChangedAction(sender: UISwitch) {
        delegate?.didSwitchChangedAction(sender: self, isOn: sender.isOn)
    }
    
    func setupSeparator() {
        //Google it: Custom separator with accesory view
        let width = UIScreen.main.bounds.size.width
        let separator =
        UIView(frame:CGRect(x: 0, y: 0, width: width, height: 1))
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: nameSettings.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

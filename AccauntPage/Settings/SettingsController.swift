//
//  SettingsController.swift
//  AccauntPage
//
//  Created by MakOSim on 02.02.2025.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    let tableView: UITableView = .init(frame: .zero, style: .plain)
    let content = Source.makeGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        
        setupTable()
        view.addSubview(tableView)
        
        setupConstraints()
        
        self.navigationItem.title = "Settings"
    }
    
    func setupTable() {
        tableView.separatorStyle = .none
    }
}


extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = content[indexPath.section][indexPath.row]
        let section = SettingsSectionType.init(rawValue: indexPath.section)
        
        switch section {
        case .fisrt:
            print("fisrt")
        case .second:
            print("second")
        case .third:
            print("third")
        case .none:
            break;
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            let wifiVC = WifiSettingsController()
            navigationController?.pushViewController(wifiVC, animated: true)
                }
        else{
            print("Egor fashist")
        }
    }
    
}


extension SettingsController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension SettingsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell else {
            fatalError("Cell not found")
        }
        
        let menuItem = content[indexPath.section][indexPath.row]
        
        cell.configure(menu: menuItem)
        cell.delegate = self
        
        if menuItem.type != .toggle {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let separatorView = UIView()
        separatorView.backgroundColor = .white
        
        let height: CGFloat = 10.0
        separatorView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: height)
        
        return separatorView
    }
}

extension SettingsController: SettingsCellDelegate {
    func didSwitchChangedAction(sender: SettingsCell, isOn: Bool) {
        if isOn {
            print("Опять работать")
        } else {
            print("Зак зак")
        }
    }
}









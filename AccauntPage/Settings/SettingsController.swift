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
    let menu = Source.makeMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        
        setupTable()
        view.addSubview(tableView)
        
        setupConstraints()
        
        self.navigationItem.title = "Ну не расстраивайся"
    }
    
    func setupTable() {
        tableView.separatorStyle = .none
    }
}


extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Egor fashist")
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
        Source.makeGroup().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedMenu = Source.makeGroup()
        return groupedMenu[section].count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell else {
            fatalError("Cell not found")
        }
        
        let groupedMenu = Source.makeGroup()
        let menuItem = groupedMenu[indexPath.section][indexPath.row]
        
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









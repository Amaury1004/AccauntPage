//
//  SettingsController.swift
//  AccauntPage
//
//  Created by MakOSim on 02.02.2025.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    let tableView:UITableView = .init()
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
    }
    
    func setupTable() {
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .gray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 64)

        
    }
    
    
    
}
    

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedMenu = Source.makeGrup()
        return groupedMenu[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell else {
            fatalError("Cell not found")
        }

        let groupedMenu = Source.makeGrup()
        let menuItem = groupedMenu[indexPath.section][indexPath.row]

        cell.configure(menu: menuItem)

            if indexPath.section == 0  {
                
                if indexPath.row == 0{
                    let switchControl = UISwitch()
                    
                    switchControl.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
                    cell.accessoryView = switchControl
                }
                else if indexPath.row == 1 || indexPath.row == 2 {
                    
                }
                
                cell.accessoryType = .disclosureIndicator
            }
            else {
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
        
       
        
    @objc func switchChanged() {
        
    }
    
}


    
    
    




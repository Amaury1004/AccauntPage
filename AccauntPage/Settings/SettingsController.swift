//
//  SettingsController.swift
//  AccauntPage
//
//  Created by MakOSim on 02.02.2025.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
   
    
    func stupUi() {
        view.addSubview(tableView)
    }
    
    func setupConstaints(){
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
        ])
    }
    
}

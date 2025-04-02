import UIKit

protocol CellularSettingsDelegate: AnyObject {
    func didUpdateSetting(value: String, for key: String)
}


class CellularSettingsController: UIViewController, CellularSettingsDelegate {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var settingsData = CellularSettingsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cellular"
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = "Settings"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func cellularDataSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "CellularDataEnabled")
        settingsData.settings["Cellular Data"] = sender.isOn ? "On" : "Off"
        tableView.reloadData()
    }
    
    func didUpdateSetting(value: String, for key: String) {
        settingsData.settings[key] = value
        tableView.reloadData()
    }
}

extension CellularSettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingsData.sections[section].isEmpty ? nil : settingsData.sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = settingsData.items[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        
        if text == "Cellular Data" {
            let switchView = UISwitch()
            switchView.isOn = UserDefaults.standard.bool(forKey: "CellularDataEnabled")
            switchView.addTarget(self, action: #selector(cellularDataSwitchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchView
            cell.detailTextLabel?.text = switchView.isOn ? "On" : "Off"
        } else if text == "Turn On This Line" {
            let switchView = UISwitch()
            switchView.isOn = true
            cell.accessoryView = switchView
        } else if text == "Delete eSIM" {
            cell.textLabel?.textColor = .systemRed
            cell.textLabel?.textAlignment = .center
        } else {
            cell.accessoryType = .disclosureIndicator
            
            if let value = settingsData.settings[text] {
                cell.detailTextLabel?.text = value
            }
        }
        return cell
    }
}

extension CellularSettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

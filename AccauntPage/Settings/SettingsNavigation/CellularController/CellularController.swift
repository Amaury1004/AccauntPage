import UIKit

protocol CellularSettingsDelegate: AnyObject {
    func didUpdateSetting(value: String, for key: String)
}


class CellularSettingsController: UIViewController, CellularSettingsDelegate {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let grups = SetupCell.setupCellularGroup()
    var model: CellularSettingsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cellular"
        view.backgroundColor = .white
        
        navigationItem.backButtonTitle = "Settings"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellularCell.self, forCellReuseIdentifier: "CellularCell")

        
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
        tableView.reloadData()
    }
    
    func didUpdateSetting(value: String, for key: String) {
        tableView.reloadData()
    }
}

extension CellularSettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return grups.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch section {
            case 0:
                return "CELLULAR SETTINGS"
            case 1:
                return "ADDITIONAL OPTIONS"
            default:
                return nil
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < grups.count else { return 0 }
        return grups[section].count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellularCell", for: indexPath) as! CellularCell
        let data = grups[indexPath.section][indexPath.row]
        cell.configure(model: data)
        return cell
    }
    
}

extension CellularSettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if model?.type == .label {
            return 100
        }
        else{
            return 60}
        }
}

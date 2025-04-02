

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
        
        let closeButton = UIBarButtonItem(
                image: UIImage(systemName: "xmark"), 
                style: .plain,
                target: self,
                action: #selector(closeButtonTapped)
            )
        navigationItem.leftBarButtonItem = closeButton
        

        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        
        setupTable()
        view.addSubview(tableView)
        
        
        setupConstraints()
        
        self.navigationItem.title = "Settings"
    }
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    func setupTable() {
        tableView.separatorStyle = .none
    }
}


extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        let section = SettingsSectionType.init(rawValue: indexPath.section)
        let firstRow = SettingsfirstRow.init(rawValue: indexPath.row)
        let secondRow = SettingssecondRow.init(rawValue: indexPath.row)
        let thirdRow = SettingsThirdRow.init(rawValue: indexPath.row)
        
        switch section {
        case .fisrt:
            
            switch  firstRow {
            case .airmode:
                print("Полетели нахуй")
            case .wifi:
                let VC = WifiSettingsController()
                VC.delegate = self
                navigationController?.pushViewController(VC, animated: true)
            case .some(.bluetooth):
                let VC = BluetoothSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .some(.cellular):
                let VC = CellularSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .none:
                print("error")
            }
            
        case .second:
            switch secondRow {
            case .notifications:
                let VC = NotificationsSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .sound:
                let VC = SaundHapticsSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .focus:
                let VC = FocusSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .screenTime:
                let VC = ScreenTimeSettingsController()
                navigationController?.pushViewController(VC, animated: true)

            case .none:
                print("error")
            }
        case .third:
            switch thirdRow {
            case .general:
                let VC = GeneralSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .controlCenter:
                let VC = ControlCenterSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .display:
                let VC = DisplayBrightnessSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .homeScreen:
                let VC = HomeScreenSettingsController()
                navigationController?.pushViewController(VC, animated: true)
            case .accessibility:
                let VC = AccessibilitySettingsController()
                navigationController?.pushViewController(VC, animated: true)
                
            case .none:
                print("error")
            }
        case .none:
            break;
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
        
        let height: CGFloat = 34.0
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


extension SettingsController: WifiSettingsControllerDelegate {
    func didSelectWiFiNetwork(_ networkName: String) {
        
        tableView.reloadData()
        
    }
}
    

import UIKit

class SettingsController: UIViewController {
    
    let tableView: UITableView = .init(frame: .zero, style: .plain)
    var content = Source.makeGroup()
    var currentSelectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setupHeader()
        
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
    
    func setupHeader() {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let mainLabel = UILabel()
        mainLabel.text = "True Tim Coc"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mainLabel.textColor = .black
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImageView()
        image.image = UIImage(named: "avatar")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(image)
        
        
        
        headerView.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            mainLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            
            image.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            image.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60)
        
        tableView.tableHeaderView = headerView
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
        
        currentSelectedIndexPath = indexPath
        
        switch section {
        case .fisrt:
            
            switch  firstRow {
            case .airmode:
                print("Полетели нахуй")
            case .wifi:
                let vc = NetworkSettingsController(typeNetworkProperty: .WiFi)
                vc.delegate = self
                
                navigationController?.pushViewController(vc, animated: true)
            case .some(.bluetooth):
                let vc = NetworkSettingsController(typeNetworkProperty: .BlueTooth)
                vc.delegate = self
                
                navigationController?.pushViewController(vc, animated: true)
            case .some(.cellular):
                let vc = CellularSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .none:
                print("error")
            }
            
        case .second:
            switch secondRow {
            case .notifications:
                let vc = NotificationsSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .sound:
                let vc = SaundHapticsSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .focus:
                let vc = FocusSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .screenTime:
                let vc = ScreenTimeSettingsController()
                navigationController?.pushViewController(vc, animated: true)

            case .none:
                print("error")
            }
        case .third:
            switch thirdRow {
            case .general:
                let vc = GeneralSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .controlCenter:
                let vc = ControlCenterSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .display:
                let vc = DisplayBrightnessSettingsController()
                navigationController?.pushViewController(vc, animated: true)
            case .homeScreen:
                let vc = HomeScreenSettingsController()
                navigationController?.pushViewController(vc, animated: true)
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
        guard let currentSelectedIndexPath = self.currentSelectedIndexPath else { return }
        content[currentSelectedIndexPath.section][currentSelectedIndexPath.row].description = networkName
        
        tableView.reloadData()
        
    }
}
    

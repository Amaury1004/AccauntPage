import UIKit

protocol WifiSettingsControllerDelegate: AnyObject {
    func didSelectWiFiNetwork(_ networkName: String)
}

class NetworkSettingsController: UIViewController {
    
    weak var delegate: WifiSettingsControllerDelegate?
    
    
    let typeNetworkProperty: TypeNetwork
    
    let wifiSwitch = UISwitch()
    let tableView = UITableView()
    var selectedNetwork: String? {
        didSet {
            WiFiManager.saveSelectedNetwork(selectedNetwork ?? "")
            tableView.reloadData()
        }
    }
    init(typeNetworkProperty: TypeNetwork) {
        self.typeNetworkProperty = typeNetworkProperty
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wi-Fi"
        tableView.register(WiFiCell.self, forCellReuseIdentifier: WiFiCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds 
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        setupUI()
        selectedNetwork = WiFiManager.getSelectedNetwork()
        
        view.addSubview(tableView)
    }

    func setupUI() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        let label = UILabel()
        label.text = "Wi-Fi"
        label.font = .boldSystemFont(ofSize: 18)
        
        let isOn = true //UserDefaults.standard.bool(forKey: "Wifi")
        wifiSwitch.isOn = isOn
        wifiSwitch.addTarget(self, action: #selector(toggleWiFi(_:)), for: .valueChanged)

        headerView.addSubview(label)
        headerView.addSubview(wifiSwitch)

        label.translatesAutoresizingMaskIntoConstraints = false
        wifiSwitch.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

            wifiSwitch.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            wifiSwitch.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        self.tableView.tableHeaderView = headerView
    }

    @objc func toggleWiFi(_ sender: UISwitch) {
        self.tableView.reloadData()
    }

}

extension NetworkSettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let selectedNetworkName = WiFiNetwork.getAvailableNetworks()[indexPath.row].name
                selectedNetwork = selectedNetworkName
                delegate?.didSelectWiFiNetwork(selectedNetworkName)
            }
    
}

extension NetworkSettingsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WiFiCell.identifier, for: indexPath) as! WiFiCell
        let network =  WiFiNetwork.getAvailableNetworks()[indexPath.row]
        cell.configure(with: network)
        
        cell.accessoryType = (network.name == selectedNetwork) ? .checkmark : .none

        return cell
    }

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wifiSwitch.isOn ?  WiFiNetwork.getAvailableNetworks().count : 0
    }
    
}

import UIKit

class BluetoothSettingsController: UIViewController {
    
    let bluetoothSwitch = UISwitch()
    let tableView = UITableView()
    var selectedNetwork: String? {
        didSet {
            BlueToothManager.saveSelectedNetwork(selectedNetwork ?? "")
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bluetooth"  // Заголовок изменен на Bluetooth
        setupTableView()
        tableView.register(BlueToothCell.self, forCellReuseIdentifier: BlueToothCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        setupUI()
        selectedNetwork = BlueToothManager.getSelectedNetwork()
    }

    func setupTableView() {
        tableView.frame = view.bounds  // Устанавливаем фрейм для tableView
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }

    func setupUI() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        let label = UILabel()
        label.text = "Bluetooth"
        label.font = .boldSystemFont(ofSize: 18)
        
        bluetoothSwitch.isOn = true
        bluetoothSwitch.addTarget(self, action: #selector(toggleBluetooth(_:)), for: .valueChanged)

        headerView.addSubview(label)
        headerView.addSubview(bluetoothSwitch)

        label.translatesAutoresizingMaskIntoConstraints = false
        bluetoothSwitch.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

            bluetoothSwitch.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            bluetoothSwitch.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        tableView.tableHeaderView = headerView
    }

    @objc func toggleBluetooth(_ sender: UISwitch) {
        tableView.reloadData()
    }
}

extension BluetoothSettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNetworkName = BlueToothNetwork.getAvailableNetworks()[indexPath.row].name
        selectedNetwork = selectedNetworkName
    }
}

extension BluetoothSettingsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bluetoothSwitch.isOn ? BlueToothNetwork.getAvailableNetworks().count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlueToothCell.identifier, for: indexPath) as! BlueToothCell
        let network = BlueToothNetwork.getAvailableNetworks()[indexPath.row]
        cell.configure(with: network)
        
        cell.accessoryType = (network.name == selectedNetwork) ? .checkmark : .none

        return cell
    }
}

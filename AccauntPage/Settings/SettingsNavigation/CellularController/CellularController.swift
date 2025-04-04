import UIKit
import SafariServices

protocol CellularSettingsDelegate: AnyObject {
    func didUpdateSetting(value: String, for key: String)
}


class CellularSettingsController: UIViewController, CellularSettingsDelegate {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let content = SetupCell.setupCellularGroup()
    var model: CellularSettingsData?
    let cellularView = UIView()
    let mainTitle = UILabel()
    
    
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

        setupTableHeader()
    }
    
    func setupTableHeader() {
        let headerView = UIView()
        headerView.backgroundColor = .white

        let icon = InsetImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.setup(image: UIImage(systemName: "antenna.radiowaves.left.and.right")!.withRenderingMode(.alwaysTemplate),
                   insets: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8))
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit
        icon.backgroundColor = .green
        icon.layer.cornerRadius = 17
        icon.clipsToBounds = true

        let mainTitle = UILabel()
        mainTitle.numberOfLines = 0
        mainTitle.font = .systemFont(ofSize: 14)
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.textAlignment = .center
        mainTitle.isUserInteractionEnabled = true

        let fullText = "CELLULAR \n\nFind out how much data you're using, set data restrictions, and manage carrier settings such as eSIM and Wi-Fi calling. "
        let linkText = "Learn more..."

        let attributedText = NSMutableAttributedString(string: fullText + linkText)

        let linkRange = NSRange(location: fullText.count, length: linkText.count)
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: linkRange)
        attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: linkRange)

        mainTitle.attributedText = attributedText

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(learnMoreTapped(_:)))
        mainTitle.addGestureRecognizer(tapGesture)

        headerView.addSubview(icon)
        headerView.addSubview(mainTitle)

        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            icon.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalToConstant: 60),

            mainTitle.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 8),
            mainTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            mainTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            mainTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16)
        ])

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let targetSize = CGSize(width: view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let height = headerView.systemLayoutSizeFitting(targetSize).height + 50
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: height)

        tableView.tableHeaderView = headerView
    }
    
    @objc func cellularDataSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "CellularDataEnabled")
        tableView.reloadData()
    }
    @objc func learnMoreTapped(_ gesture: UITapGestureRecognizer) {
        guard let url = URL(string: "https://www.google.com") else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue 
        present(safariVC, animated: true, completion: nil)
    }
    
    func didUpdateSetting(value: String, for key: String) {
        tableView.reloadData()
    }
}

extension CellularSettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return content.count
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
        guard section < content.count else { return 0 }
        return content[section].count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellularCell", for: indexPath) as! CellularCell
        let data = content[indexPath.section][indexPath.row]
        cell.configure(model: data)
        if data.type != .switchType {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
}

extension CellularSettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 2 {
            return 95
        }
        return 44 
}
}

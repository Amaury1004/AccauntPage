
import UIKit

protocol SettingsCellDelegate: AnyObject {
    func didSwitchChangedAction(sender: SettingsCell, isOn: Bool)
}

class SettingsCell: UITableViewCell {
    let iconContainer = UIView()
    let icon = UIImageView()
    let nameSettings =  UILabel()
    let cellSwitch = UISwitch()
    let descriptionLabel = UILabel()
    
    var model: SetupMenu?
    
    weak var delegate: SettingsCellDelegate?
    weak var delegateWifi: WifiSettingsControllerDelegate?

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        nameSettings.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameSettings)
        addSubview(iconContainer)
        iconContainer.addSubview(icon)
        
    
        
        var constraints: [NSLayoutConstraint] = [
        
            
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            iconContainer.widthAnchor.constraint(equalToConstant: 30),
            iconContainer.heightAnchor.constraint(equalToConstant: 30),
            iconContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            icon.widthAnchor.constraint(equalToConstant: 22),
            icon.heightAnchor.constraint(equalToConstant: 24),
            
            
            nameSettings.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            nameSettings.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 16),
            nameSettings.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        if model?.type == .toggle {
            cellSwitch.translatesAutoresizingMaskIntoConstraints = false
            let isOn = UserDefaults.standard.bool(forKey: "Airmode")
            cellSwitch.isOn = isOn
            contentView.addSubview(cellSwitch)
            cellSwitch.addTarget(self, action: #selector(switchChangedAction(sender:)), for: .valueChanged)
            constraints.append(contentsOf: [
                cellSwitch.heightAnchor.constraint(equalToConstant: 31),
                
                cellSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
                cellSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        if model?.type == .label {
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(descriptionLabel)
            constraints.append(contentsOf: [
                
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
                descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func configure(menu: SetupMenu) {
        self.model = menu
        
        nameSettings.text = menu.name
        descriptionLabel.text = menu.description
        descriptionLabel.textColor = .lightGray
        
        iconContainer.backgroundColor = menu.color
        iconContainer.layer.cornerRadius = 7
        
        icon.image = menu.image
        icon.tintColor = .white
        icon.backgroundColor = menu.color
        icon.clipsToBounds = true
        

        
        setupCell()
        setupSeparator()
    }
    
    @objc func switchChangedAction(sender: UISwitch) {
        delegate?.didSwitchChangedAction(sender: self, isOn: sender.isOn)
        UserDefaults.standard.set(sender.isOn, forKey: "Airmode")
    }
    
    
    func setupSeparator() {
        //Google it: Custom separator with accesory view
        let width = UIScreen.main.bounds.size.width
        let separator =
        UIView(frame:CGRect(x: 0, y: 0, width: width, height: 1))
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        nameSettings.addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: nameSettings.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

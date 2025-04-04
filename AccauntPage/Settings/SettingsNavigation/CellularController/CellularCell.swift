import UIKit

class CellularCell: UITableViewCell {
    
    let title = UILabel()
    let descriptionLabel = UILabel()
    let cellularSwitch = UISwitch()
    
    var model: CellularSettingsData?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUi() {
        contentView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = [
    
        ]
        if model?.label == "Delete eSIM" {
            title.textColor = .red
            constraints = [
                title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ]
        } else {
            constraints = [
                title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
            ]
        }

        
        if model?.type == .switchType {
            cellularSwitch.translatesAutoresizingMaskIntoConstraints = false
            let isOn = UserDefaults.standard.bool(forKey: "Cellular")
            cellularSwitch.isOn = isOn
            contentView.addSubview(cellularSwitch)

            cellularSwitch.addTarget(self, action: #selector(switchChangedAction(sender:)), for: .valueChanged)

            constraints.append(contentsOf: [
                cellularSwitch.heightAnchor.constraint(equalToConstant: 31),
                cellularSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                cellularSwitch.centerYAnchor.constraint(equalTo: title.centerYAnchor)
            ])
        }
        
        if model?.type == .label {
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(descriptionLabel)
            descriptionLabel.numberOfLines = 0 

            constraints.append(contentsOf: [
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
        }
                NSLayoutConstraint.activate(constraints)
    }
    func configure(model: CellularSettingsData){
        self.model = model
        
        title.text = model.label
        descriptionLabel.text = model.descriptionLabel
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 11)
        
        setupUi()
        
    }
    @objc func switchChangedAction(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "Cellular")
    }
    
}



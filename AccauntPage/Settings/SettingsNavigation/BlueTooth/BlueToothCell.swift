import UIKit

class BlueToothCell: UITableViewCell {
    static let identifier = "BlueTooth"
    
    let nameLabel = UILabel()
    let bluetoothIcon = UIImageView()
    let lockIcon = UIImageView()
    let infoButton = UIButton(type: .detailDisclosure)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        nameLabel.font = .systemFont(ofSize: 16)
        
        bluetoothIcon.contentMode = .scaleAspectFit
        bluetoothIcon.image = UIImage(systemName: "wifi")
        
        lockIcon.contentMode = .scaleAspectFit
        lockIcon.image = UIImage(systemName: "lock.fill")

        let stack = UIStackView(arrangedSubviews: [lockIcon, bluetoothIcon, infoButton])
        stack.axis = .horizontal
        stack.spacing = 8
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(stack)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with network: BlueToothNetwork) {
        nameLabel.text = network.name
    }
}

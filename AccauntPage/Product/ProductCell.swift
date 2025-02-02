import UIKit

struct ProductModel {
    let title: String
    let icon: String
}

class ProductCell: UITableViewCell {
    
    let iconView = UIImageView(frame: CGRect(x: 16, y: 12, width: 50, height: 50))
    let titleLabel = UILabel(frame: CGRect(x: 32, y: 12, width: 300, height: 44))
    var model: ProductModel?
    
    func setup() {
        setupUI()
        setupConstraints()
    }
    
    func setupModel(_ model: ProductModel) {
        self.model = model
    }
    
    func setupUI() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        guard let model = self.model else { return }
        titleLabel.text = model.title
        iconView.image = UIImage(named: model.icon)
        addSubview(iconView)
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 50),
            iconView.heightAnchor.constraint(equalToConstant: 50),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -12),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }

}

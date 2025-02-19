import UIKit

protocol BackButtonDelegate: AnyObject {
    func backToMenu()
}

class BackButton: UIView {
    
    private let backButton = UIButton()
    weak var delegate: BackButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false // Важно!
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "arrow.backward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        backButton.layer.cornerRadius = 7
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        backButton.imageView?.contentMode = .scaleAspectFit
        
        addSubview(backButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func popViewController() {
        delegate?.backToMenu()
    }
}

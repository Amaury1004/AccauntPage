import UIKit

class InsetImageView: UIView {
    let imageView = UIImageView()
    
    var insets: UIEdgeInsets = .zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage, insets: UIEdgeInsets = .zero) {
        self.imageView.image = image
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -insets.right)
        ])
    }
}

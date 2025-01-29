import UIKit

class ViewController: UIViewController {
    
    let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
    let menu = Main()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        menu.translatesAutoresizingMaskIntoConstraints = false
        heart.translatesAutoresizingMaskIntoConstraints = false
        
        heart.tintColor = .red
        view.backgroundColor = .gray
        
        view.addSubview(heart)
        view.addSubview(menu)

        NSLayoutConstraint.activate([
            
            heart.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            heart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            heart.widthAnchor.constraint(equalToConstant: 200),
            heart.heightAnchor.constraint(equalToConstant: 200),
            
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

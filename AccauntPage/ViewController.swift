import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = Main()
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .gray
        view.addSubview(menu)

        NSLayoutConstraint.activate([
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            menu.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

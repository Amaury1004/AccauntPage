import UIKit

class ViewController: UIViewController {
    
    let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
    
    let buttonSettings = UIButton(type: .system)
    let buttonLenta = UIButton(type: .system)
    let buttonProfil = UIButton(type: .system)
    let buttonTikitok = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptUI()
    }
    
    func setuptUI() {
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.tintColor = .red
        view.backgroundColor = .gray

        buttonSettings.setImage(UIImage(systemName: "gearshape.fill")!.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonSettings.backgroundColor = .gray
        buttonSettings.layer.cornerRadius = 7
        buttonSettings.layer.masksToBounds = true
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        buttonSettings.addTarget(self, action: #selector(settings), for: .touchUpInside)

        buttonLenta.setTitle("Lenta", for: .normal)
        buttonProfil.setTitle("Profile", for: .normal)
        buttonTikitok.setTitle("Tikitok", for: .normal)

        buttonLenta.backgroundColor = .red
        buttonProfil.backgroundColor = .orange
        buttonTikitok.backgroundColor = .black

        buttonLenta.setTitleColor(.white, for: .normal)
        buttonProfil.setTitleColor(.white, for: .normal)
        buttonTikitok.setTitleColor(.white, for: .normal)

        buttonLenta.layer.cornerRadius = 10
        buttonProfil.layer.cornerRadius = 10
        buttonTikitok.layer.cornerRadius = 7

        buttonLenta.translatesAutoresizingMaskIntoConstraints = false
        buttonProfil.translatesAutoresizingMaskIntoConstraints = false
        buttonTikitok.translatesAutoresizingMaskIntoConstraints = false

        buttonLenta.addTarget(self, action: #selector(lenta), for: .touchUpInside)
        buttonProfil.addTarget(self, action: #selector(profile), for: .touchUpInside)
        buttonTikitok.addTarget(self, action: #selector(tikitok), for: .touchUpInside)

        view.addSubview(heart)
        view.addSubview(buttonLenta)
        view.addSubview(buttonProfil)
        view.addSubview(buttonTikitok)
        view.addSubview(buttonSettings)

        setupConstraint()
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            heart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heart.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            heart.widthAnchor.constraint(equalToConstant: 200),
            heart.heightAnchor.constraint(equalToConstant: 200),

            buttonLenta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonLenta.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            buttonLenta.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            buttonLenta.heightAnchor.constraint(equalToConstant: 45),

            buttonProfil.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonProfil.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            buttonProfil.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            buttonProfil.heightAnchor.constraint(equalToConstant: 45),

            buttonTikitok.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTikitok.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
            buttonTikitok.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            buttonTikitok.heightAnchor.constraint(equalToConstant: 45),

            buttonSettings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonSettings.topAnchor.constraint(equalTo: view.topAnchor, constant: 45)
        ])
    }
    

    @objc private func lenta() {
        let newView = NewsViewController()
        newView.modalPresentationStyle = .fullScreen
        self.present(newView, animated: true, completion: nil)
    }

    @objc func tikitok() {
        let productViewController = ProductListController()
        productViewController.modalPresentationStyle = .fullScreen
        self.present(productViewController, animated: true, completion: nil)
    }

    @objc private func settings() {
        let settings = SettingsController()
        settings.modalPresentationStyle = .fullScreen
        self.present(settings, animated: true, completion: nil)
    }

    @objc private func profile() {
        let profile = ProfileViewController()
        profile.modalPresentationStyle = .fullScreen
        self.present(profile, animated: true, completion: nil)
    }
    
}


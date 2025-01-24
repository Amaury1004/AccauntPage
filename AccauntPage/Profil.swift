import Foundation
import UIKit

class Profil: UIViewController {
    
    var blackMen = UIImageView()
    let nameProfil = UILabel()
    let descriptionProfil = UILabel()
    let icon = UIImageView()
    //let icon2 = ImageViewInsets(insets: UIEdgeInsets(top: 5, left: 4, bottom: 5, right: 4))
    let memeLable = UILabel()
    let memesStack = UIStackView()
    let lightLabel = UILabel()
    let lightSwitch = UISwitch()
    
    //let scrollView = UIScrollView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupInitialTheme()

    }
    
    func setupUI() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 100)
        blackMen.image = UIImage(named: "avatar")
        blackMen.contentMode = .scaleAspectFill
        blackMen.clipsToBounds = true
        blackMen.layer.cornerRadius = 10
        blackMen.translatesAutoresizingMaskIntoConstraints = false
        
        nameProfil.text = "Чоткий Паца"
        nameProfil.textColor = .black
        nameProfil.font = UIFont.boldSystemFont(ofSize: 24)
        nameProfil.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionProfil.text = """
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        Я читаю реп, ви слухаєте реп, ви слухаєте реп.
        """
        descriptionProfil.font = UIFont.systemFont(ofSize: 15)
        descriptionProfil.numberOfLines = 0
        descriptionProfil.textAlignment = .center
        descriptionProfil.translatesAutoresizingMaskIntoConstraints = false
    
        
        icon.image = UIImage(systemName: "lamp.ceiling.fill")
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 7
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        
        
        memeLable.text = "Відбірні меми Чоткого"
        memeLable.textColor = .black
        memeLable.font = UIFont.boldSystemFont(ofSize: 20)
        memeLable.textAlignment = .center
        memeLable.translatesAutoresizingMaskIntoConstraints = false
        
        lightLabel.text = "Выключить свет"
        lightLabel.font = UIFont.systemFont(ofSize: 14)
        lightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lightSwitch.onTintColor = .gray
        lightSwitch.addTarget(self, action: #selector(switchTheme), for: .valueChanged)
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        

        let memes = ["meme1", "meme2", "meme3", "meme4","meme5", "meme4"]
        
        let firstRow = UIStackView()
        firstRow.axis = .horizontal
        firstRow.spacing = 1
        firstRow.distribution = .fillEqually

        let secondRow = UIStackView()
        secondRow.axis = .horizontal
        secondRow.spacing = 1
        secondRow.distribution = .fillEqually

        // Добавляем картинки в первый ряд
        for i in 0..<3 {
            let imageView = UIImageView(image: UIImage(named: memes[i]))
            imageView.contentMode = .scaleAspectFill // Лучше чем .scaleAspectFit для сетки
            imageView.clipsToBounds = true // Обрезает лишнее, если нужно
            firstRow.addArrangedSubview(imageView)
        }

        // Добавляем картинки во второй ряд
        for i in 3..<6 {
            let imageView = UIImageView(image: UIImage(named: memes[i]))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            secondRow.addArrangedSubview(imageView)
        }

       
        memesStack.axis = .vertical
        memesStack.spacing = 1
        memesStack.distribution = .fillEqually
        memesStack.addArrangedSubview(firstRow)
        memesStack.addArrangedSubview(secondRow)
        memesStack.translatesAutoresizingMaskIntoConstraints = false
        
        
            
        //view.addSubview(scrollView)
        view.addSubview(nameProfil)
        view.addSubview(blackMen)
        view.addSubview(descriptionProfil)
        view.addSubview(icon)
        view.addSubview(memeLable)
        view.addSubview(lightSwitch)
        view.addSubview(lightLabel)
        view.addSubview(memesStack)
        
        setupConstraints()
    }
    
    func setupInitialTheme() {
        let darkMode = lightSwitch.isOn
        updateUI(for: darkMode)
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blackMen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blackMen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            blackMen.heightAnchor.constraint(equalToConstant: 100),
            blackMen.widthAnchor.constraint(equalToConstant: 100),
            
            nameProfil.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameProfil.topAnchor.constraint(equalTo: blackMen.bottomAnchor, constant: 23),
            
            
            descriptionProfil.topAnchor.constraint(equalTo: nameProfil.bottomAnchor, constant: 26),
            descriptionProfil.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            descriptionProfil.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            
            memeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memeLable.centerYAnchor.constraint(equalTo: descriptionProfil.bottomAnchor, constant: 30),
            
            
            memesStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            memesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            memesStack.topAnchor.constraint(equalTo: memeLable.bottomAnchor, constant:  30),
            
            icon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
            
            lightLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            lightLabel.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            lightLabel.heightAnchor.constraint(equalToConstant: 44),
            
            lightSwitch.leadingAnchor.constraint(equalTo: lightLabel.trailingAnchor, constant: 8),
            lightSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lightSwitch.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            lightSwitch.heightAnchor.constraint(equalToConstant: 44)
    
        ])
    }
    
    @objc func switchTheme(_ sender: UISwitch) {
        let darkMode = sender.isOn
        updateUI(for: darkMode)
    }
    
    
    
    func updateUI(for darkMode: Bool) {
        view.backgroundColor = darkMode ? .black : .white
        nameProfil.textColor = darkMode ? .white : .black
        descriptionProfil.textColor = darkMode ? .white : .black
        memeLable.textColor = darkMode ? .white : .black
        icon.tintColor = darkMode ? .white : .black
        lightLabel.textColor = darkMode ? .white : .black
    }
}


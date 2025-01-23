import Foundation
import UIKit

class Profil: UIViewController {
    
    var blackMen = UIImageView()
    let nameProfil = UILabel()
    let descriptionProfil = UILabel()
    let icon = UIImageView()
    let icon2 = UIImageView()
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
        descriptionProfil.font = UIFont.systemFont(ofSize: 13)
        descriptionProfil.numberOfLines = 0
        descriptionProfil.textAlignment = .center
        descriptionProfil.translatesAutoresizingMaskIntoConstraints = false
        
        icon.image = UIImage(named: "icon")
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 10
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        icon2.image = UIImage(systemName: "lamp.ceiling.fill")
        icon2.clipsToBounds = true
        icon2.layer.cornerRadius = 7
        icon2.translatesAutoresizingMaskIntoConstraints = false
        icon2.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        
        
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
        
        memesStack.axis = .vertical
        memesStack.spacing = 5
        memesStack.alignment = .center
        memesStack.distribution = .fillEqually
        memesStack.translatesAutoresizingMaskIntoConstraints = false
        
        let memes = ["meme1", "meme2", "meme3", "meme4"]
        
        let firstRow = UIStackView()
        let secondRow = UIStackView()
                
        for i in 0..<2 {
            let imageView = UIImageView(image: UIImage(named: memes[i]))
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
                    
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            //как у тебя будут картинки по размеру экрана, если ты им выставляешь подобные ограничения, с чего они сформированы?
                    
            firstRow.addArrangedSubview(imageView)
                }
                
        for i in 2..<4 {
            let imageView = UIImageView(image: UIImage(named: memes[i]))
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
                    
            imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            //аналогично
                    
            secondRow.addArrangedSubview(imageView)
                }
                
        memesStack.addArrangedSubview(firstRow)
        memesStack.addArrangedSubview(secondRow)
        

        //view.addSubview(scrollView)
        view.addSubview(nameProfil)
        view.addSubview(blackMen)
        view.addSubview(descriptionProfil)
        view.addSubview(icon)
        view.addSubview(memeLable)
        view.addSubview(icon2)
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
            blackMen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            blackMen.widthAnchor.constraint(equalToConstant: 80),
            blackMen.heightAnchor.constraint(equalToConstant: 80),
            
            nameProfil.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameProfil.centerYAnchor.constraint(equalTo: blackMen.bottomAnchor, constant: 30),
            
            descriptionProfil.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionProfil.centerYAnchor.constraint(equalTo: nameProfil.bottomAnchor, constant: 50),
            
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: descriptionProfil.bottomAnchor, constant: 35),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
            
            memeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memeLable.centerYAnchor.constraint(equalTo: icon.bottomAnchor, constant: 30),
            
            memesStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memesStack.centerYAnchor.constraint(equalTo: memeLable.bottomAnchor, constant:  75),
            
            icon2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            icon2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            icon2.widthAnchor.constraint(equalToConstant: 30),
            icon2.heightAnchor.constraint(equalToConstant: 30),
            
            lightLabel.leadingAnchor.constraint(equalTo: icon2.trailingAnchor, constant: 16),
            lightLabel.centerYAnchor.constraint(equalTo: icon2.centerYAnchor),
            lightLabel.heightAnchor.constraint(equalToConstant: 44),
            
            lightSwitch.leadingAnchor.constraint(equalTo: lightLabel.trailingAnchor, constant: 8),
            lightSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lightSwitch.centerYAnchor.constraint(equalTo: icon2.centerYAnchor),
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
        icon2.tintColor = darkMode ? .white : .black
        lightLabel.textColor = darkMode ? .white : .black
    }
}

import Foundation
import UIKit

struct ProfileModel {
    let title: String
    let description: String
    let images: [String]
}

class ProfileViewController: UIViewController {
    
    var blackMen = UIImageView()
    let nameProfil = UILabel()
    let descriptionProfil = UILabel()
    let memeLable = UILabel()
    let memesStack = UIStackView()
    let switchView = SwitchLightView()
    
    
    //Добавил скролл вью
    let scrollView = UIScrollView()
    //Для корректной работы скролл вью, требуется контент вью. Внутренний контейнер, который будет работать со скролл вью
    let contentView = UIView()
    
    var viewModel: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupViewModel(_ model: ProfileModel) {
        self.viewModel = model
    }
    
    func setupUI() {
        //Ебучее свойство
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //Этот блок дря красоты и приятных ощущений
        //Приятные ощущения в том, что можно подскролить контент,
        //даже когда он полностью помещается на экране. Это частый паттерн, так как статичный UI на экране, это не всегда хорошо.
        scrollView.alwaysBounceVertical = true
        //Скрываем скролл индикаторы(полоски по бокам) ибо они тут не нужны
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
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
        """
        descriptionProfil.font = UIFont.systemFont(ofSize: 15)
        descriptionProfil.numberOfLines = 0
        descriptionProfil.textAlignment = .center
        descriptionProfil.translatesAutoresizingMaskIntoConstraints = false
        
        memeLable.text = "Відбірні меми Чоткого"
        memeLable.textColor = .black
        memeLable.font = UIFont.boldSystemFont(ofSize: 20)
        memeLable.textAlignment = .center
        memeLable.translatesAutoresizingMaskIntoConstraints = false
        
        let memes = ["meme1", "meme2", "meme3", "meme4","meme5", "meme4"]
        
        let firstRow = UIStackView()
        firstRow.axis = .horizontal
        firstRow.spacing = 1
        firstRow.distribution = .fillEqually
        
        let secondRow = UIStackView()
        secondRow.axis = .horizontal
        secondRow.spacing = 1
        secondRow.distribution = .fillEqually
        
        for i in 0..<3 {
            let imageView = UIImageView(image: UIImage(named: memes[i]))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            firstRow.addArrangedSubview(imageView)
        }
        
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
        
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.delegate = self
        //lightSwitch.addTarget(self, action: #selector(switchTheme(_:)), for: .valueChanged)
    
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(blackMen)
        contentView.addSubview(nameProfil)
        contentView.addSubview(descriptionProfil)
        contentView.addSubview(memeLable)
        contentView.addSubview(memesStack)
        contentView.addSubview(switchView)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //Магия в том, что скролл вью мы растягиваем поверх view самого View Controller
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //А его контентное составляющее уже по самому скролл вью
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            //Весь контент соответственно на контент вью кидаем
            blackMen.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            blackMen.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            blackMen.heightAnchor.constraint(equalToConstant: 100),
            blackMen.widthAnchor.constraint(equalToConstant: 100),
            
            nameProfil.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameProfil.topAnchor.constraint(equalTo: blackMen.bottomAnchor, constant: 23),
            
            descriptionProfil.topAnchor.constraint(equalTo: nameProfil.bottomAnchor, constant: 26),
            descriptionProfil.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            descriptionProfil.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            memeLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            memeLable.topAnchor.constraint(equalTo: descriptionProfil.bottomAnchor, constant: 30),
            
            memesStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            memesStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            memesStack.topAnchor.constraint(equalTo: memeLable.bottomAnchor, constant: 30),
            
            switchView.topAnchor.constraint(equalTo: memesStack.bottomAnchor, constant: 42),
            switchView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchView.widthAnchor.constraint(equalToConstant: 400),
            switchView.heightAnchor.constraint(equalToConstant: 55)
            //swithLable.trailingAnchor.constraint(equalTo: lightSwitch.leadingAnchor, constant: -12),
            
//            lightSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            lightSwitch.topAnchor.constraint(equalTo: memesStack.bottomAnchor, constant: 42)
        ])
    }
}

extension ProfileViewController: SwitchLightDelegate {
    func switchAction(sender: SwitchLightView) {
        let darkMode = switchView.lightSwitch.isOn
        view.backgroundColor = darkMode ? .black : .white
        nameProfil.textColor = darkMode ? .white : .black
        descriptionProfil.textColor = darkMode ? .white : .black
        memeLable.textColor = darkMode ? .white : .black
        switchView.switchLabel.textColor = darkMode ? .white : .black
        switchView.iconImageView.tintColor = darkMode ? .black : .white
    }
}


    


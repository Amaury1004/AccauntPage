//
//  Menu.swift
//  AccauntPage
//
//  Created by MakOSim on 23.01.2025.
//

import Foundation

//
//  main_padge.swift
//  InstagramPage
//
//  Created by MakOSim on 17.01.2025.
//

import Foundation
import UIKit

class Main: UIView {
    
    let buttonLenta = UIButton(type: .system)
    let buttonProfil = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        buttonLenta.setTitle("Lenta", for: .normal)
        buttonProfil.setTitle("Profil", for: .normal)
        
        buttonLenta.backgroundColor = .red
        buttonProfil.backgroundColor = .green
        
        buttonLenta.setTitleColor(.white, for: .normal)
        buttonProfil.setTitleColor(.white, for: .normal)
        
        buttonLenta.layer.cornerRadius = 10
        buttonProfil.layer.cornerRadius = 10
        buttonLenta.layer.masksToBounds = true
        buttonProfil.layer.masksToBounds = true
        
        buttonLenta.translatesAutoresizingMaskIntoConstraints = false
        buttonProfil.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLenta.addTarget(self, action: #selector(lenta), for: .touchUpInside)
        buttonProfil.addTarget(self, action: #selector(profil), for: .touchUpInside)

        addSubview(buttonLenta)
        addSubview(buttonProfil)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            buttonLenta.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonLenta.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLenta.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            buttonLenta.heightAnchor.constraint(equalToConstant: 45),

            buttonProfil.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonProfil.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonProfil.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            buttonProfil.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    @objc private func lenta() {
        print("Максікі пока не встигли придумати функціонал")
    }
    
    @objc private func profil() {
        let secondVC = Profil()
        secondVC.modalPresentationStyle = .fullScreen
        if let viewController = findViewController() {
            viewController.present(secondVC, animated: true)
        }
    }
}

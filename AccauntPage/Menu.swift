
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
    let buttonTikitok = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        backgroundColor = .yellow
        
        buttonLenta.setTitle("Lenta", for: .normal)
        buttonProfil.setTitle("Profil", for: .normal)
        buttonTikitok.setTitle("Tikitok", for: .normal)
        
        buttonLenta.backgroundColor = .red
        buttonProfil.backgroundColor = .green
        buttonTikitok.backgroundColor = .black
        
        buttonLenta.setTitleColor(.white, for: .normal)
        buttonProfil.setTitleColor(.white, for: .normal)
        buttonTikitok.setTitleColor(.white, for: .normal)
        
        buttonLenta.layer.cornerRadius = 10
        buttonProfil.layer.cornerRadius = 10
        buttonLenta.layer.masksToBounds = true
        buttonProfil.layer.masksToBounds = true
        buttonTikitok.layer.cornerRadius = 7
        buttonTikitok.layer.masksToBounds = true
        
        buttonLenta.translatesAutoresizingMaskIntoConstraints = false
        buttonProfil.translatesAutoresizingMaskIntoConstraints = false
        buttonTikitok.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLenta.addTarget(self, action: #selector(lenta), for: .touchUpInside)
        buttonProfil.addTarget(self, action: #selector(profile), for: .touchUpInside)
        buttonTikitok.addTarget(self, action: #selector(tikitok), for: .touchUpInside)

        addSubview(buttonLenta)
        addSubview(buttonProfil)
        addSubview(buttonTikitok)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            buttonLenta.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonLenta.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLenta.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            buttonLenta.heightAnchor.constraint(equalToConstant: 45),

            buttonProfil.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonProfil.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonProfil.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            buttonProfil.heightAnchor.constraint(equalToConstant: 45),
            
            buttonTikitok.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonTikitok.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonTikitok.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            buttonTikitok.heightAnchor.constraint(equalToConstant: 45)
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
        let newView = NewsViewController()
        newView.modalPresentationStyle = .fullScreen
        if let viewController = findViewController() {
            viewController.present(newView, animated: true)
        }
    }
    
    @objc func tikitok() {
        let newView = Tikitok()
        newView.modalPresentationStyle = .fullScreen
        if let viewController = findViewController() {
            viewController.present(newView, animated: true)
        }
        
    }
    
    @objc private func profile() {
        let profile = ProfileViewController()
        profile.modalPresentationStyle = .fullScreen
        if let viewController = findViewController() {
            viewController.present(profile, animated: true)
        }
    }
}

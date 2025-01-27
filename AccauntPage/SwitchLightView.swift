//
//  SwitchLightView.swift
//  AccauntPage
//
//  Created by Dmitry on 26.01.25.
//

import Foundation
import UIKit

class SwitchLightView: UIView {
    
    let switchLabel = UILabel()
    
    let table = UIView()
    //Иконка использует все так же обычный UIImageView.
    //Я просил сделать кастомный вариант, где можно выставлять внутренние отступы
    //У тебя сейчас иконка вплотную с бекграундом, чекай Фигму
    let icon  = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        table.frame = CGRect(x: 0, y: 0, width: 429, height: 44)
        
        
        switchLabel.text = "Вимикач світла"
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.textColor = .black
        
        icon.image = UIImage(systemName: "lightbulb.fill") //нот ворк lamp.ceiling.fill
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 7
        icon.translatesAutoresizingMaskIntoConstraints = false
        //Тут нужно выставить так. Мы говорим что цвет иконки должен быть белый.
        icon.tintColor = .white
        //Ну а тут уже про бекграунд
        icon.backgroundColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        icon.layoutMargins = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 5)
        
        
        self.addSubview(table)
        table.addSubview(switchLabel)
        table.addSubview(icon)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            switchLabel.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: table.leadingAnchor, constant: 62),
            
            icon.centerYAnchor.constraint(equalTo: table.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: table.leadingAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}

        
        
        
        
    

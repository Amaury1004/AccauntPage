//
//  tikitok?.swift
//  AccauntPage
//
//  Created by MakOSim on 29.01.2025.
//

import Foundation
import UIKit

class Tikitok: UIViewController, UIScrollViewDelegate {
    
    let scrollHorizontally = UIScrollView()
    let scrolVertikal = UIScrollView()
    let content = UIView()
    
    let leftScreen = UIView()
    let rightScreen = UIView()
    
    let tikitokViews: [UIView] = (0..<7).map { _ in UIView() }
    
    let profil = UIButton()
    
    let rightButton = UIView()
    let likeButton = UIButton()
    let commentButton = UIButton()
    let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        setupTikitokInterface()
        
        scrollHorizontally.contentOffset.x = view.frame.width
    }
    
    func setupUI() {
        scrollHorizontally.frame = view.bounds
        scrollHorizontally.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.height)
        scrollHorizontally.isPagingEnabled = true
        scrollHorizontally.showsHorizontalScrollIndicator = false
        scrollHorizontally.delegate = self
        view.addSubview(scrollHorizontally)
        
        leftScreen.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        leftScreen.backgroundColor = .red
        scrollHorizontally.addSubview(leftScreen)
        
        rightScreen.frame = CGRect(x: view.frame.width * 2, y: 0, width: view.frame.width, height: view.frame.height)
        rightScreen.backgroundColor = .blue
        scrollHorizontally.addSubview(rightScreen)

        scrolVertikal.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        scrolVertikal.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 7)
        scrolVertikal.isPagingEnabled = true
        scrolVertikal.showsVerticalScrollIndicator = false
        scrollHorizontally.addSubview(scrolVertikal)
        
        content.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 7)
        scrolVertikal.addSubview(content)
        


        let colors: [UIColor] = [.yellow, .gray, .green, .blue, .purple, .orange, .cyan]
        for (index, tikitokView) in tikitokViews.enumerated() {
            tikitokView.frame = CGRect(x: 0, y: view.frame.height * CGFloat(index), width: view.frame.width, height: view.frame.height)
            tikitokView.backgroundColor = colors[index]
            content.addSubview(tikitokView)
        }
    }
    
    func setupTikitokInterface() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        rightButton.layer.cornerRadius = 6
        view.addSubview(rightButton)

        setupButton(likeButton, icon: "heart.fill", color: .red, action: #selector(likeTapped))
        setupButton(commentButton, icon: "message.fill", color: .white, action: #selector(commentTapped))
        setupButton(shareButton, icon: "arrowshape.turn.up.right.fill", color: .white, action: #selector(shareTapped))
        rightButton.addSubview(likeButton)
        rightButton.addSubview(commentButton)
        rightButton.addSubview(shareButton)

        NSLayoutConstraint.activate([

            rightButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            rightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            rightButton.widthAnchor.constraint(equalToConstant: 60),
            rightButton.heightAnchor.constraint(equalToConstant: 200),

            likeButton.topAnchor.constraint(equalTo: rightButton.topAnchor, constant: 10),
            likeButton.centerXAnchor.constraint(equalTo: rightButton.centerXAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 55),
            likeButton.heightAnchor.constraint(equalToConstant: 55),

            commentButton.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20),
            commentButton.centerXAnchor.constraint(equalTo: rightButton.centerXAnchor),
            commentButton.widthAnchor.constraint(equalToConstant: 55),
            commentButton.heightAnchor.constraint(equalToConstant: 55),

            shareButton.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 20),
            shareButton.centerXAnchor.constraint(equalTo: rightButton.centerXAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 55),
            shareButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }

    func setupButton(_ button: UIButton, icon: String, color: UIColor, action: Selector) {
        let image = UIImage(systemName: icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
    }

    @objc func likeTapped() {
        print("Сердешко")
    }
    
    @objc func commentTapped() {
        print(" Комментарий")
    }
    
    @objc func shareTapped() {
        print(" Поделиться")
    }
}

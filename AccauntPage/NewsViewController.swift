//
//  NewsViewController.swift
//  AccauntPage
//
//  Created by Dmitry on 26.01.25.
//

//Тут от тебя требуется разместить три вью горизонтально друг за другом.
//Какая именно вью не важно, хочешь используй картинку, хочешь просто цветные вью
//Одна вью должна занимать весь экран
//Три вью нужно засунуть в скролл вью, горизонтально. Можешь для простоты не использовать констрейты, а просто расположить вью по фреймам.
//Они должны перелистываться в режими пагинации, чтобы его включить надо выставить true  свойство у скролл вью.
//Я не против помощи чего-то стороннего, но если за каждый написанный символ не будешь в ответе пущу на сашими и скормлю Лирою.
import UIKit


class NewsViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let label = UILabel()
    
    let backButton = BackButton()

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .black
        
        
        
    }
    
    func setupUI() {
        backButton.delegate = self
        
        view1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view2.frame = CGRect(x: view1.frame.maxX, y: 0, width: view.frame.width, height: view.frame.height)
        view3.frame = CGRect(x: view2.frame.maxX, y: 0, width: view.frame.width, height: view.frame.height)
        view4.frame = CGRect(x: view3.frame.maxX, y: 0, width: view.frame.width, height: view.frame.height)
        
        contentView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 4, height: view.frame.height)
        scrollView.contentSize = contentView.frame.size
        
        view1.backgroundColor = .blue
        view2.backgroundColor = .white
        view3.backgroundColor = .red
        
        
        label.text = "Ви побачили Прапор Франції.\nСВОБОДУ ДУРОВУ"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 100)
        label.textColor = .white
        
        
        
        scrollView.frame = view.bounds
        scrollView.contentSize = contentView.frame.size
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        

        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(view1)
        contentView.addSubview(view2)
        contentView.addSubview(view3)
        contentView.addSubview(view4)
        contentView.addSubview(backButton)
        view4.addSubview(label)
        
        
                    
    }

}

extension NewsViewController: BackButtonDelegate {
    func backToMenu() {
        dismiss(animated: true)
    }
}

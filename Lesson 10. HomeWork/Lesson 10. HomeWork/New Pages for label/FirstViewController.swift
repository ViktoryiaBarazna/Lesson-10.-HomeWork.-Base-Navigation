//
//  FirstViewController.swift
//  Lesson 10. HomeWork
//
//  Created by Виктория Дисбаланс on 1.02.26.
//

import UIKit

class FirstViewController: UIViewController {
    
    // Свойство для передачи текста
    let someText: String
    
    // Фоновая картинка
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Передаваемый текст настройки
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Текст с уточнением, а нужно ли это это все пользователю
    private let helpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Do you realy want to train?"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    
    // Кнопка для перехода дальше
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Yes", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.7
        return button
    }()
    
    // Инициализация
        init(text: String) {
            self.someText = text
            super.init(nibName: nil, bundle: nil)
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        setupView()
        setupConstraint()
    }

    
    
    private func addSubViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(label)
        view.addSubview(helpLabel)
        view.addSubview(button)
    }
    
    private func setupView() {
        
        // Действие для кнопки
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        // Передаваемый текст
        label.text = someText
    }
    
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            helpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helpLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),

            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: helpLabel.bottomAnchor, constant: 150),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // Функция для кнопки и передачи текста на Контроллер 2
    @objc private func continueButtonTapped() {
        let vc = SecondViewController()
        vc.someText = someText
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
   }


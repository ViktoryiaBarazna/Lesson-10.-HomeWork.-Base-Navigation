//
//  ThirdViewController.swift
//  Lesson 10. HomeWork
//
//  Created by Виктория Дисбаланс on 1.02.26.
//

import UIKit

class ThirdViewController: UIViewController {
   
    // Свойство для передачи текста
    var someText = ""
    
    // Фоноая картинка
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
    
    // Текстовые поля для ввода данных о тренировке
    private let trainingNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Training name"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    // Текстовые поля для ввода данных о тренировке
    private let trainingDurationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Duration (minutes)"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.keyboardType = .numberPad
        return textField
    }()
    
    // Текстовые поля для ввода данных о тренировке
    private let difficultyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Difficulty (easy/medium/hard)"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    // Кнопка для перехода дальше
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        setupView()
        setupConstraint()
    }
    
    public func setupText(text: String) {
        self.someText = text
    }
    
    private func addSubViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(label)
        view.addSubview(trainingNameTextField)
        view.addSubview(trainingDurationTextField)
        view.addSubview(difficultyTextField)
        view.addSubview(button)
    }
    
    
    private func setupView() {
        
        // Действие для кнопки
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        // Передача текста
        label.text = someText
    }
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            trainingNameTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            trainingNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            trainingNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            trainingNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            trainingDurationTextField.topAnchor.constraint(equalTo: trainingNameTextField.bottomAnchor, constant: 20),
            trainingDurationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            trainingDurationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            trainingDurationTextField.heightAnchor.constraint(equalToConstant: 35),
            
            difficultyTextField.topAnchor.constraint(equalTo: trainingDurationTextField.bottomAnchor, constant: 20),
            difficultyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            difficultyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            difficultyTextField.heightAnchor.constraint(equalToConstant: 35),
            
            button.topAnchor.constraint(equalTo: difficultyTextField.bottomAnchor, constant: 150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Функция для кнопки и передачи текста на Контроллер 3
    @objc private func continueButtonTapped() {
        // Проверяем, что все поля заполнены
        guard let name = trainingNameTextField.text, !name.isEmpty,
              let durationText = trainingDurationTextField.text, !durationText.isEmpty,
              let duration = Int(durationText),
              let difficulty = difficultyTextField.text, !difficulty.isEmpty else {
            
            // Показываем alert, если не все поля заполнены
            let alert = UIAlertController(
                title: "Error",
                message: "Please fill out all the fields",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Создаем объект кастомного класса
        let training = Training(trainingName: name, trainingDuration: duration, difficulty: difficulty)
        
        // Передаем объект в FourthViewController ЧЕРЕЗ МЕТОД (как требуется)
        let vc = FourthViewController()
        vc.configure(training: training, text: someText) // Передаем и объект, и строку
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


//
//  FourthViewController.swift
//  Lesson 10. HomeWork
//
//  Created by Виктория Дисбаланс on 1.02.26.

import UIKit

class FourthViewController: UIViewController {
    
    // Свойства для получения данных о передаваемом тексте и объекте
    var training: Training?
    var someText: String = ""
    
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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Передаваемый объект настройки
    private let trainingNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Передаваемый объект настройки
    private let trainingDurationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Передаваемый объект настройки
    private let difficultyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // Кнопка для перехода дальше
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's start", for: .normal)
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
        displayData() // Вызываем метод для отображения данных
    }
    
    private func addSubViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(trainingNameLabel)
        view.addSubview(trainingDurationLabel)
        view.addSubview(difficultyLabel)
        view.addSubview(button)
    }
    
    private func setupView() {
        // Действие для кнопки
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            trainingNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            trainingNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            trainingNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            trainingDurationLabel.topAnchor.constraint(equalTo: trainingNameLabel.bottomAnchor, constant: 20),
            trainingDurationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            trainingDurationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            difficultyLabel.topAnchor.constraint(equalTo: trainingDurationLabel.bottomAnchor, constant: 20),
            difficultyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            difficultyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // Метод для приема данных из ThirdViewController
    public func configure(training: Training, text: String) {
        self.training = training
        self.someText = text
    }
    
    // Метод для отображения всех данных
    private func displayData() {
        // Отображаем текст, который передавался через все контроллеры
        titleLabel.text = someText
        
        // Отображаем данные из объекта Training
        if let training = training {
            trainingNameLabel.text = "Training name: \(training.trainingName)"
            trainingDurationLabel.text = "Duration: \(training.trainingDuration) minutes"
            difficultyLabel.text = "Difficulty: \(training.difficulty)"
        } else {
            trainingNameLabel.text = "No training data"
            trainingDurationLabel.text = ""
            difficultyLabel.text = ""
        }
    }
    
    // Переход на Контроллер 5
    @objc private func startButtonTapped() {
        let vc = FifthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

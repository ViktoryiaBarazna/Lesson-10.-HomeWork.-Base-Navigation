//
//  StackViewController.swift
//  Lesson 10. HomeWork
//
//  Created by Виктория Дисбаланс on 1.02.26.
//

import UIKit

class StackViewController: UIViewController {
    
    // Фоновая картина
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // stackView для кнопок
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    // Кнопка для новой тренировки
    private let newTrainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New training", for: .normal)
        return button
    }()
    
    // Кнопка отслеживания прогресса
    private let progressTrainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Training statistic", for: .normal)
        return button
    }()
    
    // Кнопка для отслеживания питания
    private let myDietButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My diet", for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupSubViews()
        setupConstraint()
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
    }
    
    private func setupSubViews() {
        [newTrainButton, progressTrainButton, myDietButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            stackView.addArrangedSubview($0)
        }
        
        // Действие для кнопки с новой тренировкой
        newTrainButton.addTarget(self, action: #selector(newTrainButtonTapped), for: .touchUpInside)
    }
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

        // передача текста в Конроллер 1
        @objc private func newTrainButtonTapped() {
            let vc = FirstViewController(text: "New training")
            navigationController?.pushViewController(vc, animated: true)
        }

    
}



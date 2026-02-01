//
//  FifthViewController.swift
//  Lesson 10. HomeWork
//
//  Created by Виктория Дисбаланс on 1.02.26.
//

import UIKit

class FifthViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main3")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.text = "Игра началась :)"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint() 
    }

    
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(label)
    }
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
   }


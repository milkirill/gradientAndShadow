//
//  ViewController.swift
//  Gradient and Shadow
//
//  Created by Kirill Milekhin on 01/09/2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let gradientView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        gradientView.layer.cornerRadius = 10
        addShadow()
        addGradient()
    }
    
    private func addShadow() {
        gradientView.layer.shadowColor = UIColor.black.cgColor
        gradientView.layer.shadowOpacity = 0.8
        gradientView.layer.shadowOffset = CGSize(width: 4, height: 8)
        gradientView.layer.shadowRadius = 16
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.cornerRadius = gradientView.layer.cornerRadius
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        gradientView.layer.addSublayer(gradientLayer)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            gradientView.heightAnchor.constraint(equalToConstant: 120),
            gradientView.widthAnchor.constraint(equalToConstant: 120),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


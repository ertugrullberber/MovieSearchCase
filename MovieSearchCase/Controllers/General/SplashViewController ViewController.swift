//
//  SplashViewController ViewController.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 11.02.2024.
//

import UIKit

final class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        let label = UILabel()
        label.text = "Loodos"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.dismissSplashScreen()
        }
    }

    private func dismissSplashScreen() {
        self.dismiss(animated: true, completion: nil)
    }
}

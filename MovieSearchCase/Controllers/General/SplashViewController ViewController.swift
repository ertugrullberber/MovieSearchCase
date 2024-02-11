//
//  SplashViewController ViewController.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 11.02.2024.
//

//import UIKit
//import FirebaseRemoteConfig
//
//class SplashScreenViewController: UIViewController {
//    var splashTextLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        view.addSubview(splashTextLabel)
//        
//        NSLayoutConstraint.activate([
//            splashTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            splashTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//        
//        checkInternetConnection()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(navigateToNextPage), userInfo: nil, repeats: false)
//    }
//    
//    func checkInternetConnection() {
//        // Internet connection check logic here
//        let isConnected = true // For testing purposes, assuming always connected
//        
//        if isConnected {
//            fetchSplashText()
//        } else {
//            splashTextLabel.text = "İnternet bağlantısı bulunamadı."
//        }
//    }
//    
//    func fetchSplashText() {
//        let remoteConfig = RemoteConfig.remoteConfig()
//        
//        remoteConfig.fetch(withExpirationDuration: 60) { (status, error) in
//            if status == .success {
//                remoteConfig.activate { (_, _) in
//                    let splashText = remoteConfig["splash_text"].stringValue ?? ""
//                    self.splashTextLabel.text = splashText
//                }
//            } else {
//                print("Error fetching remote config: \(error?.localizedDescription ?? "Unknown error")")
//            }
//        }
//    }
//    
//    @objc func navigateToNextPage() {
//        let homeViewController = HomeViewController()
//        navigationController?.pushViewController(homeViewController, animated: true)
//    }
//}

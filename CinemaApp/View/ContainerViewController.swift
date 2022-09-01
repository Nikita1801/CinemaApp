//
//  ContainerViewController.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 31.08.2022.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    private let profileViewController = ProfileViewController()
    private let movieViewController = MovieViewController()
    private var navigationViewController = UINavigationController()
    private let darkView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVCs()
    }
    
    private func addChildVCs(){
        // profile
        profileViewController.delegate = self
        addChild(profileViewController)
        view.addSubview(profileViewController.view)
        profileViewController.didMove(toParent: self)
        
        // movie screen
        movieViewController.delegate = self
        let navigationVC = UINavigationController(rootViewController: movieViewController)
        addChild(navigationVC)
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        self.navigationViewController = navigationVC
    }
}

extension ContainerViewController: MovieViewControllerDelegate{
    
    /// openning the side-menu
    func didTapProfileButton() {
        // Animate the side-menu
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) { [self] in
            self.navigationViewController.view.frame.origin.x = self.movieViewController.view.frame.size.width - 70
            darkView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            darkView.frame = self.navigationViewController.view.bounds
            navigationViewController.view.addSubview(darkView)
        }
    }
}

extension ContainerViewController: ProviewViewControllerDelegate{
    /// closing the side-menu
    func closeProfile() {
        // Animate the side-menu
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) { [self] in
            self.navigationViewController.view.frame.origin.x = 0
            darkView.removeFromSuperview()
        }
    }
}


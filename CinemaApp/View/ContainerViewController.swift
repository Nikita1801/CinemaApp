//
//  ContainerViewController.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 31.08.2022.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    enum ProfileState{
        case opened
        case closed
    }
    
    private var profileState: ProfileState = .closed
    
    private let profileViewController = ProfileViewController()
    private let movieViewController = MovieViewController()
    private var navigationViewController = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVCs()
    }
    
    private func addChildVCs(){
        // profile
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
    func didTapProfileButton() {
        // Animate the side-menu
        print("didTap")
        
        switch profileState{
        case .closed:
            //open side-menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) { [self] in
                 
                self.navigationViewController.view.frame.origin.x = self.movieViewController.view.frame.size.width - 70
//                let darkView = UIView(frame: UIScreen.main.bounds)
//                darkView.backgroundColor = UIColor.black
//                darkView.alpha = 0.2
//                navigationViewController.view = darkView
                
                
            } completion: { [weak self] done in
                if done {
                    self?.profileState = .opened
                }
            }

            
        case .opened:
            //close side-menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) { [self] in
                 
                self.navigationViewController.view.frame.origin.x = 0
//                let darkView = UIView(frame: UIScreen.main.bounds)
//                darkView.backgroundColor = UIColor.black
//                darkView.alpha = 0.1
//                navigationViewController.view = darkView
                
            } completion: { [weak self] done in
                if done {
                    self?.profileState = .closed
                }
            }
        }
    }
}

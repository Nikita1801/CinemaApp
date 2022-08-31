//
//  ContainerViewController.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 31.08.2022.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let profileViewController = ProfileViewController()
    let movieViewController = MovieViewController()
    

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
        
    }

}

extension ContainerViewController: MovieViewControllerDelegate{
    func didTapProfileButton() {
        // Animate the side-menu
        print("didTap")
    }
    
    
}

//
//  ProfileViewController.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 30.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        
        configureView()
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.title
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.text = "Nikita Makarevich"
        label.textAlignment = .center
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.text
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Male | Born 18.01.2003"
        label.textAlignment = .center
        
        return label
    }()
    
    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photo")
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.backgroundLight.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
//        imageView.layer.maskedCorners =
        
        return imageView
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.text
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.text = "+7(916) 968-81-12"
        label.textAlignment = .center
        
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.text
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.text = "nikita-makarevich@mail.ru"
        label.textAlignment = .center
        
        return label
    }()
    
    private let phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone")
        imageView.backgroundColor = UIColor.backgroundLight
        imageView.tintColor = UIColor.title
//        imageView.layer.maskedCorners =
        
        return imageView
    }()
    private let messageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "envelope")
        imageView.backgroundColor = UIColor.backgroundLight
        imageView.tintColor = UIColor.title
//        imageView.layer.maskedCorners =
        
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        photo.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    }
}

private extension ProfileViewController{
    
    private func configureView(){
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)
        view.addSubview(photo)
        view.addSubview(phoneLabel)
        view.addSubview(emailLabel)
        stackView.addSubview(phoneImage)
        stackView.addSubview(messageImage)
        view.addSubview(stackView)
        
        setConstraints()
    }
    
    private func setConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        photo.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        messageImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            photo.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 10),
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            phoneLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 10),
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            stackView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            
            phoneImage.topAnchor.constraint(equalTo: stackView.topAnchor),
            phoneImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            phoneImage.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            messageImage.topAnchor.constraint(equalTo: stackView.topAnchor),
            messageImage.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 30),
            messageImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            messageImage.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}

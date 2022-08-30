//
//  MovieViewController.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 25.08.2022.
//

import UIKit

protocol MovieViewControllerProtocol: AnyObject{
    
    func updateMovies(_ movies: [MovieModel])

}

final class MovieViewController: UIViewController {
    
    private var presenter: MoviePresenterProtocol?
    private var movieInfo: [MovieModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Movie Browser"
        view.backgroundColor = UIColor.background
        self.navigationController?.navigationBar.backgroundColor = UIColor.background
        
        
        presenter = MoviePresenter(movieViewController: self)
        getMovieInfo()
        configureView()
        
        moviesCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Right and Left BarItems
    private func configureRightBarItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.title
    }
    
    private func configureLeftBarItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "person.crop.circle"), style: .done, target: self, action: #selector(profileButtonTapped(_:)))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.title
    }
    
    private let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    @objc private func searchButtonTapped(){
        presenter?.searchButtonTapped()
    }
    
    @objc private func profileButtonTapped(_ sender: UIBarButtonItem){
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
//        presenter?.profileButtonTapped()
    }
    

}

// MARK: - CollectionView extension
extension MovieViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        let movieDetails = movieInfo[indexPath.row]
        cell.set(name: movieDetails.title, genge: movieDetails.genre, year: movieDetails.year, runtime: movieDetails.runtime, rating: movieDetails.ratings, poster: movieDetails.poster)
        
        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: 320)
    }

}

// MARK: - Updating Data protocol extension
extension MovieViewController: MovieViewControllerProtocol{
    
    func updateMovies(_ movies: [MovieModel]) {
        movieInfo = movies
        print(movieInfo)
        moviesCollectionView.reloadData()
    }
}


private extension MovieViewController{
    
    func getMovieInfo(){
        presenter?.getMovies()
    }
    
    func configureView(){
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        configureRightBarItem()
        configureLeftBarItem()
        
        view.addSubview(moviesCollectionView)
        
        setConstraints()
    }
    
    // MARK: - Constraints
    func setConstraints() {
        
        moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

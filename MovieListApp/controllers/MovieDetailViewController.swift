//
//  MovieDetailViewController.swift
//  MovieListApp
//
//  Created by Huy on 06/09/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieModel: MovieModel? = nil {
        didSet {
            if let model = movieModel {
                thumbnailImageView.image = UIImage(named: model.imageString)
                titleLabel.text = model.title
                self.setTitleForRatingLabel(rating: model.rating)
                shortDescriptionDetailLabel.text = model.description
                genreDetailLabel.text = model.genre.joined(separator: ", ")
                releasedDateDetailLabel.text = model.releasedDate
            }
        }
    }
    
    let thumbnailImageView = MovieThumbnailImageView(frame: .zero)
    
    let topContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        return containerView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "--"
        label.numberOfLines = 3
        return label
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        typealias key = NSAttributedString.Key
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "--",
                                                 attributes: [key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                                                              key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "/10",
                                                 attributes: [key.font: UIFont.systemFont(ofSize: 14, weight: .bold),
                                                              key.foregroundColor: UIColor.darkGray]))
        
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        return label
    }()
    func setTitleForRatingLabel(rating: Double) {
        typealias key = NSAttributedString.Key
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "\(rating)",
                                                 attributes: [key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                                                              key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "/10",
                                                 attributes: [key.font: UIFont.systemFont(ofSize: 14, weight: .bold),
                                                              key.foregroundColor: UIColor.darkGray]))
        
        self.ratingLabel.attributedText = attributedText
    }
    
    let addToWatchListButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .init(white: 0.86, alpha: 1)
        button.setTitle("+ ADD TO WATCHLIST", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor.init(white: 0.4, alpha: 1), for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    let watchTrailerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("WATCH TRAILER", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    
    let infoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let lineView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 0.93, alpha: 1)
        return view
    }()
    
    let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Short Description"
        label.textColor = .black
        label.numberOfLines = 3
        return label
    }()
    
    let shortDescriptionDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "--"
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    
    let lineView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 0.93, alpha: 1)
        return view
    }()
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Details"
        label.textColor = .black
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "Genre"
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        return label
    }()
    let genreDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "Action, Sci-Fi"
        label.textColor = .lightGray
        return label
    }()
    
    let releasedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "Realeased date"
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        return label
    }()
    let releasedDateDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "2020, 3 September"
        label.textColor = .lightGray
        return label
    }()
    
// ----------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let movie = movieModel {
            if UserModel.current.watchListIds.contains(movie.id) {
                self.addToWatchListButton.setTitle("REMOVE FROM WATCHLIST", for: .normal)
            } else {
                self.addToWatchListButton.setTitle("+ ADD TO WATCHLIST", for: .normal)
            }
        }
        
        setupViews()
        
        addToWatchListButton.addTarget(self, action: #selector(handleWatchList), for: .touchUpInside)
        watchTrailerButton.addTarget(self, action: #selector(handleWatchTrailer), for: .touchUpInside)
    }
    
    @objc func handleWatchList() {
        guard let movieId = movieModel?.id else { return }
        if UserModel.current.watchListIds.contains(movieId) {
            // remove from watch list
            UserModel.current.watchListIds.removeAll(where: {$0 == movieId})
            DispatchQueue.main.async {
                self.addToWatchListButton.setTitle("+ ADD TO WATCHLIST", for: .normal)
            }
        } else {
            // add to watch list
            UserModel.current.watchListIds.append(movieId)
            self.addToWatchListButton.setTitle("REMOVE FROM WATCHLIST", for: .normal)
        }
        
    }
    
    @objc func handleWatchTrailer() {
        guard let linkString = self.movieModel?.trailerLink else { return }
        guard let url = URL(string: linkString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func setupViews() {
//        let top: CGFloat = self.navigationController?.navigationBar.frame.height ?? 0 + 12
        // 120-176
        view.addSubview(topContainerView)
        
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 96).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        topContainerView.addSubview(thumbnailImageView)
        topContainerView.addSubview(titleLabel)
        topContainerView.addSubview(ratingLabel)
        topContainerView.addSubview(addToWatchListButton)
        topContainerView.addSubview(watchTrailerButton)
        
        thumbnailImageView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 132).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 193).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -4).isActive = true
        
        ratingLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addToWatchListButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 75).isActive = true
        addToWatchListButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        addToWatchListButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24).isActive = true
        addToWatchListButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        watchTrailerButton.topAnchor.constraint(equalTo: addToWatchListButton.bottomAnchor, constant: 12).isActive = true
        watchTrailerButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        watchTrailerButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -24).isActive = true
        watchTrailerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(infoContainerView)
        
        infoContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 8).isActive = true
        infoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        infoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14).isActive = true
        infoContainerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        infoContainerView.addSubview(lineView1)
        infoContainerView.addSubview(shortDescriptionLabel)
        infoContainerView.addSubview(shortDescriptionDetailLabel)
        infoContainerView.addSubview(lineView2)
        infoContainerView.addSubview(detailsLabel)
        infoContainerView.addSubview(genreLabel)
        infoContainerView.addSubview(genreDetailLabel)
        infoContainerView.addSubview(releasedDateLabel)
        infoContainerView.addSubview(releasedDateDetailLabel)
        
        lineView1.topAnchor.constraint(equalTo: infoContainerView.topAnchor).isActive = true
        lineView1.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        lineView1.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        shortDescriptionLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 18).isActive = true
        shortDescriptionLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        shortDescriptionLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        
        shortDescriptionDetailLabel.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 12).isActive = true
        shortDescriptionDetailLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        shortDescriptionDetailLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        
        lineView2.topAnchor.constraint(equalTo: shortDescriptionDetailLabel.bottomAnchor, constant: 20).isActive = true
        lineView2.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        lineView2.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        detailsLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 18).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        
        genreLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 12).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        genreLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        genreDetailLabel.topAnchor.constraint(equalTo: genreLabel.topAnchor).isActive = true
        genreDetailLabel.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 8).isActive = true
        
        releasedDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 8).isActive = true
        releasedDateLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        releasedDateLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        releasedDateDetailLabel.topAnchor.constraint(equalTo: releasedDateLabel.topAnchor).isActive = true
        releasedDateDetailLabel.leadingAnchor.constraint(equalTo: releasedDateLabel.trailingAnchor, constant: 8).isActive = true
    }
}

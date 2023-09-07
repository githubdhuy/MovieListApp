//
//  MovieTableViewCell.swift
//  MovieListApp
//
//  Created by Huy on 06/09/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    let thumbnailImageView = MovieThumbnailImageView(frame: .zero)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtitle"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    let onMyWatchListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ON MY WATCHLIST"
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .darkGray
        label.backgroundColor = .clear
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(onMyWatchListLabel)
        
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -12).isActive = true
        
        subtitleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        onMyWatchListLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        onMyWatchListLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        onMyWatchListLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

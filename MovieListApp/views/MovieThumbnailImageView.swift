//
//  MovieThumbnailImageView.swift
//  MovieListApp
//
//  Created by Huy on 06/09/2023.
//

import UIKit

class MovieThumbnailImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

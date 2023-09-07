//
//  UserModel.swift
//  MovieListApp
//
//  Created by Huy on 07/09/2023.
//

import Foundation

class UserModel: Codable {
    static var current = UserModel() // singleton
    
    var watchListIds = [Int]()
}

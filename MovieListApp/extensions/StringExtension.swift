//
//  String.swift
//  MovieListApp
//
//  Created by Huy on 06/09/2023.
//

import Foundation

extension String {
    func asDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
}

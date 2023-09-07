//
//  UIAlertActionExtension.swift
//  MovieListApp
//
//  Created by Huy on 06/09/2023.
//

import UIKit

extension UIAlertAction {
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        }
        set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
}


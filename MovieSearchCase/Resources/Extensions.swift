//
//  Extensions.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 10.02.2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

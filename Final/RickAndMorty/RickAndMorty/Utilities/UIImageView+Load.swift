//
//  UIImageView+Load.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 03.08.2023.
//

import UIKit

extension UIImageView {
    
    @MainActor
    func load(url: URL) async {
        if let (data, _) = try? await URLSession.shared.data(from: url) {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
    }
}

//
//  PackageViewModel.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import UIKit

class PackageViewModel {

    var package: Package

    var title: String {
        return package.title
    }
    
    var desc: String {
        return package.desc
    }
    
    lazy var thumbnails: [UIImage] = {
        return package.thumbnailUrls.compactMap { urlString in
            if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                return image
            }
            return nil
        }
    }()
    
    var includedProperties: [String] {
        return package.included
    }
    
    var excludedProperties: [String] {
        return package.excluded ?? [String]()
    }
    
    var paymentType: String {
        return package.payment
    }
    
    var price: Int {
        return package.price
    }
    
    var actionTitle: String {
        return package.action
    }
    
    var selectedImageIndex = 0
    
    init(package: Package) {
        self.package = package
    }

}


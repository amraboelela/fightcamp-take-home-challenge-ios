//
//  PackageViewModel.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import Foundation

class PackageViewModel {

    var package: Package

    var title: String {
        return package.title
    }
    
    var desc: String {
        return package.desc
    }
    
    var thumbnailUrls: [URL] {
        return package.thumbnailUrls.compactMap { URL(string: $0) }
    }
    
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
    
    init(package: Package) {
        self.package = package
    }

}


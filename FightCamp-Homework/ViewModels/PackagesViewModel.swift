//
//  PackagesViewModel.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import Foundation

class PackagesViewModel {

    var packageViewModels = [PackageViewModel]()
    
    private var packages = [Package]()
    
    init() {
        if let path = Bundle.main.path(forResource: "packages", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
            if let thePackages = try? JSONDecoder().decode([Package].self, from: data) {
                packages = thePackages
            }
        }
        for package in packages {
            packageViewModels.append(PackageViewModel(package: package))
        }
    }

}


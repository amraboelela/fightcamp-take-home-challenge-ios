//
//  PackageViewCell.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import UIKit

class PackageViewCell: UITableViewCell {
    var titleLabel = UILabel()
    
    init(packageViewModel: PackageViewModel) {
        titleLabel.text = packageViewModel.package.title
        super.init(style: CellStyle.default, reuseIdentifier: "PackageViewCell")
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

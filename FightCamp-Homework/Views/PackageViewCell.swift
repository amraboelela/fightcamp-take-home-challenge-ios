//
//  PackageViewCell.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import UIKit

class PackageViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var descLabel = UILabel()
    
    let margin = CGFloat(24)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: CellStyle.default, reuseIdentifier: "PackageViewCell")

        let containerView = UIView()
        addSubview(containerView)
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = margin
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descLabel)
        containerView.addSubview(verticalStackView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin).isActive = true
        containerView.backgroundColor = UIColor.primaryBackground
        containerView.layer.cornerRadius = CGFloat(8)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -margin).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin).isActive = true
        
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(viewModel: PackageViewModel) {
        titleLabel.text = viewModel.package.title.uppercased()
        titleLabel.textColor = UIColor.brandRed
        titleLabel.font = UIFont.title
        
        descLabel.text = viewModel.package.desc.capitalized
        descLabel.numberOfLines = 0
        descLabel.textColor = UIColor.label
        descLabel.font = UIFont.body
    }
}

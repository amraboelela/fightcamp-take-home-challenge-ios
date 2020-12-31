//
//  PackageViewCell.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import UIKit

class PackageViewCell: UITableViewCell {
    var packageViewModel: PackageViewModel?
    var titleLabel = UILabel()
    var descLabel = UILabel()
    var paymentLabel = UILabel()
    var priceLabel = UILabel()
    var actionButton = UIButton()
    var productImageView = UIImageView()
    var imagesStackView = UIStackView()
    var thumbnailsStackView = UIStackView()
    var propertiesStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: CellStyle.default, reuseIdentifier: "PackageViewCell")
        
        let packageView = UIView()
        addSubview(packageView)
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = CGFloat.packageSpacing
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descLabel)
        packageView.addSubview(verticalStackView)
        
        imagesStackView.axis = .vertical
        imagesStackView.spacing = CGFloat.thumbnailSpacing
        
        productImageView.contentMode = .scaleToFill
        productImageView.layer.cornerRadius = CGFloat.thumbnailRadius
        productImageView.layer.masksToBounds = true
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.heightAnchor.constraint(equalToConstant: CGFloat.thumbnailHeight).isActive = true
        
        thumbnailsStackView.axis = .horizontal
        thumbnailsStackView.spacing = CGFloat.thumbnailSpacing
        thumbnailsStackView.distribution = .fillEqually
        
        imagesStackView.addArrangedSubview(productImageView)
        imagesStackView.addArrangedSubview(thumbnailsStackView)
        
        verticalStackView.addArrangedSubview(imagesStackView)
        
        propertiesStackView.axis = .vertical
        propertiesStackView.spacing = CGFloat(8)
        verticalStackView.addArrangedSubview(propertiesStackView)
        
        let paymentStackView = UIStackView()
        paymentStackView.axis = .vertical
        paymentStackView.spacing = CGFloat(8)
        paymentStackView.alignment = .center
        
        paymentStackView.addArrangedSubview(paymentLabel)
        paymentStackView.addArrangedSubview(priceLabel)
        
        let bottomStackView = UIStackView()
        bottomStackView.axis = .vertical
        bottomStackView.alignment = .fill
        bottomStackView.spacing = CGFloat.packageSpacing
        
        bottomStackView.addArrangedSubview(paymentStackView)
        
        actionButton.layer.cornerRadius = CGFloat.buttonRadius
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.heightAnchor.constraint(equalToConstant: CGFloat.buttonHeight).isActive = true
        
        bottomStackView.addArrangedSubview(actionButton)
        verticalStackView.addArrangedSubview(bottomStackView)
        
        packageView.translatesAutoresizingMaskIntoConstraints = false
        packageView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.packageSpacing).isActive = true
        packageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        packageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.packageSpacing).isActive = true
        packageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.packageSpacing).isActive = true
        packageView.backgroundColor = UIColor.primaryBackground
        packageView.layer.cornerRadius =  CGFloat.packageRadius
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: packageView.topAnchor, constant: CGFloat.packageSpacing).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: packageView.bottomAnchor, constant: -CGFloat.packageSpacing).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: packageView.leadingAnchor, constant: CGFloat.packageSpacing).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: packageView.trailingAnchor, constant: -CGFloat.packageSpacing).isActive = true
        
        self.backgroundColor = UIColor.clear
        
        titleLabel.textColor = UIColor.brandRed
        titleLabel.font = UIFont.title
        
        descLabel.numberOfLines = 0
        descLabel.textColor = UIColor.label
        descLabel.font = UIFont.body
        
        paymentLabel.textColor = UIColor.label
        paymentLabel.font = UIFont.body
        
        priceLabel.textColor = UIColor.label
        priceLabel.font = UIFont.price
        
        actionButton.setTitleColor(UIColor.buttonTitle, for: .normal)
        actionButton.backgroundColor = UIColor.buttonBackground
        actionButton.titleLabel?.font = UIFont.button
        
        self.contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(viewModel: PackageViewModel) {
        packageViewModel = viewModel
        titleLabel.text = viewModel.title.uppercased()
        descLabel.text = viewModel.desc.capitalized
        
        for arrangedSubview in thumbnailsStackView.arrangedSubviews {
            arrangedSubview.removeFromSuperview()
        }
        var count = 0
        for thumbnail in viewModel.thumbnails {
            let button = UIButton()
            button.setImage(thumbnail, for: .normal)
            
            button.layer.cornerRadius = CGFloat.thumbnailRadius
            button.layer.borderWidth = CGFloat.thumbnailBorderWidth
            button.layer.masksToBounds = true
            let selected = viewModel.selectedImageIndex == count
            if selected {
                productImageView.image = thumbnail
            }
            button.layer.borderColor = UIColor.thumbnailBorder(selected: selected).cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            button.tag = count
            thumbnailsStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(imageTapped(sender:)), for: .touchUpInside)
            count += 1
        }
        
        for arrangedSubview in propertiesStackView.arrangedSubviews {
            arrangedSubview.removeFromSuperview()
        }
        for includedProperty in viewModel.includedProperties {
            let includedPropertyLabel = UILabel()
            includedPropertyLabel.text = includedProperty.capitalized
            includedPropertyLabel.textColor = UIColor.label
            includedPropertyLabel.font = UIFont.body
            propertiesStackView.addArrangedSubview(includedPropertyLabel)
        }
        for excludedProperty in viewModel.excludedProperties {
            let excludedPropertyLabel = UILabel()
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: excludedProperty.capitalized)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            excludedPropertyLabel.attributedText = attributeString
            excludedPropertyLabel.textColor = UIColor.disabledLabel
            excludedPropertyLabel.font = UIFont.body
            propertiesStackView.addArrangedSubview(excludedPropertyLabel)
        }
        
        paymentLabel.text = viewModel.paymentType.capitalized
        priceLabel.text = "$\(viewModel.price)"
        actionButton.setTitle(viewModel.actionTitle.capitalized, for: .normal)
    }
    
    @objc func imageTapped(sender: UIButton) {
        if let packageViewModel = packageViewModel {
            packageViewModel.selectedImageIndex = sender.tag
            updateWith(viewModel: packageViewModel)
        }
    }
    
}

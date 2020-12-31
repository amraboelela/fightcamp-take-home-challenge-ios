//
//  PackagesViewController.swift
//  FightCamp
//
//  Created by Amr Aboelela on 12/30/20.
//

import UIKit

class PackagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var packagesViewModel: PackagesViewModel
    var tableView = UITableView()

    init(viewModel: PackagesViewModel) {
        packagesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.backgroundColor = UIColor.secondaryBackground
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(PackageViewCell.self, forCellReuseIdentifier: "PackageViewCell")
        tableView.separatorColor = .clear
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packagesViewModel.packageViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let packageViewCell = tableView.dequeueReusableCell(withIdentifier: "PackageViewCell") as? PackageViewCell {
            packageViewCell.updateWith(viewModel: packagesViewModel.packageViewModels[indexPath.row])
            return packageViewCell
        }
        return UITableViewCell()
    }

}


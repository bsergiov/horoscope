//
//  DevelopersTableViewCell.swift
//  horoscope
//
//  Created by BSergio on 09.01.2022.
//

import UIKit

class DevelopersTableViewCell: UITableViewCell {

    
    // MARK: - IB Outlets
    @IBOutlet weak var avaDeveloper: UIImageView!
    
    @IBOutlet weak var developerNameLabel: UILabel!
    @IBOutlet weak var roleDeveloperLabel: UILabel!
    
    // MARK: - Public Properties
    var developer: DeveloperModel!
    
    // MARK: - Public methods
    func setupCell() {
        avaDeveloper.image = UIImage(named: developer.image)
        
        developerNameLabel.text = developer.name
        roleDeveloperLabel.text = developer.title
    }
    

}


//
//  DeveloperTableViewController.swift
//  horoscope
//
//  Created by BSergio on 09.01.2022.
//

import UIKit

class DeveloperTableViewController: UITableViewController {

   // MARK: - Public Properties
    let developers = DeveloperModel.getDeveloperModel()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        tableView.rowHeight = 250
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevelopersTableViewCell", for: indexPath) as!  DevelopersTableViewCell

        cell.developer = developers[indexPath.row]
        cell.setupCell()

        return cell
    }
}

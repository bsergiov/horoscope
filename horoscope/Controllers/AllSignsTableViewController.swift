//
//  AllSignsTableViewController.swift
//  horoscope
//
//  Created by BSergio on 06.01.2022.
//

import UIKit

class AllSignsTableViewController: UITableViewController {
    
    var signsModel: [SignModel] = SignModel.getSigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 128
        navigationItem.title = "Знаки Зодиака"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        signsModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignsCell", for: indexPath)
        
        let sign = signsModel[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = sign.sign
        content.secondaryText = sign.shortDescription
        content.image = UIImage(named: sign.signImg)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let track = signsModel[indexPath.row]
        performSegue(withIdentifier: "showAboutSign", sender: track)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutSignVC = segue.destination as? AboutSignViewController else { return }
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        let track = trackList[indexPath.row]
        aboutSignVC.signModel = sender as? SignModel
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
}

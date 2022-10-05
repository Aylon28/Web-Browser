//
//  TableViewController.swift
//  WebBrowser
//
//  Created on 4.10.22.
//

import UIKit

class TableViewController: UITableViewController {
    let websites = ["translate.google.com", "apple.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "webView") as? ViewController {
            nextVC.selectedSite = indexPath.row
            nextVC.websites = websites
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }

}

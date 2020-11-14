//
//  ViewController.swift
//  GAPSI
//
//  Created by Sokolabs on 13/11/20.
//  Copyright © 2020 josue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var products = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProducts", for: indexPath) as! ProductsViewCell
        
        let titles = (products).value(forKey: "title") as! [String]
        let prices = (products).value(forKey: "price") as! [NSNumber]
        
        cell.lblName.text = "\(titles[indexPath.row])"
        cell.lblPrice.text = "\(ceil(Double(prices[indexPath.row])))"
        
        return cell
    }
    
    func convertUrlToImage(_ url: String)->UIImage {
        return UIImage()
    }
    
    
}


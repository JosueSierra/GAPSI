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
        searchBar.placeholder = "Please enter the product to search"
        // Do any additional setup after loading the view.
    }
    
    public func loadWindow(){
           let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
           
           alert.view.tintColor = UIColor.black
           let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect.init(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
           loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
           loadingIndicator.startAnimating();
           
           alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
           
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
        let urlImage = (products).value(forKey: "image") as! [String]
        
        cell.lblName.text = "\(titles[indexPath.row])"
        cell.lblPrice.text = "$\(ceil(Double(prices[indexPath.row])))"
        cell.imgProduct.image = convertUrlToImage(urlImage[indexPath.row])
        
        return cell
    }
    
    func convertUrlToImage(_ url: String)->UIImage {
        let url = URL(string: url)
           if let data = try? Data(contentsOf: url!)
           {
            let image: UIImage = UIImage(data: data)!
            return image
           }
        return UIImage()
    }
    
    
}


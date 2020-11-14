//
//  ProductFinder.swift
//  GAPSI
//
//  Created by Sokolabs on 13/11/20.
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
         searchController.showsSearchResultsController = true
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let headers: HTTPHeaders = [
                    "X-IBM-Client-Id": "7cb89f3e-6b59-4166-9f01-68e56a3fead8"
                ]
        let urlRequest = Request.instance.searchProducts(searchBar.text!)
                var requestProduct = AF.request(urlRequest, method: .get,   headers: headers).responseJSON { (response) in
        
                    self.products = (response.value! as! NSDictionary).value(forKey: "items") as! NSArray
                    self.tableView.reloadData()
                }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        products = []
        tableView.reloadData()
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
    
}

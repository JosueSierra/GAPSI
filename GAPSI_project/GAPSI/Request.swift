//
//  Request.swift
//  GAPSI
//
//  Created by Sokolabs on 13/11/20.
//  Copyright © 2020 josue. All rights reserved.
//

import Foundation
import UIKit

class Request {
    
    public let instance = Request()
    
    public func searchProducts(_ keys: [String])->String{
        return "https://00672285.us-south.apigw.appdomain.cloud/demo-gapsi/search?&query=\(keys)"
        
    }
}



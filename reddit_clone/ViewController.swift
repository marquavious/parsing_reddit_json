//
//  ViewController.swift
//  reddit_clone
//
//  Created by Marquavious on 7/8/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireNetworkActivityIndicator



class ViewController: UIViewController {
    
    let redditURL = "https://www.reddit.com/.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, redditURL).validate().responseJSON() { response  in
            switch response.result{
            case .Success:
                if let value = response.result.value {
                    
                   var json = JSON(value)
                    
//                    print(json)
//                    print(json["data"]["children"][0]["data"]["domain"])
                    
                    var dataVar = json["data"]
                    
//                    print(dataVar)
                    var children = dataVar["children"]
                    
                    
//                    print(children[0])
//                    print(children[0]["data"]["title"])
                    
                    var postArray = [JSON]()
                    
                    for child in children.arrayValue {
                        
                        postArray.append(child)
                        
                    
                    }
                    print(postArray)
                
                }
                
                
                

                
                
                
            case .Failure(let error):
                print(error)
                
                
                
                
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


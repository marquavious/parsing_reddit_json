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


//IMPORT THE ABOVE ELEMENTS



class ViewController: UIViewController {
    
    
    //BELOW WE SET THE JSON URL TO A VARIABLE TO BE USED AS ACESS TO THE JSON FILE
    let redditURL = "https://www.reddit.com/.json"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //BELOW,  WE USE ALAMOFIRE TO GET THE JSON, VALIDATE IT, THEN RETURN IT IN JSON
        //WE ALSO USE A BLOCK STATMENT TO CONFIRM THE REQUEST
        //USING A BLOCK BTW
        Alamofire.request(.GET, redditURL).validate().responseJSON() { response  in
            
            //SUCSESS CASE SWITCH
            
            switch response.result{
                
            case .Success:
                //IF ITS A SUCSESS, WE SE A VALUE VARIABLE TO THE RESPONCE OF THE JSON AND PUT IT IN A IF CONDITION
                if let value = response.result.value {
                    
                    //HERE, WE SET json to JSOON(value)
                    var json = JSON(value)
                    //BELOW, WE PRINT THE JSON FOR TESTING
                    
                    //                    print(json)
                    //BELOW, WE PRINT IT OUT USING SWIFTYJSON
                    print(json["data"]["children"][0]["data"]["domain"])
                    
                    //HERE, WE CAN SET VARIBLE TO DIFFRENT SETS IN JSON FILES
                    var dataVar = json["data"]
                    
                    //HERE WE SET THE DIFFRENT VALUES AND DICTIONRIES BLA BLA BLA...
                    var children = dataVar["children"]
                    //                    print(children[0])
                    //                    print(children[0]["data"]["title"])
                    
                    //HERE WE SET THE ARRAY TO A JSON VALUE SO WE CAN USE IT AS AN ARRAY.....
                    var postArray = [JSON]()
                    //HERE, WE DO SOME WIERD SHIT
                    //FOR CHILD IN THE VALUE OF THE ARRAY VALUE, WE ADD THE ITEMS TO THE ARRAY
                    for child in children.arrayValue {
                        
                        postArray.append(child)
                        
                        
                    }
                    //PRINTS ARRAY
                    print(postArray)
                }
            //IN CASE OF FAILURE
            case .Failure(let error):
                print(error)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


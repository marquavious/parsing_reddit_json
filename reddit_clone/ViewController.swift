//
//  ViewController.swift
//  reddit_clone
//
//  Created by Marquavious on 7/8/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

//IMPORT THE BELOW ELEMENTS
import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    //BELOW, WE SET OUR JAON URL TO A VARIABLE TO BE USED BY ALAMOFIRE LATER
    let redditURL = "https://www.reddit.com/.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //BELOW, WE USE ALAMOFIRE TO GET THE JSON, VALIDATE IT, THEN RETURN IT IN JSON
        Alamofire.request(redditURL).validate().responseJSON() { response  in
            
            //SUCCESS CASE SWITCH
            switch response.result{
                
            case .success:
            
            //IF ITS A SUCCESS, WE SET THE value VARIABLE TO THE RESPONSE OF THE JSON AND THEN UNWRAP IT
                if let value = response.result.value {
                    
                    //HERE, WE SET json to JSON(value)
                    //BY USING THE SWIFTYJSON FRAMEWORK, WE CAN USE THEIR JSON STRUCT TO 
                    //ALLOW US TO PARSE IT EASILY
                    var json = JSON(value)

                    //BELOW, WE PRINT IT OUT USING SWIFTYJSON
                    //WE GOT THE KEYS FROM OUR JSON
                    //SWIFTYJSON ALLOWS US TO USE THIS SIMPLE SYNTAX TO RECIVE DATA
                    print(json["data"]["children"][0]["data"]["domain"])
                    
                    //HERE, WE SET VARIABLES TO DIFFERENT DATA SETS IN JSON FILES
                    var dataVar = json["data"]
                    
                    //HERE WE SET THE children VARIABLE TO THE NEXT LEVEL JSON FROM THE dataVar VARIABLE
                    //BASICLY WHAT WE DID ABOVE(json["data"]["children"][0]["data"]["domain"]), BUT MORE WORK.
                    var children = dataVar["children"]
                    
                    //HERE, WE CREATE AN ARRAY OF JSON VALUES SO WE CAN USE IT IN A FOR LOOP .....
                    var postArray = [JSON]()
                    
                    //FOR CHILD IN THE VALUE OF THE ARRAY VALUE, WE ADD THE ITEMS TO THE ARRAY
                    for child in children.arrayValue {
                        postArray.append(child)
                    }
                    
                    //PRINTS ARRAY
                    print(postArray)
                }
                
            // IN CASE WE DONT RECEIVE DATA
            case .failure(let error):
                print(error)
            }
        }
    }
}


//
//  CarsModel.swift
//  WebServiceHitDemo
//
//  Created by MAC on 20/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

struct ImagesModel {
    let id : String!
    var comments = 0
    var downloads = 0
    var favorites = 0
    var likes = 0
    var views = 0
    var pageURL : String = ""
    var userImageURL : String = ""
    var previewWidth: Int = 0
    var imageWidth: Int = 0
    var webformatURL: String = ""
    var previewURL: String = ""
    var imageData : JSON?  = []
   
    init(withJSON json: JSON) {
        
        self.id = json["id"].stringValue
        self.comments = json["comments"].intValue
        self.downloads = json["downloads"].intValue
        self.favorites = json["favorites"].intValue
        self.likes = json["likes"].intValue
        self.views = json["views"].intValue
        self.pageURL = json["pageURL"].stringValue
        self.userImageURL = json["userImageURL"].stringValue
        self.webformatURL = json["webformatURL"].stringValue
        self.previewURL = json["previewURL"].stringValue
        
    }

    
    
//
//    func  setValues(_ response : JSON){
//      
//        carsPicturesData = response["hits"].arrayValue
//        print(carsPicturesData[0]["previewURL"])
//         imageData = carsPicturesData[0]["previewURL"]
//        
//    }
//    func getValue()-> String{
//    print("----------------")
//    print((imageData?.stringValue)!)
//    return (imageData?.stringValue)!
//    
//}
    
    
    
    
//    "imageHeight" : 2250,
//    "user" : "lipetkd",
//    "previewWidth" : 150,
//    "imageWidth" : 4000,
//    "likes" : 195,
//    "previewHeight" : 84,
//    "webformatHeight" : 360,
//    "tags" : "car, sports car, wedding car",
//    "type" : "illustration",
//    "downloads" : 13253,
//    "webformatURL" : "https:\/\/pixabay.com\/get\/ed3cb30820e90825d0471401e04c4e95e570ffd41db9164795f8c17caf_640.jpg",
//    "views" : 173493,
//    "id" : 49278,
//    "favorites" : 86,
//    "webformatWidth" : 640,
//    "pageURL" : "https:\/\/pixabay.com\/en\/car-sports-car-wedding-car-49278\/",
//    "previewURL" : "https:\/\/cdn.pixabay.com\/photo\/2012\/05\/29\/00\/43\/car-49278_150.jpg",
//    "comments" : 39,
//    "user_id" : 4592,
//    "userImageURL" : "https:\/\/cdn.pixabay.com\/user\/2012\/05\/29\/00-42-25-95_250x250.png"
//    
    
}




//
//  VehicleModel.swift
//  MyntraLookLike
//
//  Created by MAC on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


struct VehicleModel {
    
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
    
    var isFav = false
    
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
    
}
//class SearchQuery{
//    
//    let jsonData : [ String : Any ] = [
//        "Cars" : [
//            "0" : "Audi",
//            "1" : "Marcedes",
//            "2" : "BMW",
//            "3" : "Ferari",
//            "4" : "Jaguar"
//        ],
//        "Bikes" : [
//            "0" : "Suzuki",
//            "1" : "Hero",
//            "2" : "Honda",
//            "3" : "Bajaj Bikes",
//            "4" : "yamaha"
//        ],
//        "Trucks" : [
//            "0" : "Bajaj trucks",
//            "1" : "Ashok LeyLand",
//            "2" : "Mahindra Trucks",
//            "3" : "Tata Trucks",
//            "4" : "Ford Trucks"
//        ]
//    ]
//    
//    func getSearchQuery(_ sectionheader : String,_ rowValue : Int) -> String? {
//        return ((jsonData[sectionheader] as! [String : Any])["\(rowValue)"] as! String )
//        
//    }
//    
//}
//
//
//
//
////    "imageHeight" : 2250,
////    "user" : "lipetkd",
////    "previewWidth" : 150,
////    "imageWidth" : 4000,
////    "likes" : 195,
////    "previewHeight" : 84,
////    "webformatHeight" : 360,
////    "tags" : "car, sports car, wedding car",
////    "type" : "illustration",
////    "downloads" : 13253,
////    "webformatURL" : "https:\/\/pixabay.com\/get\/ed3cb30820e90825d0471401e04c4e95e570ffd41db9164795f8c17caf_640.jpg",
////    "views" : 173493,
////    "id" : 49278,
////    "favorites" : 86,
////    "webformatWidth" : 640,
////    "pageURL" : "https:\/\/pixabay.com\/en\/car-sports-car-wedding-car-49278\/",
////    "previewURL" : "https:\/\/cdn.pixabay.com\/photo\/2012\/05\/29\/00\/43\/car-49278_150.jpg",
////    "comments" : 39,
////    "user_id" : 4592,
////    "userImageURL" : "https:\/\/cdn.pixabay.com\/user\/2012\/05\/29\/00-42-25-95_250x250.png"
////
//
//
//
//
//

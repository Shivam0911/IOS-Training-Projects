//
//  WebServices.swift
//  WebServiceHitDemo
//
//  Created by MAC on 21/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import Foundation
import SwiftyJSON

class WebServices {
    
    func fetchDataFromPixabay(withQuery query: String,
                              success : @escaping (([ImagesModel]) -> Void),
                              failure : @escaping ((Error) -> Void)) {
        
        let URL = "https://pixabay.com/api/"
        
        let parameters = ["key" : "4608367-6e44818b4d4b3d9094faa3be8",
                          "q" : query
        ]
        
        NetWorkController().GET(URL: URL,
                                parameters : parameters,
                                success : { (json : JSON) in
                                    
                                    print(json)
                                    
                                    let imagesArray = json["hits"].arrayValue
                                    
                                    var imageModels = [ImagesModel]()
                                    
                                    for image in imagesArray {
                                        
                                        imageModels.append(ImagesModel(withJSON: image))
                                    }
                                    
                                    success(imageModels)
                                    
        }, failure : { (error : Error) in
            
            failure(error)
        })
        
    }
    
}

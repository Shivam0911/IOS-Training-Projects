//
//  App.swift
//  TotaliOSBlueprintApps
//
//  Created by Duc Tran on 9/11/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation

struct App {
    var name: String
    var level: String
    var imageName: String
}

struct TIBApps {
    static func getAllApps() -> [App] {
        return [
            App(name: "Headsup Question Generator Game", level: "beginner", imageName: "1"),
            App(name: "Motivational Quotes App", level: "beginner", imageName: "2"),
            App(name: "Online course with video streaming", level: "beginner", imageName: "3"),
            App(name: "Online shopping cart app", level: "beginner", imageName: "4"),
            App(name: "Photos browser with UITableView", level: "intermediate", imageName: "5"),
            App(name: "REST API and JSON: Restaurants Explorer", level: "intermediate", imageName: "6"),
            App(name: "REST API and JSON: weather forecast app", level: "intermediate", imageName: "7"),
            App(name: "UICollectionView: News Reader", level: "intermediate", imageName: "8"),
            App(name: "REST API and JSON: Instagram Browser", level: "intermediate", imageName: "9"),
            App(name: "Journal App with Core Data", level: "advanced", imageName: "10"),
            App(name: "Build Twitter with Firebase Webinar", level: "advanced", imageName: "11")
        ]
    }
}







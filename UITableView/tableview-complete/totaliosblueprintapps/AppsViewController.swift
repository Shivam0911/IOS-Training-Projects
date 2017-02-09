//
//  AppsViewController.swift
//  TotaliOSBlueprintApps
//
//  Created by Duc Tran on 9/15/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
 
    var apps = TIBApps.getAllApps()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.estimatedRowHeight = 376
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension AppsViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell") as! AppTableViewCell
        let app = apps[indexPath.row]
        
        cell.app = app
        
        return cell
    }
}

















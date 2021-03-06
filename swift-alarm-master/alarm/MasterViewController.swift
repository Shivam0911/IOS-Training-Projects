//
//  MasterViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects: [Alarm] = []


    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // #pragma mark - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

        let object = objects[indexPath.row] as Alarm
        cell.textLabel?.text = object.title
        return cell
    }

}


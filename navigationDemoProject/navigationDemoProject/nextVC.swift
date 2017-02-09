//
//  nextVC.swift
//  navigationDemoProject
//
//  Created by MAC on 02/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class nextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.topViewController?.title = "some title"
        
        self.title = "DEMO ClASS"
        // used to change the title of the navigation bar
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popButton(_ sender: UIButton) {
      _ =  self.navigationController?.popViewController(animated: true)
              }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

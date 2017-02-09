//
//  ViewController.swift
//  Our_First_UI_Project
//
//  Created by MAC on 30/01/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var InputText: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func EndButton(_ sender: UIButton) {
        self.WelcomeLabel.text = "Welcome" + self.InputText.text! + "!!!"
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        
        
    }

}


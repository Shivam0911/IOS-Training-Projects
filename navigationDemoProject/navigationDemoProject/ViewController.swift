//
//  ViewController.swift
//  navigationDemoProject
//
//  Created by MAC on 02/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let backGround = storyBoardScene.instantiateViewController(withIdentifier : "bGroundID") as! bGround
//        self.view.addSubview(backGround)
//        backGround.view.frame.origin = CGPoint(x:20 ,y:20)
//        self.addChildViewController(backGround)
//        self.view.addSubview(backGround.view)
//        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goToNextVCButton(_ sender: UIButton) {
     //    let nextScene = nextVC()
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navi = storyBoardScene.instantiateViewController(withIdentifier : "nextID") as! nextVC
        navigationController?.pushViewController(navi, animated: true)
        
    }


}


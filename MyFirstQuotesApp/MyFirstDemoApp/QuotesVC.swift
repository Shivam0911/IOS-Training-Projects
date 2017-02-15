//
//  QuotesVC.swift
//  MyFirstDemoApp
//
//  Created by MAC on 30/01/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class QuotesVC: UIViewController {
    var getQuoteStr = ["This is The Survival Of The Fittest","Belive in Bhole"]
    var getQuoteAuthor = ["Eminem","Shivam"]
    var index = 0
    @IBOutlet weak var addQuoteToStringButtonOutlet: UIButton!
    @IBOutlet weak var getQuoteLabel: UILabel!
    @IBOutlet weak var writtenByLabel: UILabel!
    @IBOutlet weak var addAuthorNameTextField: UITextField!
    @IBOutlet weak var addQuoteTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        index = getQuoteStr.startIndex
               // Do any additional setup after loading the view.
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    
        self.view.endEditing(true)
    }
    /*
     func addQuoteToString(_ sender: UIButton) is mainly used to append the Quotes entered manually and the Respected Author
     
     */
    @IBAction func addQuoteToString(_ sender: UIButton) {
        if (self.addQuoteTextView.text ) != nil && (self.addAuthorNameTextField.text) != nil {
            getQuoteStr.append(self.addQuoteTextView.text)
            getQuoteAuthor.append(self.addAuthorNameTextField.text!)
            self.addQuoteTextView.text = ""
            self.addAuthorNameTextField.text = ""
            
        }
    }
    /*
         func getNewQuoteButton(_ sender: Any)
            this function is mainly used for setting the QuoteLabel and WriitenBy label
            and also sending outlets to back and front
     */
    
    @IBAction func getNewQuoteButton(_ sender: Any) {
        if index < getQuoteStr.count {
            index = index + 1
        }
        else {
            index = 1
        }
        self.view.sendSubview(toBack: self.addQuoteTextView )                                   //  sends addQuoteTextView to back
        self.view.sendSubview(toBack: self.addAuthorNameTextField)                              //  sends addAuthorNameTextField to back
        self.view.sendSubview(toBack: self.addQuoteToStringButtonOutlet)                        //  sends addQuoteToStringButtonOutlet to back
        self.view.bringSubview(toFront: self.getQuoteLabel)                                     //  sends getQuoteLabel to front
        self.view.bringSubview(toFront: self.writtenByLabel)                                    //  sends writtenByLabel to front
        self.getQuoteLabel.text = getQuoteStr[index-1]
        self.writtenByLabel.text = "By-" + getQuoteAuthor[index - 1]
    
    }
    
    /*
    func addQuotesButton(_ sender: UIButton) 
     This is used mainly to show and hide the textfield ,
     textView , addQuoteToStringButtonOutlet and all the outlets
     
     */
    @IBAction func addQuotesButton(_ sender: UIButton) {
        self.view.sendSubview(toBack: self.getQuoteLabel )                                       //     sends getQuoteLabel to  back
        self.view.sendSubview(toBack:  self.writtenByLabel)                                      //     sends writtenByLabel to  back
        self.view.bringSubview(toFront: self.addQuoteTextView)                                   //     sends addQuoteTextView to front
        self.view.bringSubview(toFront: self.addAuthorNameTextField)                             //     sends addAuthorNameTextField to front
       self.view.bringSubview(toFront: self.addQuoteToStringButtonOutlet)                        //     sends addQuoteToStringButtonOutlet to front
        
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

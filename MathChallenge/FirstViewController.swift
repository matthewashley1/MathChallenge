//
//  ViewController.swift
//  MathChallenge
//
//  Created by Matthew Ashley on 9/21/16.
//  Copyright © 2016 Matthew Ashley. All rights reserved.
//

import UIKit
import CloudKit

class FirstViewController: UIViewController, UIApplicationDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocDbc.databaseSetup()
        LocDbc.pullQuestionsFromDatabase()
        LocDbc.setHighScores()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func higeScorebtn(_ sender: Any) {
        
        LocDbc.pageTransfer = "First"
        
        let vc: AnyObject! = self.storyboard?.instantiateViewController(withIdentifier: "High Score")
        self.show(vc as! UIViewController, sender: vc)
        
    }
}


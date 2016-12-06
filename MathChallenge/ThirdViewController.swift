//
//  ThirdViewController.swift
//  MathChallenge
//
//  Created by Matthew Ashley on 9/22/16.
//  Copyright © 2016 Matthew Ashley. All rights reserved.
//

import UIKit
import CloudKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        finalScoreLabel.text = LocDbc.returnFinalScore()
        
    }

   




}

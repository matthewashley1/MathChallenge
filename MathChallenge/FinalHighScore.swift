//
//  FinalHighScore.swift
//  MathChallenge
//
//  Created by Matthew Ashley on 9/22/16.
//  Copyright © 2016 Matthew Ashley. All rights reserved.
//

import UIKit
import CloudKit

class FinalHighScore: UIViewController {

    @IBOutlet weak var highestScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        highestScore.text = LocDbc.highScore[0].score

    }
    
}

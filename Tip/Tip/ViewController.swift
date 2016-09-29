//
//  ViewController.swift
//  Tip
//
//  Created by David Lashkhi on 28/09/2016.
//  Copyright © 2016 David Lashkhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var totalSum: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    var percentage: Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        var startValue = 0
        switch sender.state {
        case .began:
            startValue = Int(translation.x)
            break
        case .ended:
            
        default:
            <#code#>
        }
        if sender.state == .began {
            startValue = Int(translation.x)
        }
        
        if percentage >= 0 {
            percentage = startValue + Int(translation.x/100)
            print(translation)
            tipPercentage.text = String(percentage)
        }
    }



}


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
        view.endEditing(true)
        let velocity = sender.velocity(in: view)
        if sender.state == .changed {
            changeTipValue(tip:Int(velocity.x/100))
        }
    }
    
    func changeTipValue(tip: Int) {
        percentage = min(100, percentage + tip)
        var percentageToMultiply = Double(percentage + 100)/100
        if percentage < 0 {
            percentage = 0
            percentageToMultiply = 1
        }
        if ((amount.text?.characters.count) != 0) {
            let sumWithTips = Double(amount.text!)! * percentageToMultiply
            tipPercentage.text = String(percentage) + "%"
            totalSum.text = String(format: "%.f$", sumWithTips)
        } else {
            totalSum.text = "0"
        }
        
    }
}


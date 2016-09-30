//
//  ViewController.swift
//  Tip
//
//  Created by David Lashkhi on 28/09/2016.
//  Copyright © 2016 David Lashkhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        amount.becomeFirstResponder()
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
            totalSum.alpha = 1
            changeEmojiForTipValue(tip: percentage)
        } else {
            totalSum.alpha = 0
        }
        
    }
    
    func changeEmojiForTipValue(tip: Int) {
        if (emojiLabel.alpha == 0) {
            UIView.animate(withDuration: 1.0, animations: {
                self.emojiLabel.alpha = 1
            })
        }
        
        switch tip {
        case 0..<10:
            emojiLabel.text = "😡"
        case 10..<20:
            emojiLabel.text = "😐"
        case 20..<30:
            emojiLabel.text = "🙂"
        case 30..<40:
            emojiLabel.text = "☺️"
        case 40..<50:
            emojiLabel.text = "😌"
        case 50..<60:
            emojiLabel.text = "😘"
        case 60..<70:
            emojiLabel.text = "😍"
        case 70..<80:
            emojiLabel.text = "😻"
        case 80..<90:
            emojiLabel.text = "😻😍"
        case 90..<101:
            emojiLabel.text = "😻😍❤️"
        default:
            emojiLabel.alpha = 0
        }
    }
    
}


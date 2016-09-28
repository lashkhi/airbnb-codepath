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
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    var percentage: Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGestureRecognizers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    fileprivate func configureGestureRecognizers() {
        rightSwipe.addTarget(self, action: #selector(changePercentage))
        leftSwipe.addTarget(self, action: Selector("changePercentage:"))
    
    }
    
     func changePercentage(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            percentage += 1
            break
        case UISwipeGestureRecognizerDirection.left:
            percentage -= 1
            break
        default:
            break
        }
        tipPercentage.text = String(percentage)
    }

}


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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


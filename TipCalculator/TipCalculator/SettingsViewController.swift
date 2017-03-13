//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Lath, Bhavesh on 3/12/17.
//  Copyright © 2017 Lath, Bhavesh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultCalculate(defaultVal: defaults.integer(forKey: "DefaultValKey"))
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "DefaultValKey")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.<#code#>
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tipSelector(_ sender: Any) {
        defaultCalculate(defaultVal: tipControl.selectedSegmentIndex)
    }
    
    func defaultCalculate(defaultVal: NSInteger){
        let defaults = UserDefaults.standard
        defaults.set(defaultVal, forKey: "DefaultValKey")
        defaults.synchronize()
    }

}

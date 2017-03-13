//
//  ViewController.swift
//  TipCalculator
//
//  Created by Lath, Bhavesh on 3/6/17.
//  Copyright © 2017 Lath, Bhavesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will Appear")
        storeLastBill(lastBill: defaults.double(forKey: "LastBill"))
        billField.text = String((defaults.double(forKey: "LastBill")))
        defaultCalculate(defaultVal: defaults.integer(forKey: "DefaultValKey"))
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "DefaultValKey")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(animated)
        // Do any additional setup after loading the view, typically from a nib.<#code#>
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any){
        
        let tipPercentage = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!)  ?? 0
        let tip = bill * tipPercentage[defaults.integer(forKey: "DefaultValKey")]
        let total = bill + tip
        storeLastBill(lastBill: bill)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func tipPercentageSelector(_ sender: Any) {
        defaultCalculate(defaultVal:tipControl.selectedSegmentIndex)
        let bill = Double(billField.text!)  ?? 0
        storeLastBill(lastBill: bill)
        calculateTip(sender)
    }
    
    func defaultCalculate(defaultVal: NSInteger){
        let defaults = UserDefaults.standard
        defaults.set(defaultVal, forKey: "DefaultValKey")
        defaults.synchronize()
    }
    
    func storeLastBill(lastBill: Double){
        let defaults = UserDefaults.standard
        defaults.set(lastBill, forKey: "LastBill")
        defaults.synchronize()
    }
}


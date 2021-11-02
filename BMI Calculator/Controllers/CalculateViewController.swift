//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiBrain = BMIBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = String(format: "%.2f", sender.value) + "kg"
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
        
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        print("\(heightSlider.value)  \(weightSlider.value)")
        
        bmiBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            
            var destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiBrain.getBMIValue()
            destinationVC.advice = bmiBrain.getAdvice()
            destinationVC.color = bmiBrain.getColor()
            
        }
        
    }

}


//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by user205198 on 10/13/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct BMIBrain{
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/(height * height)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more snack.", color: #colorLiteral(red: 0.2, green: 0, blue: 1.0, alpha: 0.5))
            print("Underweight")
        }
        else if bmiValue < 21.5{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle.", color: #colorLiteral(red: 0, green: 1.0, blue: 0, alpha: 0.5))
            print("Normal")
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less.", color: #colorLiteral(red: 1.0, green: 0, blue: 0, alpha: 0.56))
            print("Overweight")
        }
    }
    
    func getBMIValue() -> String{
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "Error"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.red
    }
}

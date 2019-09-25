//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Xcode User on 9/18/19.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate{

    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var fromInputFied: DecimalMinusTextField!
    @IBOutlet weak var toInputField: DecimalMinusTextField!
    var mode = CalculatorMode.Length;
    var fromLenUnit = LengthUnit.Yards
    var toLenUnit = LengthUnit.Meters
    var fromVolUnit = VolumeUnit.Liters
    var toVolUnit = VolumeUnit.Gallons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let detectTouch = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
    }

    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    
    @IBAction func clearButtonTap(_ sender: UIButton) {
        self.fromInputFied.text = ""
        self.toInputField.text = ""
    }


    @IBAction func calButton(_ sender: UIButton) {
        var fromDouble = (self.fromInputFied.text as! NSString).doubleValue
        var toDouble = (self.toInputField.text as! NSString).doubleValue
        if(self.mode == .Length){
            if(self.fromInputFied.text != ""){
                  let convKey =  LengthConversionKey(toUnits: toLenUnit, fromUnits: fromLenUnit)
                  toDouble = fromDouble * lengthConversionTable[convKey]!;
                 self.toInputField.text = String(toDouble)
            }else if(self.toInputField.text != ""){
                let convKey =  LengthConversionKey(toUnits: fromLenUnit, fromUnits: toLenUnit)
               fromDouble = toDouble * lengthConversionTable[convKey]!;
                self.fromInputFied.text = String(fromDouble)
            }
        }else{
            if(self.fromInputFied.text != ""){
                let convKey =  VolumeConversionKey(toUnits: toVolUnit, fromUnits: fromVolUnit)
                 toDouble = fromDouble * volumeConversionTable[convKey]!;
                self.toInputField.text = String(toDouble)
            }else if(self.toInputField.text != ""){
                let convKey =  VolumeConversionKey(toUnits: fromVolUnit, fromUnits: toVolUnit)
                 fromDouble = toDouble * volumeConversionTable[convKey]!;
                self.fromInputFied.text = String(fromDouble)
            }
            }

        }
    
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit) {
        
    }
    
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit) {
        
    }
    
    
    @IBAction func modeButton(_ sender: UIButton) {
        if mode == CalculatorMode.Length {
            mode = CalculatorMode.Volume
            fromLabel.text = fromVolUnit.rawValue
            toLabel.text = toVolUnit.rawValue
        }
        else if mode == CalculatorMode.Volume {
            mode = CalculatorMode.Length
            fromLabel.text = fromLenUnit.rawValue
            toLabel.text = toLenUnit.rawValue
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setting"{
        
        if var target = segue.destination.children[0] as? SettingsViewController{
            target.delegate = self
            target.mode = self.mode
            target.fromLenUnit = self.fromLenUnit
            target.toLenUnit = self.toLenUnit
            target.fromVolUnit = self.fromVolUnit
            target.toVolUnit = self.toVolUnit
        }
    }
    }

    
    }




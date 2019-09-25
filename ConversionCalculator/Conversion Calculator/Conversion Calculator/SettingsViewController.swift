//
//  ViewSelectorViewController.swift
//  Conversion Calculator
//
//  Created by Xcode User on 9/23/19.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
protocol SettingsViewControllerDelegate {
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit)
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
}

class SettingsViewController: UIViewController {

    var pickerData:[String] = [String]()
    var selection:String = "Steak"
    var mode : CalculatorMode?
    var delegate: SettingsViewControllerDelegate?
    @IBOutlet weak var fromUnitButton: UIButton!
    @IBOutlet weak var toUnitButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    var fromLenUnit: LengthUnit?
    var toLenUnit: LengthUnit?
    var fromVolUnit: VolumeUnit?
    var toVolUnit: VolumeUnit?
    
    @IBAction func saveButton(_ sender:UIBarButtonItem){
        
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(mode == .Length){
        self.pickerData = ["Meters", "Yards", "Miles"]
        }
        else{
            self.pickerData = ["Liters", "Gallons", "Quarts"]
        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.pickerData[row]
    }
}

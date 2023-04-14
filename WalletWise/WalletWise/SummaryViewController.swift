//
//  SummaryViewController.swift
//  WalletWise
//
//  Created by Daize Njounkeng on 4/14/23.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var downButton: UIButton!
    
    //Creating summary view list
    var frequencyList = ["Daily", "Monthly", "Yearly"]
    override func viewDidLoad() {
        super.viewDidLoad()
        textBox.text = "Select Frequency"
        textBox.alpha = 0.5
        self.dropDown.delegate = self
        self.dropDown.dataSource = self
        self.textBox.delegate = self
        downButton.setImage(UIImage(systemName: "arrowtriangle.down.square.fill"), for: .normal)
    }
    @IBAction func buttonClicked(_ sender: Any) {
        self.dropDown.isHidden = false
    }
    
}
extension SummaryViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return frequencyList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        self.view.endEditing(true)
        return frequencyList[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.textBox.text = self.frequencyList[row]
        textBox.alpha = 1
        self.dropDown.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField == self.textBox {
            textField.endEditing(true)
        }
    }
}

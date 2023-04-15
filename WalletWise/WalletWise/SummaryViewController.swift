//
//  SummaryViewController.swift
//  WalletWise
//
//  Created by Daize Njounkeng on 4/14/23.
//

import UIKit
import Charts

class SummaryViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var downButton: UIButton!

    //Creating summary view list
    var frequencyList = ["Daily", "Monthly", "Yearly"]
    //Create pie chart
    var pieChart = PieChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.rgb(red: 46, green: 49, blue: 72)
        self.view.backgroundColor = UIColor.white
        downButton.tintColor = UIColor.rgb(red: 239, green: 186, blue: 125)
        textBox.text = "Select Frequency"
        textBox.alpha = 0.5
        self.dropDown.delegate = self
        self.dropDown.dataSource = self
        self.textBox.delegate = self
        textBox.rightView = downButton
        textBox.rightViewMode = .always
        downButton.setImage(UIImage(systemName: "arrowtriangle.down.square.fill"), for: .normal)
        pieChart.delegate = self
        
        // Add first squares with more details
        let squareColors = [UIColor.red, UIColor.blue]
        var squareViews = [UIView]()
        for i in 0..<2 {
            let squareView = UIView()
            squareView.backgroundColor = squareColors[i]
            squareView.layer.cornerRadius = 10
            squareView.layer.masksToBounds = true
            view.addSubview(squareView)
            squareViews.append(squareView)

            squareView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                squareView.widthAnchor.constraint(equalToConstant: 160),
                squareView.heightAnchor.constraint(equalToConstant: 150),
                squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (CGFloat(i) * 190) - 100),
                squareView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
            ])
        }
        
        let labelTexts = ["Square 1", "Square 2"]
        var labels = [UILabel]()
        
        for i in 0..<2 {
            let label = UILabel()
            label.text = labelTexts[i]
            label.font = UIFont.systemFont(ofSize: 20)
            label.textAlignment = .center
            view.addSubview(label)
            labels.append(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 110),
                label.heightAnchor.constraint(equalToConstant: 150),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (CGFloat(i) * 190) - 100),
                label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
            ])
        }
        for i in 0..<2 {
            squareViews[i].addSubview(labels[i])
            labels[i].center = squareViews[i].center
        }
        for i in 0..<2{
            view.addSubview(squareViews[i])
        }
        
        
        
        //Secon set of squares
        
        
        
        let squareColors2 = [UIColor.systemTeal, UIColor.orange]
        var squareViews2 = [UIView]()
        
        for i in 0..<2 {
            let squareView2 = UIView()
            squareView2.backgroundColor = squareColors2[i]
            squareView2.layer.cornerRadius = 10
            squareView2.layer.masksToBounds = true
            view.addSubview(squareView2)
            squareViews.append(squareView2)

            squareView2.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                squareView2.widthAnchor.constraint(equalToConstant: 160),
                squareView2.heightAnchor.constraint(equalToConstant: 150),
                squareView2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (CGFloat(i) * 190) - 100),
                squareView2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            ])
        }
        
        let labelTexts2 = ["Square 3", "Square 4"]
        var labels2 = [UILabel]()
        
        for i in 0..<2 {
            let label = UILabel()
            label.text = labelTexts[i]
            label.font = UIFont.systemFont(ofSize: 20)
            label.textAlignment = .center
            view.addSubview(label)
            labels.append(label)

            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 110),
                label.heightAnchor.constraint(equalToConstant: 150),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (CGFloat(i) * 190) - 100),
                label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            ])
        }
        
        for i in 0..<2 {
            squareViews[i].addSubview(labels[i])
            labels[i].center = squareViews[i].center
        }
        
        for i in 0..<2{
            view.addSubview(squareViews[i])
        }
        
        
        
    }
    @IBAction func buttonClicked(_ sender: Any) {
        self.dropDown.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        pieChart.frame = CGRect(x:100, y:100, width: self.view.frame.size.width/1.5, height: self.view.frame.size.width/1.5)
//        pieChart.center = view.center
        
        let chartWidth = self.view.frame.size.width / 1.5
        let chartHeight = chartWidth
        let chartX = (self.view.frame.size.width - chartWidth) / 2
        let chartY: CGFloat = 220

        pieChart.frame = CGRect(x: chartX, y: chartY, width: chartWidth, height: chartHeight)
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        //Eventually will get this data from database
        for x in 0..<4{
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        let set = PieChartDataSet(entries:entries)
        set.colors = ChartColorTemplates.material()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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

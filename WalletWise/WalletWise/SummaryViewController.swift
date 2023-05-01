//
//  SummaryViewController.swift
//  WalletWise
//
//  Created by Daize Njounkeng on 4/14/23.
//

import UIKit
import Charts

class SummaryViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var downButton: UIButton!

    //Creating summary view list
    var frequencyList = ["Daily", "Monthly", "Yearly"]
    //Create pie chart
    var pieDataEntry1 = PieChartDataEntry(value:0)
    var pieDataEntry2 = PieChartDataEntry(value:0)
    var pieDataEntry3 = PieChartDataEntry(value:0)
    var pieDataEntry4 = PieChartDataEntry(value:0)
    var entries = [PieChartDataEntry]()
    var green = UIColor.rgb(red: 150, green: 226, blue: 196)
    var pink = UIColor.rgb(red: 248, green: 126, blue: 135)
    let cart = "🛒"
    let money = "🤑"
    let store = "🏪"
    let time = "⏱️"
    let book = "📚"
    let money2 = "💵"
    let gasStation = "⛽️"
    let restaurant = "🥡"
    let food = "🍜"

    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.rgb(red: 27, green: 29, blue: 47)
        downButton.tintColor = UIColor.rgb(red: 239, green: 186, blue: 125)
        textBox.text = "Select Frequency"
        self.dropDown.delegate = self
        self.dropDown.dataSource = self
        self.textBox.delegate = self
        textBox.rightView = downButton
        textBox.rightViewMode = .always
        downButton.setImage(UIImage(systemName: "arrowtriangle.down.square.fill"), for: .normal)
        pieChart.chartDescription.text = ""
        pieDataEntry1.value = 5.0
        pieDataEntry2.value = 10.0
        pieDataEntry3.value = 50.0
        pieDataEntry4.value = 30.0
        pieDataEntry1.label = "Groceries"
        pieDataEntry2.label = "Books"
        pieDataEntry3.label = "Gas"
        pieDataEntry4.label = "Food"
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        let currencyString = formatter.string(from: NSNumber(value: pieDataEntry2.value))
        entries = [pieDataEntry1, pieDataEntry2,pieDataEntry3, pieDataEntry4]
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
        updateChartData(dataSet: dataSet)
        
        
        // Add first squares with more details
        let squareColors = [green, pink]
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
        var square1text = "\(cart) \(pieDataEntry1.label!)\n\n\(money) \("$")\(pieDataEntry1.value)\n\n\(store) \("Walmart")\n\n\(time)\("Time"): 10am"
        var square2text = "\(book) \(pieDataEntry1.label!)\n\n\(money2)\("$")\(pieDataEntry1.value)\n\n\(store)\("B&N")\n\n\(time)\("Time"): 3pm"
        let labelTexts = [square1text, square2text ]
        var labels = [UILabel]()
        
        for i in 0..<2 {
            let label = UILabel()
            label.numberOfLines = 7
            label.text = labelTexts[i]
            label.font = UIFont.systemFont(ofSize: 13)
            label.textAlignment = .left
            view.addSubview(label)
            labels.append(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 110),
                label.heightAnchor.constraint(equalToConstant: 170),
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
        
        
        
        //Second set of squares
        
        let squareColors2 = [UIColor.systemTeal, UIColor.systemMint]
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
        
        var square3text = "\(cart) \(pieDataEntry3.label!)\n\n\(money) \("$")\(pieDataEntry3.value)\n\n\(gasStation) \("Exon")\n\n\(time)\("Time"): 10pm"
        var square4text = "\(food) \(pieDataEntry1.label!)\n\n\(money)\("$")\(pieDataEntry4.value)\n\n\(restaurant)\("B&N")\n\n\(time)\("Time"): 2pm"
        let labelTexts2 = [square3text,  square4text]
        var labels2 = [UILabel]()
        
        for i in 0..<2 {
            let label = UILabel()
            label.numberOfLines = 7
            label.text = labelTexts2[i]
            label.font = UIFont.systemFont(ofSize: 13)
            label.textAlignment = .left
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
    
    func updateChartData(dataSet: PieChartDataSet){
        pieChart.data = PieChartData(dataSet: dataSet)
        
        // Format the chart values as currency
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        pieChart.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        pieChart.legend.enabled = false
        pieChart.holeRadiusPercent = 0.5
        pieChart.transparentCircleColor = UIColor.clear
        pieChart.holeColor = UIColor.white
        pieChart.centerText = "Spending"
        pieChart.drawEntryLabelsEnabled = false
        pieChart.notifyDataSetChanged()
        let colors = [green, pink, UIColor.systemTeal, UIColor.systemMint]
        dataSet.colors = colors
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = frequencyList[row]
        let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return attributedString
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

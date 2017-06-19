//
//  SecondViewController.swift
//  PieChartWithPercentageAndTitle
//
//  Created by apple on 19/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Charts

class SecondViewController: UIViewController, ChartViewDelegate {
    
    
    //Here I add the Pie Chart Programatically to view
    
    var samplePieChart:PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizePieChart()
        addDatasetToPieChart()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        customizePieChart()
        addDatasetToPieChart()
    }
    func addDatasetToPieChart()
    {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        setChart(dataPoints: months, values: unitsSold)
        
    }
    func customizePieChart()
    {
        samplePieChart =  PieChartView()
        samplePieChart.frame = CGRect(x: 0, y: self.view.frame.size.height/3, width: self.view.frame.size.width, height: self.view.frame.size.height/1.8)
        samplePieChart.transparentCircleColor =  UIColor.clear
        samplePieChart.holeRadiusPercent =  0
        samplePieChart.transparentCircleRadiusPercent = 0
        // samplePieChart.centerCircleBox =  CG
        //samplePieChart.centerText = "CENTER"
        
        
        // samplePieChart.diameter = self.view.frame.size.width/2
        
        samplePieChart.delegate =  self
        samplePieChart.backgroundColor =  UIColor.lightGray
        
        self.view.addSubview(samplePieChart)
        
            
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        // let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        
        //Data Set Path Setting
        pieChartDataSet.yValuePosition = .outsideSlice
        pieChartDataSet.xValuePosition = .insideSlice
        pieChartDataSet.valueLineColor =  UIColor.lightGray
        pieChartDataSet.valueLineWidth = 1.0
        pieChartDataSet.valueLinePart1Length =  1.2
        pieChartDataSet.valueLinePart2Length =  0.4
        //pieChartDataSet.sliceSpace =  10.0
        //pieChartDataSet.valueTextColor =  UIColor.lightGray
        pieChartDataSet.valueFont =  UIFont(name: "Arial", size: 16.0)!
        pieChartDataSet.valueLinePart1OffsetPercentage = 0.6
        
        
        let pieChartData =  PieChartData(dataSet: pieChartDataSet)
        samplePieChart.data = pieChartData
        
        //Customize Value Colors
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        pieChartDataSet.valueColors =  colors
        
    }
    //ChartViewDelegate Methods
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight)
    {
        
        
        
    }
    
    // Called when nothing has been selected or an "un-select" has been made.
    func chartValueNothingSelected(_ chartView: ChartViewBase)
    {
        
    }
    
    // Callbacks when the chart is scaled / zoomed via pinch zoom gesture.
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat)
    {
        
    }
    
    // Callbacks when the chart is moved / translated via drag gesture.
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

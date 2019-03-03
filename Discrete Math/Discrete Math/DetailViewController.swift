//
//  DetailViewController.swift
//  Discrete Math
//
//  Created by Jody Kocis on 3/2/19.
//  Copyright © 2019 Joseph Kocis. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var isEquation = false;
    var equations: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        equationLabel.text = equations.first != nil ? equations.first : "No Equations"
        
        if (equationLabel.text == "No Equations") {
            textView.text = ""
            return
        }
        
        var equation = equationLabel.text != nil ? equationLabel.text! : ""
        equation = formatEquation(equation: equation)
        
        let truthTable = getTruthTable(equation: equation)
        showTruthTable(columns: truthTable.0, values: truthTable.1)
    }
    
    // MARK: - Equations
    
    func inputData(isEquation: Bool, equations: [String]) {
        self.isEquation = isEquation
        self.equations = equations
    }
    
    func formatEquation(equation: String) -> String {
        var formattedEquation = equation
        formattedEquation = formattedEquation.replacingOccurrences(of: "∧", with: "^")
        formattedEquation = formattedEquation.replacingOccurrences(of: "∨", with: "%")
        formattedEquation = formattedEquation.replacingOccurrences(of: "⟹", with: ">")
        formattedEquation = formattedEquation.replacingOccurrences(of: "⇔", with: "<")
        formattedEquation = formattedEquation.replacingOccurrences(of: "¬", with: "~")
        
        return formattedEquation
    }
    
    func getTruthTable(equation: String) -> ([String],[[Int]]) {
        
        let str = UnsafeMutablePointer(mutating: (equation as NSString).utf8String)
        guard let result = getResult(str)?.pointee else {
            return ([], [])
        }
        
        
        var headers: [String] = []
        var values: [[Int]] = []
        
        for i in 0..<Int(result.row_size) {
            var currentString = ""
            
            var j = 0
            while true {
                if (Character(UnicodeScalar(Int(result.header[i]![j]))!) != "\0") {
                    currentString.append(Character(UnicodeScalar(Int(result.header[i]![j]))!))
                    break
                }
                j += 1
            }
            headers.append(currentString)
        }
        
        
        for i in 0..<Int(result.row_size) {
            var array: [Int] = []
            for j in 0..<Int(result.col_size) {
                array.append(Int(result.grid[i]![j]))
            }
            values.append(array)
        }
        
        print(headers)
        print(values)
        
        return (headers,values)
    }
    
    func showTruthTable(columns: [String], values: [[Int]]) {
        
        var truthTable = ""
        var spaceFrequencyArray: [Int] = []
        
        for column in columns {
            truthTable.append("\(column) ")
            spaceFrequencyArray.append(column.count)
        }
        
        // Remove 1 from first index
        if spaceFrequencyArray.startIndex != spaceFrequencyArray.endIndex {
            spaceFrequencyArray[spaceFrequencyArray.startIndex] -= 1
        }
        
        
        
        // Remove final space
        if let index = truthTable.lastIndex(of: " ") {
            truthTable.remove(at: index)
        }
        truthTable.append("\n")
        
        for array in values {
            for i in 0..<array.count {
                for _ in 0..<spaceFrequencyArray[i] {
                    truthTable.append(" ")
                }
                truthTable.append("\(array[i])")
            }
            truthTable.append("\n")
        }
        
        textView.text = truthTable
    }
    
    
}

//
//  CalculatorFile.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/31/21.
//

import Foundation


//MARK: get the maximum Value
func getMaxVal(_ array: [[Int]]) -> Int {
    
    //MARK: Variables
    var tuple = [(Double, Int)]()
    var i = 0
    var j = 1
    repeat {
        let averageValue = getAverageValue(array: array[i])
        let highestValue = getHighestValue(array: array[j])
        tuple.append((averageValue, highestValue))
        if j == array.count - 1 {
            break
        }
        i += 1
        j += 1
    } while i < array.count
    
    var k = 0
    var percentOfArray : [Int] = []
    repeat {
        let percentagePerAverage = getPercentage(highest: tuple[k].1, average: tuple[k].0)
        percentOfArray.append(percentagePerAverage)
        k += 1
    } while k < tuple.count
    guard let highestPercentageValue = percentOfArray.max() else { return 0 }
    
    return highestPercentageValue
}

//MARK: get the percentage
func getPercentage(highest: Int, average: Double) -> Int {
    let percent = highest * 100
    let finalValue = Double(percent) / average
    let intValue = Int(finalValue)
    return intValue
}

//MARK: Get highest val of each Array
func getHighestValue(array: [Int]) -> Int {
    guard let highestValue = array.max() else { return 0 }
    return highestValue
}

//MARK: Get the average val of each array
func getAverageValue( array : [Int]) -> Double {
    let sumTotal = array.reduce(0, +)
    let count = array.count
    let averageValue = Double(sumTotal) / Double(count)
    return averageValue
}

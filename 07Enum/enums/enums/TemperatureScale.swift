//
//  TemperatureScale.swift
//  enums
//
//  Created by Luat on 8/10/21.
//

import Foundation

/**
 1) Have Temperature Enum Adopt the TempConvertable protocol
 2) Implement getTempInFarnheit func
 3) Implement tempInFahren property
 */

enum TemperatureScale: TempConvertable {
    func getTempInFahrenheit() -> Int {
        switch self {
            case .celcius(let num):
                return num * 9/5 + 32
            case .kelvin(let num):
                return (num - Int(273.15)) * 9/5 + 32
            case .fahrenheit(let num):
                return num
        }
    }
    
    var tempInFahren: Int {
        getTempInFahrenheit()
    }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}

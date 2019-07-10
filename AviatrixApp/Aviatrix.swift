//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    var author = ""
    let data = AviatrixData()
    var currentLocation = "St. Louis"
    var distanceTraveled = 0 //miles
    var maxFuel = 5000 //gallons
    var fuelLevel = 5000.0 //gallons
    var milesPerGallon = 0.4 //mpg
    var fuelCost = 0.0 //$
    
    init(userName : String) {
        author = userName
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        let data = AviatrixData()
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        fuelLevel = 5000.0
        return gallonsNeeded
    }
    
    func flyTo(destination : String) {
        
        distanceTraveled += distanceTo(target: destination, currentLocation: currentLocation)
        
        let fuelSpent = Double(distanceTraveled) / milesPerGallon
        
        fuelLevel -= fuelSpent
        
        currentLocation = destination
    }
    
    func distanceTo(target : String, currentLocation: String) -> Int {
       return data.knownDistances["St. Louis"]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
      
    }
}

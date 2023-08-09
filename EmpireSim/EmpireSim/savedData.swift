//
//  savedData.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 4/30/23.
//

import Foundation

struct savedData: Codable{
    
    
        
    static func saveResources(n: [Double]) {
        if let data = try? JSONEncoder().encode(n) {
            UserDefaults.standard.set(data, forKey: "savedResources")
        }
    }
        
    static func loadResources() -> [Double] {
        if let data = UserDefaults.standard.data(forKey: "savedResources"),
            let savedNames = try? JSONDecoder().decode([Double].self, from: data) {
            return savedNames
        }
        return []
    }
    
    static func savePopulation(n: [Int]) {
        if let data = try? JSONEncoder().encode(n) {
            UserDefaults.standard.set(data, forKey: "savedPopulation")
        }
    }
        
    static func loadPopulation() -> [Int] {
        if let data = UserDefaults.standard.data(forKey: "savedPopulation"),
            let savedNames = try? JSONDecoder().decode([Int].self, from: data) {
            return savedNames
        }
        return []
    }
    
    static func saveBuildings(n: [Int]) {
        if let data = try? JSONEncoder().encode(n) {
            UserDefaults.standard.set(data, forKey: "savedBuildings")
        }
    }
        
    static func loadBuildings() -> [Int] {
        if let data = UserDefaults.standard.data(forKey: "savedBuildings"),
            let savedNames = try? JSONDecoder().decode([Int].self, from: data) {
            return savedNames
        }
        return []
    }
    
}

class userInfo{
    var username: String
    var password: String
    var score: Int
    
    init(u: String, p: String, sc: Int) {
        self.username = u
        self.password = p
        self.score = sc
    }
}

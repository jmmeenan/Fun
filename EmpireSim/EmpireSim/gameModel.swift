//
//  gameModel.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 4/30/23.
//

import Foundation

class gameModel{
    
    var resources: [String: Int] = [:]
    
    //resources should look something like this
    //[food, wood, stone, skins, herbs, metal, leather, iron, piety]
    //other resources can be added later but order is important
    
    //resources
    var food = 0.0
    var stone = 0.0
    var wood = 0.0
    var skins = 0.0
    var herbs = 0.0
    var ore = 0.0
    var leather = 0.0
    var metal = 0.0
    var piety = 0.0
    var popCost = 20.0
    var land = 1000
    
    var increase = 1
    
    //workers
    var maxPop = 20
    var populationTotal = 0
    var populationAvailable = 0
    var foodWorker = 0
    var woodWorker = 0
    var stoneWorker = 0
    var tannerWorkers = 0
    var blackSmithWorkers = 0
    var soldiers = 0
    var archers = 0
    var eSoldiers = 0
    var eArchers = 0
    var atWar = 0
    var warDif = 0
    
    var curBuilding = ""
    
    //population needs to look like this
    //[populationTotal, populationAvailable, foodWorker, woodWorker, stoneWorker]
    
    //Buildings
    
    var barns = 1
    var woodSorage = 1
    var quarry = 1
    var huts = 10
    var cabins = 0
    var houses = 0
    var mansions = 0
    var tanners = 0
    var blacksmiths = 0
    var barracks = 0
    var archerBarracks = 0
    
    func getAtWar() -> Int{
        return atWar
    }
    
    func getIncrease()-> Int{
        return increase
    }
    
    func setIncrease(){
        if increase < 1000000{
            increase *= 10
        }else{
            increase = 1
        }
    }
    
    func getLand()->Int{
        return land
    }
    
    func getMaxPop() -> Int{
        return maxPop
    }
    
    func addBarracks(i:Int){
        if (stone >= Double(100*i)) && (metal >= Double(i*100)) && (land-i >= 0){
            stone -= Double(100*i)
            metal -= Double(100*i)
            barracks += i
            land -= i
        }
    }
    func getBarracks()->Int{
        return barracks
    }
    
    func addArcherBarraks(i:Int){
        if (wood >= Double(100*i)) && (herbs >= Double(i*100)) && (land-i >= 0){
            wood -= Double(100*i)
            herbs -= Double(100*i)
            archerBarracks += i
            land -= i
        }
    }
    func getArcherBarracks()->Int{
        return archerBarracks
    }
    
    func addTanners(i:Int){
        if (wood >= Double(100*i)) && (skins >= Double(i*10)) && (land-i >= 0){
            wood -= Double(100*i)
            skins -= Double(10*i)
            tanners += i
            land -= i
        }
    }
    func getTanners()->Int{
        return tanners
    }
    
    func addBlackSmiths(i:Int){
        if (stone >= Double(100*i)) && (ore >= Double(i*10)) && (land-i >= 0){
            stone -= Double(100*i)
            ore -= Double(10*i)
            blacksmiths += i
            land -= i
        }
    }
    func getBlackSmiths()->Int{
        return blacksmiths
    }
    
    
    
    func addBarn(i: Int){
        if wood >= Double(100*i) && (land-i >= 0){
            wood -= Double(100*i)
            barns += i
            land -= i
        }
    }
    func getBarns() -> Int{
        return barns
    }
    
    func addWoodSorage(i: Int){
        if wood >= Double(100*i) && (land-i >= 0){
            wood -= Double(100*i)
            woodSorage += i
            land -= i
        }
    }
    func getWoodSorage() -> Int{
        return woodSorage
    }
    
    func addQuarry(i: Int){
        if wood >= Double(100*i) && (land-i >= 0){
            wood -= Double(100*i)
            quarry += i
            land -= i
        }
    }
    func getQuarries() -> Int{
        return quarry
    }
    
    func loadFromData(){
        let hold = savedData.loadResources()
        if hold != []{
            food = hold[0]
            wood = hold[1]
            stone = hold[2]
            skins = hold[3]
            herbs = hold[4]
            ore = hold[5]
            leather = hold[6]
            metal = hold[7]
            piety = hold[8]
        }
        let hold2 = savedData.loadPopulation()
        if hold2 != []{
            populationTotal = hold2[0]
            populationAvailable = hold2[1]
            foodWorker = hold2[2]
            woodWorker = hold2[3]
            stoneWorker = hold2[4]
            tannerWorkers = hold2[5]
            blackSmithWorkers = hold2[6]
            soldiers = hold2[7]
            archers = hold2[8]
        }
        let hold3 = savedData.loadBuildings()
        if hold3 != []{
            barns = hold3[0]
            woodSorage = hold3[1]
            quarry = hold3[2]
            huts = hold3[3]
            cabins = hold3[4]
            houses = hold3[5]
            mansions = hold3[6]
            land = hold3[7]
            tanners = hold3[8]
            blacksmiths = hold3[9]
            barracks = hold3[10]
            archerBarracks = hold3[11]
        }
        maxPop = ((huts*2) + (cabins*5) + (houses*10) + (mansions*50))
    }
    
    func saveToData(){
        let hold = [food, wood, stone, skins, herbs, ore, leather, metal, piety]
        savedData.saveResources(n: hold)
        let hold2 = [populationTotal, populationAvailable, foodWorker, woodWorker, stoneWorker, tannerWorkers, blackSmithWorkers, soldiers, archers]
        savedData.savePopulation(n: hold2)
        let hold3 = [barns, woodSorage, quarry, huts, cabins, houses, mansions, land, tanners, blacksmiths, barracks, archerBarracks]
        savedData.saveBuildings(n: hold3)
    }
    
    func getHuts()->Int{
        return huts
        
    }
    func addHuts(i:Int){
        if (wood >= Double(i)*2) && (skins >= Double(i)*2) && (land-i >= 0){
            wood -= Double(i)*2
            skins -= Double(i)*2
            huts += i
            maxPop += (i*2)
            land -= i
        }
        
    }
    
    func getCabins()->Int{
        return cabins
        
    }
    func addCabins(i:Int){
        if (wood >= Double(i)*20) && (stone >= Double(i)*10) && (land-i >= 0){
            wood -= Double(i)*20
            stone -= Double(i)*10
            cabins += i
            maxPop += (i*5)
            land -= i
        }
    }
    
    func getHouses()->Int{
        return houses
        
    }
    func addHouses(i:Int){
        if (wood >= Double(i)*30) && (stone >= Double(i)*70) && (land-i >= 0){
            wood -= Double(i)*30
            stone -= Double(i)*70
            houses += i
            maxPop += (i*10)
            land -= i
        }
    }
    
    func getMansions()->Int{
        return mansions
        
    }
    func addMansions(i:Int){
        if (wood >= Double(i)*150) && (stone >= Double(i)*200) && (land-i >= 0){
            wood -= Double(i)*150
            stone -= Double(i)*200
            mansions += i
            maxPop += (i*50)
            land -= i
        }
    }
    
    func getFood()->Float{
        return Float(food)
    }
    func getWood()->Float{
        return Float(wood)
    }
    func getStone()->Float{
        return Float(stone)
    }
    
    func addSkins(i:Double){
        skins += i
    }
    func getSkins()->Double{
        return skins
    }
    
    func addHerbs(i:Double){
        herbs += i
    }
    func getHerbs()->Double{
        return herbs
    }
    
    func addOre(i:Double){
        ore += i
    }
    func getOre()->Double{
        return ore
    }
    
    func addLeather(i:Double){
        leather += i
    }
    func getLeather()->Double{
        return leather
    }
    
    func addMetal(i:Double){
        metal += i
    }
    func getMetal()->Double{
        return metal
    }
    
    func addPiety(i:Double){
        piety += i
    }
    func getPiety()->Double{
        return piety
    }
    
    
    func addFood(i:Float){
        if food + Double(i) <= Double(barns*200){
            food += Double(i)
        }
    }
    func addWood(i:Float){
        if wood + Double(i) <= Double(woodSorage*200){
            wood += Double(i)
        }
    }
    func addStone(i:Float){
        if stone + Double(i) <= Double(quarry*200){
            stone += Double(i)
        }
    }
    func addWorker(i: Int){
        if (food >= popCost*Double(i)) && ((maxPop-populationTotal) >= i){
            food -= popCost*Double(i)
            populationTotal += i
            populationAvailable += i
        }
    }
    func removeWorker(i: Int){
        populationTotal -= i
        populationAvailable -= i
    }
    func getAvailableWorkers()->Int{
        return populationAvailable
    }
    func getTotalPop()->Int{
        return populationTotal
    }
    func addFarmer(i: Int){
        if populationAvailable >= i{
            populationAvailable -= i
            foodWorker += i
        }else{
            foodWorker += populationAvailable
            populationAvailable = 0
        }
    }
    func removeFarmer(i: Int){
        if foodWorker >= i{
            populationAvailable += i
            foodWorker -= i
        }else{
            populationAvailable += foodWorker
            foodWorker = 0
        }
    }
    func getFarmers()->Int{
        return foodWorker
    }
    func addLumber(i: Int){
        if populationAvailable >= i{
            populationAvailable -= i
            woodWorker += i
        }else{
            woodWorker += populationAvailable
            populationAvailable = 0
        }
    }
    func removeLumber(i: Int){
        if woodWorker >= i{
            populationAvailable += i
            woodWorker -= i
        }else{
            populationAvailable += woodWorker
            woodWorker = 0
        }
        
    }
    func getLumbers()->Int{
        return woodWorker
    }
    func addMason(i: Int){
        if populationAvailable >= i{
            populationAvailable -= i
            stoneWorker += i
        }else{
            stoneWorker += populationAvailable
            populationAvailable = 0
        }
    }
    func removeMason(i: Int){
        if stoneWorker >= i{
            populationAvailable += i
            stoneWorker -= i
        }else{
            populationAvailable += stoneWorker
            stoneWorker = 0
        }
    }
    func getMasons()->Int{
        return stoneWorker
    }
    
    func removePop(i: Int){
        populationTotal -= i
        populationAvailable -= i
    }
    
    func getTannerWorkers() -> Int{
        return tannerWorkers
    }
    func addTannerWorkers(i: Int){
        if (populationAvailable >= i) && (skins >= Double(10*i)) && (i <= (tanners-tannerWorkers)){
            skins -= Double(10*i)
            populationAvailable -= i
            tannerWorkers += i
        }else{
            let hold = min(Int(skins/10), populationAvailable, (tanners-tannerWorkers))
            skins -= Double(10*hold)
            populationAvailable -= hold
            tannerWorkers += hold
            
        }
    }
    func removeTannerWorkers(i: Int){
        if tannerWorkers >= i{
            populationAvailable += i
            tannerWorkers -= i
        }else{
            populationAvailable += tannerWorkers
            tannerWorkers = 0
        }
        
    }
    
    func getBlackSmithWorkers() -> Int{
        return blackSmithWorkers
    }
    func addBlackSmithWorkers(i: Int){
        if (populationAvailable >= i) && (ore >= Double(10*i)) && (i <= (blacksmiths-blackSmithWorkers)){
            ore -= Double(10*i)
            populationAvailable -= i
            blackSmithWorkers += i
        }else{
            let hold = min(Int(ore/10), populationAvailable, (blacksmiths-blackSmithWorkers))
            ore -= Double(10*hold)
            populationAvailable -= hold
            blackSmithWorkers += hold
            
        }
    }
    func removeBlackSmithWorkers(i: Int){
        if blackSmithWorkers >= i{
            populationAvailable += i
            blackSmithWorkers -= i
        }else{
            populationAvailable += blackSmithWorkers
            blackSmithWorkers = 0
        }
        
    }
    
    func getSoldiers() -> Int{
        return soldiers
    }
    func addSoldiers(i: Int){
        if (populationAvailable >= i) && (leather >= Double(10*i)) && (metal >= Double(20*i)) && (soldiers + i <= barracks*10){
            leather -= Double(10*i)
            metal -= Double(20*i)
            populationAvailable -= i
            soldiers += i
        }else{
            let hold = min(Int(leather/10), Int(metal/20), populationAvailable, ((barracks*10)-soldiers))
            metal -= Double(20*hold)
            leather -= Double(10*hold)
            populationAvailable -= hold
            soldiers += hold
            
        }
    }
    func removeSoldiers(i: Int){
        if soldiers >= i{
            populationAvailable += i
            soldiers -= i
            leather += Double(10*i)
            metal += Double(20*i)
        }else{
            leather += Double(10*soldiers)
            metal += Double(20*soldiers)
            populationAvailable += soldiers
            soldiers = 0
        }
        
    }
    
    func getArchers() -> Int{
        return archers
    }
    func addArchers(i: Int){
        if (populationAvailable >= i) && (leather >= Double(20*i)) && (herbs >= Double(10*i)) && (archers + i <= archerBarracks*10){
            leather -= Double(20*i)
            herbs -= Double(10*i)
            populationAvailable -= i
            archers += i
        }else{
            let hold = min(Int(leather/20), Int(herbs/10), populationAvailable, ((archerBarracks*10)-archers))
            herbs -= Double(10*hold)
            leather -= Double(20*hold)
            populationAvailable -= hold
            archers += hold
            
        }
    }
    func removeArchers(i: Int){
        if archers >= i{
            populationAvailable += i
            archers -= i
            leather += Double(20*i)
            herbs += Double(10*i)
        }else{
            leather += Double(20*archers)
            herbs += Double(10*archers)
            populationAvailable += archers
            archers = 0
        }
        
    }
    
    
    func tic(){
        food += (Double(foodWorker)*1.48 - Double(populationTotal))
        if food >= Double(barns*200){
            food = Double(barns*200)
        }
        wood += Double(woodWorker)*0.48
        if wood >= Double(woodSorage*200){
            wood = Double(woodSorage*200)
        }
        stone += Double(stoneWorker)*0.19
        if stone >= Double(quarry*200){
            stone = Double(quarry*200)
        }
        skins += Double(foodWorker)*0.02
        herbs += Double(woodWorker)*0.015
        ore += Double(stoneWorker)*0.01
        if ore > 0.0{
            if ore < Double(blackSmithWorkers){
                metal += ore
                ore = 0.0
            }else{
                metal += Double(blackSmithWorkers)
            }
        }
        if skins > 0{
            if ore < Double(tannerWorkers){
                leather += skins
                skins = 0.0
            }else{
                leather += Double(tannerWorkers)
            }
        }
    }
    
    func war(size: Int){
        switch size{
        case 1:
            combat(armySize: 3)//10
            warDif = 1
            break
        case 2:
            combat(armySize: 5)//20
            warDif = 2
            break
        case 3:
            combat(armySize: 15)//40
            warDif = 3
            break
        case 4:
            combat(armySize: 100)//200
            warDif = 4
            break
        case 5:
            combat(armySize: 1000)//2000
            warDif = 5
            break
        case 6:
            combat(armySize: 10000)//20000
            warDif = 6
            break
        case 7:
            combat(armySize: 30000)
            warDif = 7
            break
        case 8:
            combat(armySize: 100000)
            warDif = 8
            break
        case 9:
            combat(armySize: 300000)
            warDif = 9
            break
        case 10:
            combat(armySize: 1000000)
            warDif = 10
            break
        case 11:
            combat(armySize: 10000000)
            warDif = 11
            break
        case 12:
            combat(armySize: 100000000)
            warDif = 12
            break
        default:
            break
        }
    }
    
    func combat(armySize: Int){
        let number = Int.random(in: armySize ..< armySize*2)
        eArchers = number/2
        eSoldiers = number/2
        atWar = 1
        
    }
    
    func combatTic(){
        var attackPower = Double(soldiers + archers) * 0.10
        if attackPower < 1{
            attackPower = 1
        }
        if attackPower >= Double(eSoldiers){
            attackPower -= Double(eSoldiers)
            eSoldiers = 0
            if attackPower >= Double(eArchers){
                eArchers = 0
            }else{
                eArchers -= Int(attackPower)
            }
        }else{
            eSoldiers -= Int(attackPower)
        }
        var enemyAttackPower = Double(eSoldiers + eArchers) * 0.10
        if enemyAttackPower >= Double(soldiers){
            enemyAttackPower -= Double(soldiers)
            soldiers = 0
            if enemyAttackPower >= Double(archers){
                archers = 0
            }else{
                removeArchers(i: Int(max(enemyAttackPower/2, 1)))
            }
        }else{
            removeSoldiers(i: Int(max(enemyAttackPower/2, 1)))
        }
        if eArchers <= 0 && eSoldiers <= 0{
            atWar = 0
            win()
        }else if archers <= 0 && soldiers <= 0{
            atWar = 0
            eSoldiers = 0
            eArchers = 0
            warDif = 0
        }else{
            atWar = 1
        }
    }
    
    func win(){
        let rValues = [0,100,1000, 3000, 8000, 15000, 30000, 60000, 120000, 240000, 480000, 1000000, 2000000, 4000000]
        let sValues = [0,20,50, 100, 200, 400, 800, 1000, 2000, 4000, 10000, 20000, 40000, 80000]
        if warDif == 0{
            return
        }
        addFood(i: Float(Int.random(in: 0 ..< rValues[warDif])))
        addStone(i: Float(Int.random(in: 0 ..< rValues[warDif])))
        addWood(i: Float(Int.random(in: 0 ..< rValues[warDif])))
        addLand(i: Int.random(in: 0 ..< rValues[warDif]))
        
        addSkins(i: Double(Int.random(in: 0 ..< sValues[warDif])))
        addOre(i: Double(Int.random(in: 0 ..< sValues[warDif])))
        addLeather(i: Double(Int.random(in: 0 ..< sValues[warDif])))
        addMetal(i: Double(Int.random(in: 0 ..< sValues[warDif])))
        addHerbs(i: Double(Int.random(in: 0 ..< sValues[warDif])))
        
        
        
        
        warDif = 0
    }
    
    func addLand(i: Int){
        land += i
    }
    
    func getESoldiers()->Int{
        return eSoldiers
    }
    
    func getEArchers() -> Int{
        return eArchers
    }
    
    
    
    
    
    
    
}

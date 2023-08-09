//
//  BuildingViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 5/9/23.
//

import UIKit

class BuildingViewController: UIViewController {
    var timer = Timer()
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?
    var increase = 1
    @IBOutlet weak var buildingTitle1: UILabel!
    @IBOutlet weak var buildingAmount1: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    

    override func viewDidLoad() {
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
            })
        super.viewDidLoad()
        let hold = myModel?.curBuilding
        if hold == "Barn"{
            loadBarn()
        }else if hold == "Cabin"{
            loadWoodStorage()
        }else if hold == "Quarry"{
            loadQuarry()
        }else if hold == "Tanner"{
            loadTanners()
        }else if hold == "BlackSmith"{
            loadBlackSmiths()
        }else if hold == "Soldier"{
            loadSoldiers()
        }else if hold == "Archer"{
            loadArchers()
        }
        if let hold = myModel?.getIncrease(){
            increaseButton.setTitle(String(hold), for: .normal)
            increase = hold
        }

        // Do any additional setup after loading the view.
    }
    
    func loadBarn(){
        buildingTitle1.text = "Add Barns: "
        if let hold = myModel?.getBarns(){
            buildingAmount1.text = String(hold)
        }
    }
    
    func loadWoodStorage(){
        buildingTitle1.text = "Add Cabins: "
        if let hold = myModel?.getWoodSorage(){
            buildingAmount1.text = String(hold)
        }
        
    }
    
    func loadQuarry(){
        buildingTitle1.text = "Add Quarries: "
        if let hold = myModel?.getQuarries(){
            buildingAmount1.text = String(hold)
        }
        
    }
    func loadTanners(){
        buildingTitle1.text = "Add Tanner Shops: "
        if let hold = myModel?.getTanners(){
            buildingAmount1.text = String(hold)
        }
        
    }
    
    func loadBlackSmiths(){
        buildingTitle1.text = "Add BlackSmith Shops: "
        if let hold = myModel?.getBlackSmiths(){
            buildingAmount1.text = String(hold)
        }
        
    }
    
    func loadSoldiers(){
        buildingTitle1.text = "Add Solder Barracks: "
        if let hold = myModel?.getBarracks(){
            buildingAmount1.text = String(hold)
        }
        
    }
    
    func loadArchers(){
        buildingTitle1.text = "Add Archers Barracks: "
        if let hold = myModel?.getArcherBarracks(){
            buildingAmount1.text = String(hold)
        }
        
    }
    
    func updateCounting(){
        myModel?.tic()
    }
    @IBAction func addBuilding(_ sender: Any) {
        let hold = myModel?.curBuilding
        if hold == "Barn"{
            myModel?.addBarn(i: increase)
        }else if hold == "Cabin"{
            myModel?.addWoodSorage(i: increase)
        }else if hold == "Quarry"{
            myModel?.addQuarry(i: increase)
        }else if hold == "Tanner"{
            myModel?.addTanners(i: increase)
        }else if hold == "BlackSmith"{
            myModel?.addBlackSmiths(i: increase)
        }else if hold == "Soldier"{
            myModel?.addBarracks(i: increase)
        }else if hold == "Archer"{
            myModel?.addArcherBarraks(i: increase)
        }
        update()
    }
    
    @IBAction func pressIncrease(_ sender: Any) {
        myModel?.setIncrease()
        if let hold = myModel?.getIncrease(){
            increaseButton.setTitle(String(hold), for: .normal)
            increase = hold
        }
    }
    @IBAction func back(_ sender: Any) {
        timer.invalidate()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func update(){
        let hold = myModel?.curBuilding
        if hold == "Barn"{
            loadBarn()
        }else if hold == "Cabin"{
            loadWoodStorage()
        }else if hold == "Quarry"{
            loadQuarry()
        }else if hold == "Tanner"{
            loadTanners()
        }else if hold == "BlackSmith"{
            loadBlackSmiths()
        }else if hold == "Soldier"{
            loadSoldiers()
        }else if hold == "Archer"{
            loadArchers()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

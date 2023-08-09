//
//  CombatViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 5/11/23.
//

import UIKit

class CombatViewController: UIViewController {
    var timer = Timer()
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?
    
    @IBOutlet weak var eSoldierLabel: UILabel!
    @IBOutlet weak var eArcherLabel: UILabel!
    
    @IBOutlet weak var soldiersLabel: UILabel!
    @IBOutlet weak var archerLabel: UILabel!
    
    //buttons
    @IBOutlet weak var homesteadButton: UIButton!
    @IBOutlet weak var hamletButton: UIButton!
    @IBOutlet weak var villageButton: UIButton!
    @IBOutlet weak var suburbButton: UIButton!
    @IBOutlet weak var townshipButton: UIButton!
    @IBOutlet weak var townButton: UIButton!
    @IBOutlet weak var countyButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var metropolisButton: UIButton!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var empireButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
            })
        update()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        timer.invalidate()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func updateCounting(){
        myModel?.tic()
        update()
    }
    
    func update(){
        if let hold = myModel?.getSoldiers(){
            soldiersLabel.text = String(hold)
        }
        if let hold = myModel?.getArchers(){
            archerLabel.text = String(hold)
        }
        if let hold = myModel?.getESoldiers(){
            eSoldierLabel.text = String(hold)
        }
        if let hold = myModel?.getEArchers(){
            eArcherLabel.text = String(hold)
        }
        if let hold = myModel?.getAtWar(){
            if hold == 0{
                enableButtons()
            }
            if hold == 1{
                myModel?.combatTic()
                disableButtons()
            }
        }
        myModel?.saveToData()
    }
    
    func enableButtons(){
        backButton.isEnabled = true
        homesteadButton.isEnabled = true
        hamletButton.isEnabled = true
        villageButton.isEnabled = true
        suburbButton.isEnabled = true
        townshipButton.isEnabled = true
        townButton.isEnabled = true
        countyButton.isEnabled = true
        cityButton.isEnabled = true
        metropolisButton.isEnabled = true
        stateButton.isEnabled = true
        countryButton.isEnabled = true
        empireButton.isEnabled = true
    }
    
    func disableButtons(){
        backButton.isEnabled = false
        homesteadButton.isEnabled = false
        hamletButton.isEnabled = false
        villageButton.isEnabled = false
        suburbButton.isEnabled = false
        townshipButton.isEnabled = false
        townButton.isEnabled = false
        countyButton.isEnabled = false
        cityButton.isEnabled = false
        metropolisButton.isEnabled = false
        stateButton.isEnabled = false
        countryButton.isEnabled = false
        empireButton.isEnabled = false
    }
    
    
    
    @IBAction func homeSteadCombat(_ sender: Any) {
        myModel?.war(size: 1)
    }
    @IBAction func hamletCombat(_ sender: Any) {
        myModel?.war(size: 2)
    }
    @IBAction func villageCombat(_ sender: Any) {
        myModel?.war(size: 3)
    }
    @IBAction func suburbCombat(_ sender: Any) {
        myModel?.war(size: 4)
    }
    @IBAction func townshipCombat(_ sender: Any) {
        myModel?.war(size: 5)
    }
    @IBAction func townCombat(_ sender: Any) {
        myModel?.war(size: 6)
    }
    @IBAction func countyCombat(_ sender: Any) {
        myModel?.war(size: 7)
    }
    @IBAction func cityCombat(_ sender: Any) {
        myModel?.war(size: 8)
    }
    @IBAction func metropolisCombat(_ sender: Any) {
        myModel?.war(size: 9)
    }
    @IBAction func stateCombat(_ sender: Any) {
        myModel?.war(size: 10)
    }
    @IBAction func countryCombat(_ sender: Any) {
        myModel?.war(size: 11)
    }
    @IBAction func empireCombat(_ sender: Any) {
        myModel?.war(size: 12)
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

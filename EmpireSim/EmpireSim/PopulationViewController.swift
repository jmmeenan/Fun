//
//  PopulationViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 5/9/23.
//

import UIKit

class PopulationViewController: UIViewController {
    
    var timer = Timer()
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?
    var increase = 1
    
    
    @IBOutlet weak var availWorkersLabel: UILabel!
    @IBOutlet weak var farmerLabel: UILabel!
    @IBOutlet weak var lumberLabel: UILabel!
    @IBOutlet weak var masonLabel: UILabel!
    @IBOutlet weak var increaseBut: UIButton!
    @IBOutlet weak var maxPopLabel: UILabel!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var blackSmithsLabel: UILabel!
    @IBOutlet weak var tannersLabel: UILabel!
    @IBOutlet weak var monkLabel: UILabel!
    @IBOutlet weak var soldierLabel: UILabel!
    @IBOutlet weak var archerLabel: UILabel!
    
    override func viewDidLoad() {
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
            })
        upddate()
        if let hold = myModel?.getIncrease(){
            increaseBut.setTitle(String(hold), for: .normal)
            increase = hold
        }

        // Do any additional setup after loading the view.
    }
    
    func updateCounting(){
        myModel?.tic()
    }
    
    @IBAction func increaseButton(_ sender: Any) {
        myModel?.setIncrease()
        if let hold = myModel?.getIncrease(){
            increaseBut.setTitle(String(hold), for: .normal)
            increase = hold
        }
    }
    @IBAction func backButton(_ sender: Any) {
        timer.invalidate()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(loginVC, animated: true, completion: nil)
         
    }
    
    @IBAction func addWorker(_ sender: Any) {
        myModel?.addWorker(i: increase)
        upddate()
    }
    @IBAction func addFarmer(_ sender: Any) {
        myModel?.addFarmer(i: increase)
        upddate()
    }
    @IBAction func removeFarmer(_ sender: Any) {
        myModel?.removeFarmer(i: increase)
        upddate()
    }
    @IBAction func addLumber(_ sender: Any) {
        myModel?.addLumber(i: increase)
        upddate()
    }
    @IBAction func removeLumber(_ sender: Any) {
        myModel?.removeLumber(i: increase)
        upddate()
    }
    @IBAction func addMason(_ sender: Any) {
        myModel?.addMason(i: increase)
        upddate()
    }
    @IBAction func removeMason(_ sender: Any) {
        myModel?.removeMason(i: increase)
        upddate()
    }
    
    @IBAction func addTanner(_ sender: Any) {
        myModel?.addTannerWorkers(i: increase)
        upddate()
    }
    
    @IBAction func removeTanner(_ sender: Any) {
        myModel?.removeTannerWorkers(i: increase)
        upddate()
    }
    @IBAction func addBlackSmith(_ sender: Any) {
        myModel?.addBlackSmithWorkers(i: increase)
        upddate()
    }
    @IBAction func removeBlackSmith(_ sender: Any) {
        myModel?.removeBlackSmithWorkers(i: increase)
        upddate()
    }
    @IBAction func addSoldier(_ sender: Any) {
        myModel?.addSoldiers(i: increase)
        upddate()
    }
    @IBAction func removeSoldier(_ sender: Any) {
        myModel?.removeSoldiers(i: increase)
        upddate()
    }
    @IBAction func addArcher(_ sender: Any) {
        myModel?.addArchers(i: increase)
        upddate()
    }
    @IBAction func removeArcher(_ sender: Any) {
        myModel?.removeArchers(i: increase)
        upddate()
    }
    
    
    
    
    
    
    func upddate(){
        if let hold = myModel?.getAvailableWorkers(){
            availWorkersLabel.text = String(hold)
        }
        if let hold = myModel?.getFarmers(){
            farmerLabel.text = String(hold)
        }
        if let hold = myModel?.getLumbers(){
            lumberLabel.text = String(hold)
        }
        if let hold = myModel?.getMasons(){
            masonLabel.text = String(hold)
        }
        if let hold = myModel?.getTannerWorkers(){
            tannersLabel.text = String(hold)
        }
        if let hold = myModel?.getBlackSmithWorkers(){
            blackSmithsLabel.text = String(hold)
        }
        if let hold = myModel?.getSoldiers(){
            soldierLabel.text = String(hold)
        }
        if let hold = myModel?.getArchers(){
            archerLabel.text = String(hold)
        }
        if let hold = myModel?.getMaxPop(){
            if let hold2 = myModel?.getTotalPop(){
                maxPopLabel.text = String(hold)
                popLabel.text = String(hold2)
            }
        }
        myModel?.saveToData()
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

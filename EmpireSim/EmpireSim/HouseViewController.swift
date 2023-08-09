//
//  HouseViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 5/10/23.
//

import UIKit

class HouseViewController: UIViewController {
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?
    var timer = Timer()
    var increase = 1
    @IBOutlet weak var hutCountLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var cabinCountLabel: UILabel!
    @IBOutlet weak var houseCountLabel: UILabel!
    @IBOutlet weak var mansionCountLabel: UILabel!
    
    override func viewDidLoad() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
            })
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        super.viewDidLoad()
        update()
        if let hold = myModel?.getIncrease(){
            increaseButton.setTitle(String(hold), for: .normal)
            increase = hold
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func increaseAction(_ sender: Any) {
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
    
    func updateCounting(){
        myModel?.tic()
        update()
    }
    
    func update(){
        if let hold = myModel?.getHuts(){
            hutCountLabel.text = String(hold)
        }
        if let hold = myModel?.getCabins(){
            cabinCountLabel.text = String(hold)
        }
        if let hold = myModel?.getHouses(){
            houseCountLabel.text = String(hold)
        }
        if let hold = myModel?.getMansions(){
            mansionCountLabel.text = String(hold)
        }
    }
    
    @IBAction func addHut(_ sender: Any) {
        myModel?.addHuts(i: increase)
        update()
    }
    
    @IBAction func addCabin(_ sender: Any) {
        myModel?.addCabins(i: increase)
        update()
    }
    
    @IBAction func addHouse(_ sender: Any) {
        myModel?.addHouses(i: increase)
        update()
    }
    
    @IBAction func addMansion(_ sender: Any) {
        myModel?.addMansions(i: increase)
        update()
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

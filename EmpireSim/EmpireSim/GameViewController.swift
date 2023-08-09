//
//  GameViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 4/30/23.
//

import UIKit

class GameViewController: UIViewController {
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?
    var timer = Timer()

    @IBOutlet weak var foodIMG: UIImageView!
    @IBOutlet weak var stoneIMG: UIImageView!
    @IBOutlet weak var woodIMG: UIImageView!
    @IBOutlet weak var houseIMG: UIImageView!
    @IBOutlet weak var barnIMG: UIImageView!
    @IBOutlet weak var cabinIMG: UIImageView!
    @IBOutlet weak var quarryIMG: UIImageView!
    @IBOutlet weak var tanneryIMG: UIImageView!
    @IBOutlet weak var blackSmithIMG: UIImageView!
    @IBOutlet weak var soldierIMG: UIImageView!
    @IBOutlet weak var archerIMG: UIImageView!
    @IBOutlet weak var warIMG: UIImageView!
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var woodLabel: UILabel!
    @IBOutlet weak var stoneLabel: UILabel!
    @IBOutlet weak var skinsLabel: UILabel!
    @IBOutlet weak var herbsLabel: UILabel!
    @IBOutlet weak var oreLabel: UILabel!
    @IBOutlet weak var leatherLabel: UILabel!
    @IBOutlet weak var metalLabel: UILabel!
    @IBOutlet weak var pietyLabel: UILabel!
    @IBOutlet weak var landLabel: UILabel!
    @IBOutlet weak var foodRateLabel: UILabel!
    @IBOutlet weak var woodRateLabel: UILabel!
    @IBOutlet weak var stoneRateLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    
    @IBOutlet weak var cityIMG: UIImageView!
    
    override func viewDidLoad() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
            })
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        
        super.viewDidLoad()
        
        let foodGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let woodGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let stoneGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let townGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let houseGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let barnGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let cabinGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let quarryGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let tanneryGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let blackSmithGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let soldierGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let archerGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        let warGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        
        foodIMG.image = UIImage(named: "foodEdit.jpeg")
        foodIMG.addGestureRecognizer(foodGesture)
        foodIMG.isUserInteractionEnabled = true
        stoneIMG.image = UIImage(named: "stoneEdit.jpeg")
        stoneIMG.addGestureRecognizer(stoneGesture)
        stoneIMG.isUserInteractionEnabled = true
        woodIMG.image = UIImage(named: "woodEdit.jpeg")
        woodIMG.addGestureRecognizer(woodGesture)
        woodIMG.isUserInteractionEnabled = true
        cityIMG.image = UIImage(named: "townHall.jpg")
        cityIMG.addGestureRecognizer(townGesture)
        cityIMG.isUserInteractionEnabled = true
        houseIMG.image = UIImage(named: "house.jpg")
        houseIMG.addGestureRecognizer(houseGesture)
        houseIMG.isUserInteractionEnabled = true
        barnIMG.image = UIImage(named: "barn.jpeg")
        barnIMG.addGestureRecognizer(barnGesture)
        barnIMG.isUserInteractionEnabled = true
        cabinIMG.image = UIImage(named: "cabin.jpeg")
        cabinIMG.addGestureRecognizer(cabinGesture)
        cabinIMG.isUserInteractionEnabled = true
        quarryIMG.image = UIImage(named: "quarry.jpeg")
        quarryIMG.addGestureRecognizer(quarryGesture)
        quarryIMG.isUserInteractionEnabled = true
        tanneryIMG.image = UIImage(named: "tannery.jpg")
        tanneryIMG.addGestureRecognizer(tanneryGesture)
        tanneryIMG.isUserInteractionEnabled = true
        blackSmithIMG.image = UIImage(named: "blacksmith2.jpg")
        blackSmithIMG.addGestureRecognizer(blackSmithGesture)
        blackSmithIMG.isUserInteractionEnabled = true
        soldierIMG.image = UIImage(named: "tent.png")
        soldierIMG.addGestureRecognizer(soldierGesture)
        soldierIMG.isUserInteractionEnabled = true
        archerIMG.image = UIImage(named: "archer.jpg")
        archerIMG.addGestureRecognizer(archerGesture)
        archerIMG.isUserInteractionEnabled = true
        warIMG.image = UIImage(named: "war.jpg")
        warIMG.addGestureRecognizer(warGesture)
        warIMG.isUserInteractionEnabled = true
        
        update()

        // Do any additional setup after loading the view.
    }
    
    func updateCounting(){
        myModel?.tic()
        update()
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
            // if the tapped view is a UIImageView then set it to imageview
        if(gesture.view == foodIMG){
            //print("FoodTapped")
            myModel?.addFood(i: 1)
            myModel?.addSkins(i: 0.25)
            update()
        }
        if(gesture.view == woodIMG){
            //print("WoodTapped")
            myModel?.addWood(i: 1)
            myModel?.addHerbs(i: 0.2)
            update()
        }
        if(gesture.view == stoneIMG){
            //print("StoneTapped")
            myModel?.addStone(i: 1)
            myModel?.addOre(i: 0.1)
            update()
        }
        if(gesture.view == cityIMG){
            timer.invalidate()
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopulationViewController") as! PopulationViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == barnIMG){
            timer.invalidate()
            myModel?.curBuilding = "Barn"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == cabinIMG){
            timer.invalidate()
            myModel?.curBuilding = "Cabin"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == quarryIMG){
            timer.invalidate()
            myModel?.curBuilding = "Quarry"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == tanneryIMG){
            timer.invalidate()
            myModel?.curBuilding = "Tanner"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == blackSmithIMG){
            timer.invalidate()
            myModel?.curBuilding = "BlackSmith"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == soldierIMG){
            timer.invalidate()
            myModel?.curBuilding = "Soldier"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == archerIMG){
            timer.invalidate()
            myModel?.curBuilding = "Archer"
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingViewController") as! BuildingViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == warIMG){
            timer.invalidate()
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CombatViewController") as! CombatViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        if(gesture.view == houseIMG){
            timer.invalidate()
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HouseViewController") as! HouseViewController
            self.present(loginVC, animated: true, completion: nil)
        }
        update()
            
    }
    
    func update(){
        if let hold = myModel?.getFood(){
            foodLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getWood(){
            woodLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getStone(){
            stoneLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getSkins(){
            skinsLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getHerbs(){
            herbsLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getOre(){
            oreLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getLeather(){
            leatherLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getMetal(){
            metalLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getPiety(){
            pietyLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getLand(){
            landLabel.text = String(Int(hold))
        }
        if let hold = myModel?.getTotalPop(){
            if let hold2 = myModel?.getFarmers(){
                foodRateLabel.text = String(Int((Double(hold2) * 1.48) - Double(hold)))
            }
            if let hold2 = myModel?.getLumbers(){
                woodRateLabel.text = String(Int((Double(hold2) * 0.48)))
            }
            if let hold2 = myModel?.getMasons(){
                stoneRateLabel.text = String(Int((Double(hold2) * 0.19)))
            }
        }
        if let hold = myModel?.getTotalPop(){
            if hold < 30{
                sizeLabel.text = "Homestead"
            }else if hold < 50{
                sizeLabel.text = "Hamlet"
            }else if hold < 150{
                sizeLabel.text = "Village"
            }else if hold < 1000{
                sizeLabel.text = "Suburb"
            }else if hold < 10000{
                sizeLabel.text = "Township"
            }else if hold < 100000{
                sizeLabel.text = "Town"
            }else if hold < 300000{
                sizeLabel.text = "County"
            }else if hold < 1000000{
                sizeLabel.text = "City"
            }else if hold < 3000000{
                sizeLabel.text = "Metropolis"
            }else if hold < 10000000{
                sizeLabel.text = "State"
            }else if hold < 100000000{
                sizeLabel.text = "Country"
            }else{
                sizeLabel.text = "Empire"
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

//
//  LoginViewController.swift
//  EmpireSim
//
//  Created by Joshua Meenan on 4/30/23.
//

import UIKit


class LoginViewController: UIViewController {
    
    var theAppDelegate: AppDelegate?
    var myModel : gameModel?

    override func viewDidLoad() {
        self.theAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myModel = self.theAppDelegate?.myModel
        AppUtility.lockOrientation(.landscape)
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func newGamePush(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    @IBAction func continueGamePush(_ sender: Any) {
        myModel?.loadFromData()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(loginVC, animated: true, completion: nil)
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



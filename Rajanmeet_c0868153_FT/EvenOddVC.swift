//
//  ViewController.swift
//  Rajanmeet_c0868153_FT
//
//  Created by Rajanmeet Kaur on 07/11/22.
//

import UIKit

class EvenOddVC: UIViewController {
    
    @IBOutlet weak var EvenButton: UIButton!
    
    @IBOutlet weak var OddButton: UIButton!
    
    @IBOutlet weak var number: UILabel!

    var score : Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapEven = UITapGestureRecognizer(target: self, action: #selector(checkEven))
        let tapOdd = UITapGestureRecognizer(target: self, action: #selector(checkOdd))
        
        EvenButton.addGestureRecognizer(tapEven)
        OddButton.addGestureRecognizer(tapOdd)
        
        loadRandomNumber()
        restartGame()
    }
    func loadRandomNumber() {
        let number = Int(arc4random_uniform(100))
        self.number.text = "\(number)"
    }
    func isEven(number: Int) -> Bool {
        if number % 2 == 0 {return true}
        else {return false}
    }
    
    @objc func checkEven() {
        let number = Int(self.number.text!) ?? 0
        if isEven(number: number){
            
            score += 1
            let infoAlert = UIAlertController(title: "Result:", message: "Correct answer", preferredStyle: .alert)
            
            infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))

            infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.ShowProgressVC()}))

            self.present(infoAlert, animated: true)
            loadRandomNumber()

        }
        else {
            let alertController = UIAlertController(
                   title: "Result:", message: "Oopss... Wrong answer Right Answer is Even ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                   title: "Play Again!", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            let defaultAction2 = UIAlertAction(
                   title: "Show Progress", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
            print("wrong answer")
        }
    }
    
    @objc func checkOdd() {
        let number = Int(self.number.text!) ?? 0
        if !isEven(number: number){
            loadRandomNumber()
            score += 1
            let infoAlert = UIAlertController(title: "Result:", message: "Correct answer", preferredStyle: .alert)
            
            infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))

            infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.ShowProgressVC()}))
            loadRandomNumber()
            self.present(infoAlert, animated: true)
        }
        else {
            let alertController = UIAlertController(
                   title: "Result:", message: "Oopss... Wrong answer Right Answer is Odd ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                   title: "Play Again!", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            let defaultAction2 = UIAlertAction(
                   title: "Show Progress", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
            print("wrong answer")

        }
    }
   
    
    func ShowProgressVC(){

        print("Hello")

            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

            let homeVC = mainSB.instantiateViewController(withIdentifier: "ShowTVScene")

            navigationController?.pushViewController(homeVC, animated: true)

        }

    
    func restartGame() {
            score = 0
        
    }
    
    
}

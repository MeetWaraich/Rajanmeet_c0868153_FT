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
            
            print("Even")
        }
        else {
            print("wrong answer")
        }
    }
    
    @objc func checkOdd() {
        let number = Int(self.number.text!) ?? 0
        if !isEven(number: number){
            print("Odd")
        }
        else {
            let alertController = UIAlertController(
                   title: "Play Again!", message: "Your message", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                   title: "Show Progress", style: .default, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        }
    }
    
    func restartGame() {
  
    }
    
    
}

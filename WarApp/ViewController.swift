//
//  ViewController.swift
//  WarApp
//
//  Created by Napatchol Thaipanich on 28/6/18.
//  Copyright © 2018 Napatchol Thaipanich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    var left = 0
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    var right = 0
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    @IBAction func dealTapped(_ sender: Any) {
        print("Deal!")
        let leftRandomNumber = arc4random_uniform(13) + 2
        let rightRandomNumber = arc4random_uniform(13) + 2
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        rightImageView.image = UIImage(named:  "card\(rightRandomNumber)")
        
        
        if leftRandomNumber > rightRandomNumber {
            left+=1
            leftScoreLabel.text = String(left)
            let alert = UIAlertController(title: "Congratulation", message: "You're win", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Thank You", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else if leftRandomNumber < rightRandomNumber {
            right+=1
            rightScoreLabel.text = String(right)
            let alert = UIAlertController(title: "Sorry", message: "You're lose", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Draw", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        if(left == 5 || right == 5){
            button.isEnabled = false
            reset.isHidden = false
            if left == 5{
                let alert = UIAlertController(title: "Congratulation", message: "You're win", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Thank You", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            } else{
                let alert = UIAlertController(title: "Sorry", message: "You're lose", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
    }
    @IBAction func resetTapped(_ sender: Any) {
        button.isEnabled = true
        reset.isHidden = true
        left = 0
        right = 0
        leftScoreLabel.text = String(left)
        rightScoreLabel.text = String(right)
        leftImageView.image = UIImage(named: "back")
        rightImageView.image = UIImage(named:  "back")
    }
}


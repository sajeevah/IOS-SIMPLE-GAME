//
//  ViewController.swift
//  MADLAB02
//
//  Created by SE on 7/29/18.
//  Copyright © 2018 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randNumberLab: UILabel!
    @IBOutlet weak var scoreLab: UILabel!
    @IBOutlet weak var roundLab: UILabel!
    @IBOutlet weak var sliderV: UISlider!
    var randomValue : Int = 0
    var sliderValue : Int = 0
    var totalScore : Int = 0
    var round : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateRandomNumber()
        self.customSlider()
    }


    @IBAction func hitMebtn(_ sender: Any) {
        
        // score calculation
        let score  = 100 - abs(sliderValue - randomValue)
        self.totalScore += score
        self.round += 1
        
        // show alert
        let alert = UIAlertController(title: "You almost had it!", message: "You score \(score) point ", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: " Ok ", style: .default) { (action) in
            self.scoreLab.text = "\(self.totalScore)"
            self.roundLab.text = "\(self.round)"
            self.generateRandomNumber()
        }
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        self.sliderValue = Int(sender.value)
    }
    
    func generateRandomNumber(){
        self.randomValue = Int(arc4random_uniform(100))
        self.randNumberLab.text = "\(randomValue)"
    }
    
    func customSlider(){
        let sliderThumbNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let sliderThumbHighli = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let leftSlider = #imageLiteral(resourceName: "SliderTrackLeft")
        let rightSlider = #imageLiteral(resourceName: "SliderTrackRight")
        
        sliderV.setThumbImage(sliderThumbNormal, for: .normal)
        sliderV.setThumbImage(sliderThumbHighli, for: .highlighted)
    
        let insert = UIEdgeInsetsMake(0, 14, 0, 14)
        
        let leftSliderResized = leftSlider.resizableImage(withCapInsets: insert)
        let rightSliderResized = rightSlider.resizableImage(withCapInsets: insert)
        
        sliderV.setMinimumTrackImage(leftSliderResized, for: .normal)
        sliderV.setMaximumTrackImage(rightSliderResized, for: .normal)
    }
    
    @IBAction func resetBtnAction(_ sender: Any) {
        self.randomValue = 0
        self.sliderValue = 0
        self.totalScore = 0
        self.round = 1
        self.generateRandomNumber()
        self.scoreLab.text = "\(self.totalScore)"
        self.roundLab.text = "\(self.round)"
    }
}


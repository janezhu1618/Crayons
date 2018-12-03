//
//  CrayonDetailViewController.swift
//  CrayonApp
//
//  Created by Jane Zhu on 12/3/18.
//  Copyright © 2018 Jane Zhu. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    var crayon: Crayon!
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = crayon.color()
        defaultValues()
        updateLabels()
    }
    
    private func updateLabels() {
        redLabel.text = redSlider.value.description
        greenLabel.text = greenSlider.value.description
        blueLabel.text = blueSlider.value.description
        alphaLabel.text = alphaStepper.value.description
    }
    
    private func defaultValues() {
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        alphaStepper.value = 1
    }
    
    private func updateColor() {
        let color = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
        view.backgroundColor = color
        updateLabels()
    }
    
    @IBAction func sliderChanged(_ slider: UISlider) {
        updateColor()
        
    }
    
    @IBAction func stepperChanged(_ stepper: UIStepper) {
        updateColor()
    }
    
    @IBAction func defaultBackgroundColor (_ button: UIButton) {
        view.backgroundColor = crayon.color()
        defaultValues()
    }

}

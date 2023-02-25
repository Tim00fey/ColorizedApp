//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Тимофей Юдин on 25.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    unowned var delegate: SettingsViewControllerDelegate!
    
    var color: UIColor?
    
    // MARK: IBOutlets
    @IBOutlet var colorizedView: UIView! {
        didSet {
            colorizedView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    //MARK: IBActions
    @IBAction func doneButtonTapped() {
        delegate.setupView(with: color)
        dismiss(animated: true)
    }
    
    @IBAction func sliderSlided(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        
        switch sender.tag {
        case 1:
            redLabel.text = value
            redTF.text = value
            
            paintView()
        case 2:
            greenLabel.text = value
            greenTF.text = value
            
            paintView()
        default:
            blueLabel.text = value
            blueTF.text = value
            
            paintView()
        }
    }
    
    private func paintView() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    
}

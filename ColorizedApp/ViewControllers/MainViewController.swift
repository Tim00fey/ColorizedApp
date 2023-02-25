//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Тимофей Юдин on 25.02.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setupView(with color: UIColor?)
}

class MainViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let color = color else { return }
        
        view.backgroundColor = UIColor(
            red: color.ciColor.red,
            green: color.ciColor.green,
            blue: color.ciColor.blue,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }


}

extension MainViewController: SettingsViewControllerDelegate {
    func setupView(with color: UIColor?) {
        guard let color = color else { return }
        self.color = color
    }
}


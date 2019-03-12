//
//  ViewController.swift
//  Tab bar
//
//  Created by Миронов Влад on 07/03/2019.
//  Copyright © 2019 Миронов Влад. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var buttonName: String? {
        didSet {
            if button != nil {
                button.setTitle(buttonName, for: .normal)
            }
        }
    }
    
    var colors: [UIColor] = [ .red, .orange, .lightGray, .blue]
    
    @IBOutlet weak var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let buttonName = buttonName {
            button.setTitle(buttonName, for: .normal)
        }
    }
    
    func message(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = file.components(separatedBy: "/").last ?? ""
        
        print("In \(fileName) line \(line) function \(function): \(message)")
    }
    
    func buttonPressed(_ function: String = #function, color: UIColor) {
        tabBarItem.title = function
        
        for viewController in tabBarController!.viewControllers! {
            let mainViewController = viewController as! ViewController
            mainViewController.view.backgroundColor = color
            viewController.tabBarItem.badgeValue = nil
        }
        
        tabBarItem.badgeColor = UIColor.red
        tabBarItem.badgeValue = "!"
    }
    
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        buttonPressed(color: .red)
    }
    
    @IBAction func orangeButtonPressed(_ sender: UIButton) {
        buttonPressed(color: .orange)
    }
    
    @IBAction func cyanButtonPressed(_ sender: UIButton) {
        buttonPressed(color: .cyan)
    }
    
    @IBAction func grayButtonPressed(_ sender: UIButton) {
        buttonPressed(color: .lightGray)
    }
    
    
}


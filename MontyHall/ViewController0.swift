//
//  ViewController0.swift
//  MontyHall
//
//  Created by Mark Meretzky on 1/6/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit

class ViewController0: UIViewController {
    let n: Int = 3;
    var choice: Int?;  //in the range 0 ..< n

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        //Validate the information the user just pressed.

        guard let text: String = sender.titleLabel?.text else { //optional chaining
            print("The pressed button had no text.");
            return;
        }
        
        guard let choice: Int = Int(text) else {
            print("The pressed button had \(text) instead of a number.");
            return;
        }
        
        guard (1 ... n).contains(choice) else {
            print("The pressed button had \(choice) instead of a number in 1 ... \(n)");
            return;
        }

        self.choice = choice - 1;   //Humans start counting at 1, machines at 0.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController1: ViewController1 = segue.destination as? ViewController1 else {
            print("segue to unknown view controller \(type(of: segue.destination))");
            return;
        }
        
        //Deposit information into the next view controller.
        viewController1.choice = choice;
    }
    
}


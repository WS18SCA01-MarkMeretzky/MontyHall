//
//  ViewController1.swift
//  MontyHall
//
//  Created by Mark Meretzky on 1/6/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController1: UIViewController {
    let n: Int = 3;
    let cadillac: Int;
    var choice: Int?; //from ViewController0
    var goat: Int?    //Show a goat in this door.

    @IBOutlet weak var label: UILabel!
    @IBOutlet var buttons: [UIButton]!;
    
    required init?(coder aDecoder: NSCoder) {
        cadillac = Int.random(in: 0 ..< n);
        print("VC1 set cadillac = \(cadillac).");
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        
        //Validate the information that came from ViewController0.
        
        guard let choice: Int = choice else {
            print("VC1 received a nil choice.");
            return;
        }
        
        guard (0 ..< n).contains(choice) else {
            print("VC1 received \(choice) instead of a number in 1 ... \(n)");
            return;
        }

        //goat is the first number that is neither choice nor cadillac.
        let goat: Int = (0 ..< n).first(where: {$0 != choice && $0 != cadillac})!;
        buttons[goat].isEnabled = false;
        buttons[goat].setTitle("G", for: .normal);
        
        //other is the first number that is neither choice nor goat.
        let other: Int = (0 ..< n).first(where: {$0 != choice && $0 != goat})!;
        
        //Humans start counting at 1, computers at 0.
        label.text = "Stick with door \(choice + 1), or switch to door \(other + 1)?"
        
        print("VC1 received choice = \(choice) from VC0.");
        print("VC1 set goat = \(goat)");
        print("VC1 set other = \(other)");
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
        
        self.choice = choice - 1;   //Humans start counting at 1, computers at 0.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let viewController2: ViewController2 = segue.destination as? ViewController2 else {
            print("segue to unknown view controller \(type(of: segue.destination))");
            return;
        }
        
        //Deposit information into the next view controller.
        
        if let choice: Int = choice {
            viewController2.win = choice == cadillac;
            print("VC1 passed win = \(viewController2.win!) to VC2.");
        }
    }

}

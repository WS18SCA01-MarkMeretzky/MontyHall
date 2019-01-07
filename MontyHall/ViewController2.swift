//
//  ViewController2.swift
//  MontyHall
//
//  Created by Mark Meretzky on 1/6/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController2: UIViewController {
    var win: Bool?;   //from ViewConttroller1; true if the user won the cadillac

    @IBOutlet weak var imageView: UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
        if let win: Bool = win {
            imageView.image = UIImage(named: win ? "cadillac" : "goat");
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

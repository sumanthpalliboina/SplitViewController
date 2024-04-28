//
//  ViewController.swift
//  SplitViewController
//
//  Created by Palliboina on 27/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigateBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NavigateToPrimaryScene(_ sender: UIButton) {
        performSegue(withIdentifier: "showprimary", sender: nil)
    }
    
}


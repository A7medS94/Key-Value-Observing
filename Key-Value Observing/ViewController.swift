//
//  ViewController.swift
//  Key-Value Observing
//
//  Created by Ahmed Samir on 7/15/19.
//  Copyright © 2019 Ahmed Samir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var valueChangeLbl: UILabel!
    @IBOutlet weak var txt: UITextField!
    
    //Vars
    @objc dynamic var value : String?
    var valueObservation : NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueObservation = observe(\ViewController.value,options: .new ,changeHandler: { (strongSelf, change) in
            guard let new = change.newValue else {return}
            strongSelf.valueChangeLbl.text = new
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        valueObservation?.invalidate()
    }
    
    @IBAction func didChangeValueBtn(_ sender: Any) {
        value = "Btn pressed!"
    }
    
    @IBAction func didChangeTxt(_ sender: Any) {
        value = self.txt.text
    }
}


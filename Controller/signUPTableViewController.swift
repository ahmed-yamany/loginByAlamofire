//
//  signUPTableViewController.swift
//  fashion
//
//  Created by Ahmed Yamany on 23/08/2022.
//

import UIKit

class signUPTableViewController: UITableViewController {

    
    @IBOutlet weak var TVCell: UITableViewCell!
    @IBOutlet weak var TVCell2: UITableViewCell!
    @IBOutlet weak var TVCell3: UITableViewCell!
    @IBOutlet weak var TVCell4: UITableViewCell!
    @IBOutlet weak var TVCell5: UITableViewCell!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    func updateUI(){
        tableView.backgroundColor = .clear
        TVCell.backgroundColor = .clear
        TVCell2.backgroundColor = .clear
        TVCell3.backgroundColor = .clear
        TVCell4.backgroundColor = .clear
        TVCell5.backgroundColor = .clear
        signUpBtn.layer.cornerRadius = signUpBtn.frame.height / 5

    }
  
    

}

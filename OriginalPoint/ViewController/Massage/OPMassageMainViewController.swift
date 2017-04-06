//
//  OPMassageMainViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/15.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPMassageMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func massageDetailAction(_ sender: Any) {
        
        let detailVC = OPMassageDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true);
    }

}

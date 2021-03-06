//
//  OPStationViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/23.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPStationViewController: UIViewController {

    @IBOutlet weak var titleLabel: OPTitileLabel!
    var stationData = OPStationObject();
    
    
    func initWithStationObject(data:OPStationObject) {
    
        stationData = data;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = stationData.stationName;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true);
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

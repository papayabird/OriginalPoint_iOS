//
//  OPNotiDetailViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/2/1.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPNotiDetailViewController: UIViewController {

    @IBOutlet weak var navTitleLabel: OPTitileLabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    var notiObject = OPNotiObject()
    
    
    func setData(data:OPNotiObject) {
        
        notiObject = data;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navTitleLabel.text = notiObject.title;
        titleLabel.text = notiObject.title;
        dateLabel.text = notiObject.date;
        contentTextView.text = notiObject.content;
    }

    @IBAction func backAction(_ sender: Any) {
        self.navigationController!.popViewController(animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

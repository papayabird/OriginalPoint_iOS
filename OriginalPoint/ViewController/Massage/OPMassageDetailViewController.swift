//
//  OPMassageDetailViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/4/5.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

extension UILabel {
    
    func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize.init(width: width, height: 10000)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.height
    }
}


class OPMassageDetailViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var topImageView: UIView!
    @IBOutlet weak var bgscrollView: UIScrollView!
    @IBOutlet weak var infoLabelConstraintHeight: NSLayoutConstraint!
    let text : String = "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddbelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLbelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddLadddddddddddddddddddddddddddddddddddddddddddddddddddbelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLbelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelL"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        infoLabelConstraintHeight.constant = infoLabel.getLabHeigh(labelStr: text, font: infoLabel.font, width: infoLabel.frame.width)
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.layoutIfNeeded()
            
        }) { (Bool) in
            self.bgscrollView.contentSize = CGSize.init(width: self.view.frame.width, height: 20 + self.topImageView.frame.size.height + self.infoLabelConstraintHeight.constant)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

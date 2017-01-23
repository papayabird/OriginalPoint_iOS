//
//  OPCaseMainViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/15.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPCaseMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    
    let filterVC = OPFilterCaseViewController();
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var caseTableView: UITableView!
    var scrollPointY = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        caseTableView.contentInset = UIEdgeInsets.init(top: 40, left: 0, bottom: 0, right: 0);
    }
    
    @IBAction func filterAction(_ sender: Any) {
        
        self.present(filterVC, animated: true) { 
            
            
        };
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "identtifier";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
        }
        cell!.textLabel!.text = String(indexPath.row);
        
        return cell!;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    //MARK:ScrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y);
        displayCatView(Int(Float(scrollView.contentOffset.y)));
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(scrollView.contentOffset.y);
        displayCatView(Int(Float(scrollView.contentOffset.y)));
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y);
        displayCatView(Int(Float(scrollView.contentOffset.y)));
    }
    
    func displayCatView(_ pointY:Int) {
        
        if pointY >= 0 {
            catView.isHidden = true;
        }
        else {
            catView.isHidden = false;
        }
        scrollPointY = pointY;
    }
}

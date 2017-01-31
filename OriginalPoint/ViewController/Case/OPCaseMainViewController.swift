//
//  OPCaseMainViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/15.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit
import Firebase

// Definition:
extension Notification.Name {
    static let WindowDidBecomeHiddenNoti = Notification.Name("UIWindowDidBecomeHiddenNotification")
}

class OPCaseMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    
    let filterVC = OPFilterCaseViewController();
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var caseTableView: UITableView!
    var scrollPointY = 0;
    var rootRef = FIRDatabase.database().reference().child("CaseDB");
    var videoObject = OPVideoObject();
    var videoArray = Array<OPVideoObject>();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(OPCaseMainViewController.closeFullScreen), name: .WindowDidBecomeHiddenNoti, object: nil)
        
        caseTableView.register(UINib(nibName: "OPCaseTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell");
        caseTableView.contentInset = UIEdgeInsets.init(top: 40, left: 0, bottom: 0, right: 0);
        
        getCaseData();
    }
    
    func closeFullScreen() {
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }

    @IBAction func filterAction(_ sender: Any) {
        
        self.present(filterVC, animated: true) { 
            
            
        };
        
    }

    func getCaseData() {
        
        rootRef.observeSingleEvent(of: .value, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            for key in (value?.allKeys)! {
                
                let videoDict = value?[key] as? [String : String]
                let videoObject = OPVideoObject()
//                videoObject.videoName = videoDict!["videoName"]! as String
                videoObject.date = videoDict!["date"]! as String
                videoObject.url = videoDict!["url"]! as String
                videoObject.type = videoDict!["type"]! as String
                self.videoArray.append(videoObject);
            }
            
            self.caseTableView.reloadData();
            
        }) { (error) in
            print(error.localizedDescription);
        }
    }

    
    //MARK:TableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.frame.size.width * (200.0/320.0);
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
        let identifier = "identtifier";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
        }
         */
        
        let cell = caseTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OPCaseTableViewCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        let videoOb = self.videoArray[indexPath.row];
        cell.setVideoData(url: videoOb.url, title: videoOb.type);
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.videoArray.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    //MARK:ScrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y);
        displayCatView(Int(Float(scrollView.contentOffset.y)));
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print(scrollView.contentOffset.y);
        displayCatView(Int(Float(scrollView.contentOffset.y)));
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y);
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

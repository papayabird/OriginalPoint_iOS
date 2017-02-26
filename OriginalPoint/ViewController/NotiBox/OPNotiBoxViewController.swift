//
//  OPNotiBoxViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/31.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit
import Firebase

class OPNotiBoxViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notiTableView: UITableView!
    var rootRef = FIRDatabase.database().reference().child("NotiBoxDB");
    var notiArray = Array<OPNotiObject>();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notiTableView.register(UINib(nibName: "OPNotiTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell");

        getNotiData();
    }
    
    func getNotiData() {
        
        
        rootRef.observeSingleEvent(of: .value, with: { snapshot in
            
            let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot]
            for snap in snapshots! {
                
                let notiObject = OPNotiObject()
                if let notiDict = snap.value as? Dictionary<String, AnyObject> {
                    notiObject.title = notiDict["title"] as! String
                    notiObject.date = notiDict["date"] as! String
                    notiObject.descriptionText = notiDict["description"] as! String
    //                notiObject.content = notiDict!["content"]! as String
                    self.notiArray.append(notiObject);
                }
            }
            
            self.notiTableView.reloadData();
            
        }) { (error) in
            print(error.localizedDescription);
        }
    }
    
    //MARK:TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = notiTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OPNotiTableViewCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        let notiOb = self.notiArray[indexPath.row];
        cell.setData(data: notiOb)
        return cell;

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notiArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let notiDetailVC = OPNotiDetailViewController();
        notiDetailVC.setData(data: notiArray[indexPath.row])
        self.navigationController?.pushViewController(notiDetailVC, animated: true);
    }
    

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

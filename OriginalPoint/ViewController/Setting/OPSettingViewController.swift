//
//  OPSettingViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/31.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPSettingViewController: OPBasicViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);

    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    //MARK:TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
         let identifier = "identtifier";
         var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
         if(cell == nil){
         cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
         }
 
        /*
        let cell = caseTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OPCaseTableViewCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        let videoOb = self.videoArray[indexPath.row];
        cell.setVideoData(url: videoOb.url, title: videoOb.type);
 */
        return cell!;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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

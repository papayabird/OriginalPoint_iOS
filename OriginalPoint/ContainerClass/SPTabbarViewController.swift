//
//  SPTabbarViewController.swift
//  SwiftP1
//
//  Created by papayabird on 2016/10/10.
//  Copyright © 2016年 SP. All rights reserved.
//

import UIKit

enum navList : Int {
    case navListTableViewVC = 0
    case navListCollectionViewVC
    case navListMotionVC
}

class SPTabbarViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    var dict = Dictionary<String, Any>()
    var currentNav = UINavigationController()

    class Singleton: SPTabbarViewController {
        
        //MARK: Shared Instance
        static let sharedInstance : SPTabbarViewController = {
            let instance = SPTabbarViewController()
            return instance
        }()
        /*
         //MARK: Local Variable
         var emptyStringArray : [String]? = nil
         
         //MARK: Init
         convenience init() {
         self.init(array : [])
         }
         
         //MARK: Init Array
         init( array : [String]) {
         emptyStringArray = array
         }
         */
    }
    
    convenience init() {
        
        self.init(nibName: nil, bundle: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableViewVC = SPTableViewController();
        let tableViewnav = UINavigationController.init(rootViewController: tableViewVC);
        tableViewnav.navigationBar.isHidden = true;
        
        let collectionViewVC = SPCollectionViewController();
        let collectionViewnav = UINavigationController.init(rootViewController: collectionViewVC);
        collectionViewnav.navigationBar.isHidden = true;
        
        let motionViewVC = SPMotionViewController();
        let motionViewnav = UINavigationController.init(rootViewController: motionViewVC);
        motionViewnav.navigationBar.isHidden = true;
        
        dict.updateValue(tableViewnav, forKey: String(navList.navListTableViewVC.rawValue));
        dict.updateValue(collectionViewnav, forKey: String(navList.navListCollectionViewVC.rawValue));
        dict.updateValue(motionViewnav, forKey: String(navList.navListMotionVC.rawValue));
        
        currentNav.view.removeFromSuperview();
        currentNav = dict[String(navList.navListTableViewVC.rawValue)] as! UINavigationController;
        addTabbar();
    }
    
    @IBAction func itemAction(_ sender: AnyObject) {
        
        if currentNav .isEqual(dict[String(sender.tag)]) {
            
            if currentNav.viewControllers.count == 1 {
                
            }
            else {
                let rootVC = currentNav.viewControllers[0];
                currentNav.setViewControllers([rootVC], animated: true);
            }
        }
        
        currentNav.view.removeFromSuperview();
        currentNav = dict[String(sender.tag)] as! UINavigationController;
        
        addTabbar();
    }
    
    func addTabbar() -> () {

        self.addChildViewController(currentNav);
        currentNav.view.frame = self.view.frame;
        self.view.addSubview(currentNav.view);
        self.view .sendSubview(toBack: currentNav.view);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

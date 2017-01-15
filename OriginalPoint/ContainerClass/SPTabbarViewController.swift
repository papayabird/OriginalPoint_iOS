//
//  SPTabbarViewController.swift
//  SwiftP1
//
//  Created by papayabird on 2016/10/10.
//  Copyright © 2016年 SP. All rights reserved.
//

import UIKit

enum navList : Int {
    case navListMassageViewVC = 0
    case navListCaseViewVC
    case navListStationVC
    case navListCalendarVC
}

class SPTabbarViewController: UIViewController, KYButtonDelegate {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var menuButton: KYButton!
    
    var dict = Dictionary<String, Any>()
    var currentNav = UINavigationController()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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

        let massageVC = OPMassageMainViewController();
        let massageNav = UINavigationController.init(rootViewController: massageVC);
        massageNav.navigationBar.isHidden = true;

        let caseViewVC = OPCaseMainViewController();
        let caseNav = UINavigationController.init(rootViewController: caseViewVC);
        caseNav.navigationBar.isHidden = true;
        
        let stationViewVC = OPStationMainViewController();
        let sttionNav = UINavigationController.init(rootViewController: stationViewVC);
        sttionNav.navigationBar.isHidden = true;
        
        let calendarViewVC = OPCalendarMainViewController();
        let calendarNav = UINavigationController.init(rootViewController: calendarViewVC);
        calendarNav.navigationBar.isHidden = true;
        
        dict.updateValue(massageNav, forKey: String(navList.navListMassageViewVC.rawValue));
        dict.updateValue(caseNav, forKey: String(navList.navListCaseViewVC.rawValue));
        dict.updateValue(sttionNav, forKey: String(navList.navListStationVC.rawValue));
        dict.updateValue(calendarNav, forKey: String(navList.navListCalendarVC.rawValue));

        currentNav.view.removeFromSuperview();
        currentNav = dict[String(navList.navListMassageViewVC.rawValue)] as! UINavigationController;
        addTabbar();
        initMenuButton();
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
    
    //MARK:MenuButton
    
    func initMenuButton() {
        menuButton.kyDelegate = self
        menuButton.openType = .popDown
        menuButton.plusColor = UIColor.white
        menuButton.fabTitleColor = UIColor.white
        menuButton.add(color: UIColor.red, title: "Hello")
        menuButton.add(color: UIColor.red, title: "Hello")

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

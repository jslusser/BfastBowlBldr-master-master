//
//  MainMenuTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/14/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit
import Crashlytics
import UserNotifications

class MainMenuTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        Comment out the following - customize when ready to use Answers, but the code is already installed and configured in my Fabric account [part of Fabric/Crashlytics]
//        let button = UIButton(type: UIButtonType.roundedRect)
//        button.setTitle("Trigger Key Metric", for: [])
//        button.addTarget(self, action: #selector(self.anImportantUserAction), for: UIControlEvents.touchUpInside)
//        button.sizeToFit()
//        button.center = self.view.center
//        view.addSubview(button)

//        Still need to build out the notifications, likely in a future version when I have a indiviual user recipe database and am using CloudKit
         registerLocal()
//        Commented out the following until I resume Crashlytics testing prn
//        Crashlytics.sharedInstance().crash()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
//        Comment out the following - customize when ready to implement Answers (part of Fabric/Crashlytics)
//      @objc func anImportantUserAction() {
//        TODO: Move this method and customize the name and parameters to track your key metrics
//        Use your own string attributes to track common values over time
//        Use your own number attributes to track median value over time
//        Answers.logCustomEvent(withName: "Video Played", customAttributes: ["Category":"Comedy", "Length":350])
//    }

    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, _) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
}

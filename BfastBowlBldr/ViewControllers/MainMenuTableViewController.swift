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
        // Still need to build out the notifications, likely in a future version when I have a indiviual user recipe database and am using CloudKit
         registerLocal()
        // Commented out the following until I resume Crashlytics testing prn
        // Crashlytics.sharedInstance().crash()
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

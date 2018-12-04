//
//  ReminderVC.swift
//  Reminder
//
//  Created by WHITEOPEN on 30/11/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import UIKit
import UserNotifications

class ReminderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reminderList = [ReminderModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReminderData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setReminderData(){
        let r1 = ReminderModel(title: "test", desc: "cuman test", reminderDate: "03-Des-2018")
        
        let r2 = ReminderModel(title: "ini beneran", desc: "ini beneran", reminderDate: "03-Des-2018")
        
        reminderList.append(r1)
        reminderList.append(r2)
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderViewCellID", for: indexPath) as? ReminderViewCell{
            
            let reminder = reminderList[indexPath.row]
            cell.updateUI(data: reminder)
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

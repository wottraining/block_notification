//
//  ViewController.swift
//  Reminder
//
//  Created by WHITEOPEN on 30/11/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var pengingatBtn: UIView!
    @IBOutlet weak var blockSeg: UISegmentedControl!
    
    var notifCenter = UNUserNotificationCenter.current()
    let data = ReminderModel(title: "Test 1", desc: "Assalammu'alaikum world", reminderDate: "03-12-2018 17:20:00")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //kondisi awal
        UserDefaults.standard.set(true, forKey: "isBlock")
        if UserDefaults.standard.bool(forKey: "isBlock") {
            blockSeg.selectedSegmentIndex = 1
        }
        //end kondisi awal
        
        //requesting for authorization
        //for notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        notifCenter.delegate = self
        
        //for remove label in back navigation
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //for action click view
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.pengingatBtnPressed(_:)))
        self.pengingatBtn.addGestureRecognizer(gesture)
        
        checkBlock()
    }
    
    @objc func pengingatBtnPressed(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "ReminderID", sender: nil)
    }
    
    @IBAction func blockAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex < 1 {
            UserDefaults.standard.set(false, forKey: "isBlock")
        }else{
            UserDefaults.standard.set(true, forKey: "isBlock")
        }
        checkBlock()
    }
    
    func checkBlock(){
        let status = UserDefaults.standard.bool(forKey: "isBlock")
        if status {
            notifCenter.removeAllPendingNotificationRequests()
            print("block : on")
        }else{
            let data1 = ReminderModel(title: "Test 1", desc: "Test yang pertama", reminderDate: "03-12-2018 17:34:00")
            notify(data: data1)
            
            let data2 = ReminderModel(title: "Test 2", desc: "Test yang kedua", reminderDate: "03-12-2018 17:35:00")
            notify(data: data2)
            
            let data3 = ReminderModel(title: "Test 3", desc: "Test yang ketiga", reminderDate: "03-12-2018 17:36:00")
            notify(data: data3)
            //notify(data: data)
            print("block : off")
        }
    }
    
    func notify(data:ReminderModel){
        //creating the notification content
        let content = UNMutableNotificationContent()
        
        //adding title, subtitle, body and badge
        content.title = data.title
        //content.subtitle = "iOS Development is fun"
        content.body = data.desc
        content.badge = 1
        content.sound = .default
        
        //getting the notification trigger
        //it will be called after 5 seconds
        var date = Date()
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        date = dateTimeFormatter.date(from: data.reminderDate)!
        
        let units: Set<Calendar.Component> = [.hour, .minute, .second, .day, .month, .year]
        let finalDate = Calendar.current.dateComponents(units, from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: finalDate, repeats: false)
        
        //getting the notification request and unique name
        let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification\(finalDate.minute)\(finalDate.hour)\(finalDate.year)\(finalDate.month)\(finalDate.day)", content: content, trigger: trigger)
        
        //adding the notification to notification center
        notifCenter.add(request, withCompletionHandler: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //displaying the ios local notification when app is in foreground
        completionHandler([.alert, .badge, .sound])
    }
}


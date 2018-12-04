//
//  ReminderModel.swift
//  Reminder
//
//  Created by WHITEOPEN on 03/12/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import Foundation

class ReminderModel:NSObject{
    private var _title:String!
    private var _desc:String!
    private var _reminderDate:String!
    
    var title:String{
        return _title
    }
    
    var desc:String{
        return _desc
    }
    
    var reminderDate:String{
        return _reminderDate
    }
    
    init(title:String, desc:String, reminderDate:String) {
        _title = title
        _desc = desc
        _reminderDate = reminderDate
    }
}

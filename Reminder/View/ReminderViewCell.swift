//
//  ReminderViewCell.swift
//  Reminder
//
//  Created by WHITEOPEN on 03/12/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import UIKit

class ReminderViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var reminderDateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        //membuat garis bawah pada row tidak memiliki margin
        self.separatorInset = .zero
        //menampilkan long press menu
    }

    func updateUI(data:ReminderModel){
        titleLbl.text = data.title
        descLbl.text = data.desc
        reminderDateLbl.text = data.reminderDate
    }
    
    @objc func handleLongPressed(_ gestureRecognizer: UILongPressGestureRecognizer){
        
    }
    
    @objc func handleCustomAction(_ controller: UIMenuController) {
        print("Custom action!")
    }
    
    @objc func handleCopyAction(_ controller: UIMenuController) {
        //UIPasteboard.general.string = text ?? ""
    }
}

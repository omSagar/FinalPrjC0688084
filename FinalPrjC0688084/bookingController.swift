//
//  bookingController.swift
//  FinalPrjC0688084
//
//  Created by Sagar Patel on 2017-04-08.
//  Copyright © 2017 Sagar Patel. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class bookingController: UIViewController
{
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    @IBAction func saveBooking(_ sender: UIButton)
    {
        
        
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
       // dateFormatter.dateStyle = DateFormatter.Style.MediumStyle
        
       // dateFormatter.timeStyle = DateFormatter.Style.NoStyle
        
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
}

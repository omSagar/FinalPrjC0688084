//
//  hotelDetails.swift
//  FinalPrjC0688084
//
//  Created by Sagar Patel on 2017-04-08.
//  Copyright © 2017 Sagar Patel. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class hotelDetails: UIViewController
{    
    @IBOutlet weak var desc: UILabel!
    
    var data = String()
    var name = String()
    var details = String()
    var latt = Double()
    var long = Double()
    
    override func viewDidLoad() {
        title = name
        desc.text = details
    }
}

//
//  hotelBook.swift
//  FinalPrjC0688084
//
//  Created by Sagar Patel on 2017-04-08.
//  Copyright © 2017 Sagar Patel. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class hotelBook: UIViewController
{
    
    var hotel: [NSManagedObject] = []
    
    @IBOutlet weak var hName: UITextField!
    @IBOutlet weak var hDescription: UITextView!
    @IBOutlet weak var hLatitude: UITextField!
    @IBOutlet weak var hLongitude: UITextField!
    
    @IBAction func saveHotel(_ sender: Any)
    {
        self.save(hName : hName.text!, hDescription : hDescription.text!, hLatitude : Double(hLatitude.text!)!, hLongitude : Double(hLongitude.text!)!)
        //ViewController().tableView.reloadData()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "addHotel", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainHotel") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    

    func save(hName: String, hDescription : String, hLatitude : Double, hLongitude : Double) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        //1 : ... begin Creating a managed object for working with managed objects (store in disk).
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Hotels",
                                       in: managedContext)!
        
        let hotels = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        hotels.setValue(hName, forKeyPath: "hotelName")
        hotels.setValue(hDescription, forKeyPath: "hotelDescription")
        hotels.setValue(hLatitude, forKeyPath: "hotelLattitude")
        hotels.setValue(hLongitude, forKeyPath: "hotelLongitude")
        print(hName,hDescription,hLatitude,hLongitude)
        
        // 4
        do {
            try managedContext.save()
            hotel.append(hotels)
            
            //ViewController().viewDidLoad()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

//
//  ViewController.swift
//  FinalPrjC0688084
//
//  Created by Sagar Patel on 3/31/17.
//  Copyright © 2017 Sagar Patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var hotel: [NSManagedObject] = []
    
    //variable created 
    var arrHotelName = [String]()
    var arrHotelDesc = [String]()
    var arrHotelLattitude = [Double]()
    var arrHotelLongitude = [Double]()
    var indexSelected = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Hotel" // Setup the name of thew scene
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1 : ... begin Creating a managed object for working with managed objects (store in disk).
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        //1 : ... end Creating a managed object context for working with managed objects.
        
        
        //2 : Variable that will receive data retrieved from our Entities
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Hotels")
        
        //3 : Loop to read data store then in people (array created previously
        do {
            hotel = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()
    }
    
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of lines to be created in a View
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        print("Hotel Count: \(hotel.count)")
        return hotel.count
    }
    
    // Create cell per cell and asign a value typed by the user
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hotels = hotel[indexPath.row]
        //print("Hotel index PAth: \(hotels)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath) as UITableViewCell
        //print("Hotel cell: \(cell)")
        cell.textLabel?.text = hotels.value(forKeyPath: "hotelName") as? String
        
        //Store value in a string
        //arrHotelName[indexPath.row] = (hotels.value(forKeyPath: "hotelName") as? String)!
        //arrHotelDesc[indexPath.row] = (hotels.value(forKeyPath: "hotelDescription") as? String)!
        //arrHotelLattitude[indexPath.row] = (hotels.value(forKeyPath: "hotelLattitude") as? Double)!
        //arrHotelLongitude[indexPath.row] = (hotels.value(forKeyPath: "hotelLongitude") as? Double)!
        
        //print("Hotel Lattitude from array \(arrHotelLattitude)")
        //indexSelected = indexPath.row
                return cell
    }
    
    //For Perform Segue and select row index and identifier
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        performSegue(withIdentifier: "showDetailView", sender: self)
    }
    
    // Passing Data To Hotel Details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "showDetailView")
        {
            let indexPath = self.tableView.indexPathForSelectedRow!
            indexSelected = indexPath.row
            
        let DestViewController : hotelDetails = segue.destination as! hotelDetails
        
        DestViewController.name = (hotel[indexSelected].value(forKeyPath: "hotelName") as? String)!
        DestViewController.details = (hotel[indexSelected].value(forKeyPath: "hotelDescription") as? String)!
        DestViewController.latt = (hotel[indexSelected].value(forKeyPath: "hotelLattitude") as? Double)!
        DestViewController.long = (hotel[indexSelected].value(forKeyPath: "hotelLongitude") as? Double)!
            indexSelected = Int()
        }
    }
    
}


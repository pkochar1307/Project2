//
//  ViewController.swift
//  CRUD
//
//  Created by Capgemini on 09/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func retrieveData(_sender : Any){
        retrieveData()
    }
    

    
    @IBAction func createData(_sender : Any){
        createData()
    }
    
    
    func createData (){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName : "Sensor" , in : managedContext)!
        
        for i in 1...5{
            
            let Sensor = NSManagedObject (entity: userEntity, insertInto: managedContext)
            Sensor.setValue("Ankur\(i)", forKeyPath: "sensorID")
            Sensor.setValue("Ankur\(i)",forKeyPath: "sensorName")
            Sensor.setValue("Ankur\(i)", forKeyPath: "sensorDescription")
        }
        
        do{
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save.\(error)")
        }
    }
    
    func retrieveData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest <NSFetchRequestResult>(entityName: "Sensor")
        
        do{
            
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "sensorID") as! integer_t)
                
            }
            }catch{
                print(
                "Failed")
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


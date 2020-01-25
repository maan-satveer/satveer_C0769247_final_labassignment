//
//  detailViewController.swift
//  satveer_C0769247_final_labassignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData
class detailViewController: UIViewController {

    @IBOutlet weak var nametext: UILabel!
    
    @IBOutlet weak var idtext: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var details: UILabel!
    var listview: productTableViewController?
    var text1: String?
    var text2: String?
    var text3: String?
    var text4: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nametext.text = text1
              idtext.text = text2
               price.text = text3
              details.text = text4

        // Do any additional setup after loading the view.
    }
    func loadCoreData(){
        
        //products = [Product]()
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let productName = result.value(forKey: "name") as! String
                    let productId = result.value(forKey: "id") as! String
                    let productDescription = result.value(forKey: "detail") as! String
                    let productPrice = result.value(forKey: "price") as! Int
                    
                }
            }
        }
        catch{
            print(error)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

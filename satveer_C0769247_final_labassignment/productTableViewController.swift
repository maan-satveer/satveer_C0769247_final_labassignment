//
//  productTableViewController.swift
//  satveer_C0769247_final_labassignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import  CoreData
class productTableViewController: UITableViewController {
    var products:[Products]?
    var filteredProducts: [Product]?
     var productview: detailViewController?
       var currentIndex = -1
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadCoreData()
             saveCoreData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = product.name
        // Configure the cell...
        

        return cell!
    }
        @objc func saveCoreData(){
    
                      clearCoreData()
    //
                      let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
                       let context = appDelegate.persistentContainer.viewContext
    
                             //3rd step: write into the context
    
    
                       let product1 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
                       product1.setValue("Honda", forKey: "name")
                       product1.setValue("101", forKey: "id")
                       product1.setValue("This is new honda 2020", forKey: "detail")
                       product1.setValue(2400, forKey: "price")
    
    
                       let product2 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
                       product2.setValue("Laptop", forKey: "name")
                       product2.setValue("102", forKey: "id")
                       product2.setValue("This is new laptop", forKey: "detail")
                              product2.setValue(210, forKey: "price")
               let product3 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
                product3.setValue("Pen", forKey: "name")
                product3.setValue("101", forKey: "id")
                product3.setValue("This is new pen", forKey: "detail")
                product3.setValue(2, forKey: "price")
    
    
                let product4 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
                product4.setValue("Chair", forKey: "name")
                product4.setValue("102", forKey: "id")
                product4.setValue("This is new laptop", forKey: "detail")
                       product4.setValue(210, forKey: "price")
            let product5 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
             product5.setValue("Phone", forKey: "name")
             product5.setValue("101", forKey: "id")
             product5.setValue("This is new honda 2020", forKey: "detail")
             product5.setValue(2400, forKey: "price")
    
    
             let product6 = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
    
             product6.setValue("Table", forKey: "name")
             product6.setValue("102", forKey: "id")
             product6.setValue("This is new laptop", forKey: "detail")
            product2.setValue(210, forKey: "price")
    
    
                           //   4th step: save context
    
                             do{
                                 try context.save()
                                 //print(product1, "is saved")
                                 //print(product2, "is saved")
                             }
                             catch{
                                 print(error)
                             }
    
        }
    func loadCoreData(){
        products = [Products]()
        
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
                    let name = result.value(forKey: "name") as! String
                    let Id = result.value(forKey: "id") as! String
                    let Description = result.value(forKey: "detail") as! String
                    let Price = result.value(forKey: "price") as! Int
                    products?.append(Products(name: name, id: Id, detail: Description, price: Price))
                }
            }
        }
        catch{
            print(error)
         
     }
        }
    
    func clearCoreData(){
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            for managedObjects in results{
                if let managedObjectData = managedObjects as? NSManagedObject{
                    managedContext.delete(managedObjectData)
                }
            }
        }
        catch{
            print(error)
        }
    }

    
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailView = segue.destination as? detailViewController{
                    detailView.listview = self
                    //detailView.tasks = tasks
                    
                    if let tableViewCell = sender as? UITableViewCell{
                        if let index = tableView.indexPath(for: tableViewCell)?.row{
                          detailView.text1 = products![index].name
                          detailView.text2 = products![index].id
                          detailView.text3 = products![index].detail
                          detailView.text4 = String(products![index].price)
                            
                            currentIndex = index
                        }
                    }
                    
               }
    }
    

}

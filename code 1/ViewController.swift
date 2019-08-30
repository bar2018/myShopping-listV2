//
//  ViewController.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 06/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    var listOfItems: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            let item = try PersistenceService.context.fetch(fetchRequest)
            self.listOfItems = item
        } catch {}
        
    }
    
    
    @IBAction func addItemButtons(_ sender: UIButton) {
        var color = Item.Color.red
        switch sender.tag {
        case 1: color = .red
        case 2: color = .orange
        case 3: color = .green
        case 4: color = .yellow
        case 5: color = .blue
        case 6: color = .brown
        case 7: color = .purple
        case 8: color = .cyan
        case 9: color = .magenta
        case 10: color = .gray
        case 11: color = .white
        case 12: color = .darkGray
            
        default: break
            
        }
        if let text = addItemTextField.text, !text.isEmpty {
            addItemTextField.resignFirstResponder()
            
            let item = Item(context: PersistenceService.context)
            item.name = text
            item.colorID = color.rawValue
            listOfItems.append(item)
            PersistenceService.saveContext()
        }
    }
    

    enum SegueIdentifier {
        static let listOfItemsSegue = "ListOfItemsSegue"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.listOfItemsSegue {
            let listOfItemsVC = segue.destination as? ListOfItemsViewController
            listOfItemsVC?.listOfItems = listOfItems
            listOfItemsVC?.listDelegate = self
            PersistenceService.saveContext()
        }
    }

}



extension ViewController: ListDelegate {
    func didDeleletRow(at index: Int) {
        listOfItems.remove(at: index)
        //PersistenceService.context.delete(listOfItems.remove(at: index))
        
        PersistenceService.saveContext()
    }
}


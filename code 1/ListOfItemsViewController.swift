//
//  ListOfItemsViewController.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit
import CoreData

protocol ListDelegate: class {
    func didDeleletRow(at index: Int)
}

class ListOfItemsViewController: UIViewController {
    
    var deleteIndex: Int?
    weak var listDelegate: ListDelegate?
    
    @IBOutlet weak var listOfItemsTableView: UITableView!
    
    var listOfItems: [Item] = [] {
        didSet {
            if viewIfLoaded != nil {
                listOfItemsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //addItemTextField.becomeFirstResponder()
        arrangeShoppingList()
        PersistenceService.saveContext()
        listOfItemsTableView.dataSource = self
        listOfItemsTableView.delegate = self
        listOfItemsTableView.reloadData()
    
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            let item = try PersistenceService.context.fetch(fetchRequest)
            self.listOfItems = item
        } catch {}
        
    }
    

    private func arrangeShoppingList() {
        listOfItems.sort { (item0, item1) -> Bool in
            item0.colorID < item1.colorID
        }
        listOfItemsTableView.reloadData()
    }
    
    
    @IBAction func beckButton(_ sender: UIButton) {
        PersistenceService.saveContext()
        listOfItemsTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        arrangeShoppingList()
        PersistenceService.saveContext()
        listOfItemsTableView.reloadData()
    }
    
}


extension ListOfItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfItemsTableViewCell", for: indexPath) as! ListOfItemsTableViewCell
        cell.setInfo(item: listOfItems[indexPath.row], deleteRow: indexPath.row, cellDelegate: self)
        
        return cell
    }
    
    
}

extension ListOfItemsViewController: UITableViewDelegate {
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    //
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //
    //        let headerView = Bundle.main.loadNibNamed(HeaderView.NibName.header, owner: self, options: nil)?.first as! HeaderView
    //        headerView.configure(text: "Meat")
    //        return headerView
    //
    //    }
}

extension ListOfItemsViewController: CellDelegate {
    
    func deleteOneItem(delete row: Int) {
        //listOfItems.remove(at: row)
        PersistenceService.context.delete(listOfItems.remove(at: row))
        listDelegate?.didDeleletRow(at: row)
        //arrangeShoppingList()
        
        PersistenceService.saveContext()
        listOfItemsTableView.reloadData()
    }
    
    
}



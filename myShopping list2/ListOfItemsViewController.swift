//
//  ListOfItemsViewController.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit



class ListOfItemsViewController: UIViewController {
    
    
    @IBOutlet weak var listOfItemsTableView: UITableView!
    
    var listOfItems: [Item] = []
//    var listOfItems: [Item] = [] {
//        didSet {
//            if viewIfLoaded != nil {
//                listOfItemsTableView.reloadData()
//            }
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfItemsTableView.dataSource = self
        listOfItemsTableView.delegate = self
        listOfItems = PersistenceService.getShoppingList(arranged: true)
        listOfItemsTableView.reloadData()
    }
}


extension ListOfItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfItemsTableViewCell", for: indexPath) as! ListOfItemsTableViewCell
        cell.setInfo(item: listOfItems[indexPath.row], selectedRow: indexPath.row, cellDelegate: self)
        
        return cell
    }
}


extension ListOfItemsViewController: UITableViewDelegate {
//extension ListOfItemsViewController: UITableViewDelegate {
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //}
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
//}
}


extension ListOfItemsViewController: CellDelegate {
    
    func upatdeOneItem(with text: String, at row: Int) {
        listOfItems[row].name = text
        PersistenceService.saveContext()
    }
    
    func deleteOneItem(delete row: Int) {
        //listOfItems.remove(at: row)
        PersistenceService.context.delete(listOfItems.remove(at: row))
        PersistenceService.saveContext()
        listOfItemsTableView.reloadData()
    }
}


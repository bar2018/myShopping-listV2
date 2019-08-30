//
//  ViewController.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 06/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit
//import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    var listOfItems: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addItemTextField.becomeFirstResponder()
        listOfItems = PersistenceService.getShoppingList(arranged: false)
    }
    
    
    @IBAction func addItemButtons(_ sender: UIButton) {
        var color = Item.Color.red
        switch sender.tag {
        case 1:
            color = .red
        case 2:
            color = .orange
        case 3:
            color = .green
        case 4:
            color = .yellow
        case 5:
            color = .blue
        case 6:
            color = .brown
        case 7:
            color = .purple
        case 8:
            color = .cyan
        case 9:
            color = .magenta
        case 10:
            color = .gray
        case 11:
            color = .white
        case 12:
            color = .darkGray
        default:
            break
        }
        //if let text = addItemTextField.text, !text.isEmpty {
        //addItemTextField.resignFirstResponder()
        let alert = UIAlertController(title: "שם המוצר", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.textAlignment = .right
            textField.placeholder = "הכנס מוצר"
            
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                if let text = alert.textFields?.first?.text, !text.isEmpty {
                    
                    let item = Item(context: PersistenceService.context)
                    item.name = text
                    item.colorID = color.rawValue
                    PersistenceService.saveContext()
                }
            })
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}



// one way to practic for this ViewController
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//let alert = UIAlertController(title: "שם המוצר", message: nil, preferredStyle: .alert)
//alert.addTextField { (textField) in
//    textField.textAlignment = .right
//    textField.placeholder = "הכנס מוצר"
//}
//
//let okButton = UIAlertAction(title: "OK", style: .default) { (_) in
//    if let text = alert.textFields?.first?.text, !text.isEmpty {
//
//        let item = Item(context: PersistenceService.context)
//        item.name = text
//        item.colorID = color.rawValue
//        self.listOfItems.append(item)
//        PersistenceService.saveContext()
//    }
//}
//alert.addAction(okButton)
//self.present(alert, animated: true, completion: nil)
//}
//}





//Second way to practic for this ViewController
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//let alert = UIAlertController(title: "שם המוצר", message: nil, preferredStyle: .alert)
//alert.addTextField { (textField) in
//    textField.textAlignment = .right
//    textField.placeholder = "הכנס מוצר"
//
//    let okButton = UIAlertAction(title: "OK", style: .default, handler: { (_) in
//        if let text = alert.textFields?.first?.text, !text.isEmpty {
//
//            let item = Item(context: PersistenceService.context)
//            item.name = text
//            item.colorID = color.rawValue
//            self.listOfItems.append(item)
//            PersistenceService.saveContext()
//        }
//    })
//
//    alert.addAction(okButton)
//    self.present(alert, animated: true, completion: nil)
//}
//}
//}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








// ALERT FROM MAKING MY OWN textFeild AT Main.storyboard
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// let alert = UIAlertController(title: "הוספת מוצר", message: text + " ניכנס לרשימה", preferredStyle: .alert)
// let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
// alert.addAction(okButton)
// present(alert, animated: true, completion: nil)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







// add Constraint to textField
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//let alert = UIAlertController(title: "שם המוצר", message: nil, preferredStyle: .alert)
//alert.addTextField { (textField) in
//    textField.textAlignment = .right

//    let heightConstraint = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
//    textField.addConstraint(heightConstraint)

//    textField.placeholder = "הכנס מוצר"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

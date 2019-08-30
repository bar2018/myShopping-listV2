//
//  ListOfItemsTableViewCell.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit



protocol CellDelegate: class {
    func deleteOneItem (delete row: Int)
}

class ListOfItemsTableViewCell: UITableViewCell {
    
    private var deleteRow: Int?
    private weak var cellDelegate: CellDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deleteItemButton(_ sender: UIButton) {
        guard let row = deleteRow else {
            return
        }
        cellDelegate?.deleteOneItem(delete: row)
        
    }
}


extension ListOfItemsTableViewCell {
    func setInfo(item: Item, deleteRow: Int, cellDelegate: CellDelegate) {
        self.deleteRow = deleteRow
        self.cellDelegate = cellDelegate
        
        let color = Item.Color.getColor(for: item.colorID)
        switch color {
        case .red:
            contentView.backgroundColor = .red
        case .orange:
            contentView.backgroundColor = .orange
        case .green:
            contentView.backgroundColor = .green
        case .yellow:
            contentView.backgroundColor = .yellow
        case .blue:
            contentView.backgroundColor = .blue
        case .brown:
            contentView.backgroundColor = .brown
        case .purple:
            contentView.backgroundColor = .purple
        case .cyan:
            contentView.backgroundColor = .cyan
        case .magenta:
            contentView.backgroundColor = .magenta
        case .gray:
            contentView.backgroundColor = .gray
        case .white:
            contentView.backgroundColor = .white
        case .darkGray:
            contentView.backgroundColor = .darkGray
            //itemTextField.textColor = UIColor.white
        }
        itemTextField.text = item.name
    }
}

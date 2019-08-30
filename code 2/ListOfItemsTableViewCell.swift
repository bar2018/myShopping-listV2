//
//  ListOfItemsTableViewCell.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import UIKit

//protocol CellDelegate: ??? {
//    func deleteOneItem(delete row: ???)
//    func upatdeOneItem(with text: ???, at row: ???)
//}


protocol CellDelegate: class {
    func deleteOneItem(delete row: Int)
    func upatdeOneItem(with text: String, at row: Int)
}


class ListOfItemsTableViewCell: UITableViewCell {
    
    private var selectedRow: Int?
    private weak var cellDelegate: CellDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func textFieldEditChanged(_ sender: UITextField) {
        if let text = itemTextField.text, let row = selectedRow {
            cellDelegate?.upatdeOneItem(with: text, at: row)
        }
    }
    
    @IBAction func deleteItemButton(_ sender: UIButton) {
        guard let row = selectedRow else {
            return
        }
        cellDelegate?.deleteOneItem(delete: row)
    }
}


extension ListOfItemsTableViewCell {
    func setInfo(item: Item, selectedRow: Int, cellDelegate: CellDelegate) {
        self.selectedRow = selectedRow
        self.cellDelegate = cellDelegate
        
        let color = Item.Color.getcolor(for: item.colorID)
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
        }
        
        if color == .gray || color == .darkGray {
            itemTextField.textColor = .white
        } else {
            itemTextField.textColor = .black
        }
        
        itemTextField.text = item.name
    }
}

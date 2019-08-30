//
//  Item+CoreDataProperties.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var colorID: Int16

}

extension Item {
    
    enum Color: Int16 {
        case red = 1
        case orange = 2
        case green = 3
        case yellow = 4
        case blue = 5
        case brown = 6
        case purple = 7
        case cyan = 8
        case magenta = 9
        case gray = 10
        case white = 11
        case darkGray = 12
        
        static func getcolor(for colorId: Int16) -> Color {
            switch colorId {
            case 1:
                return .red
            case 2:
                return .orange
            case 3:
                return .green
            case 4:
                return .yellow
            case 5:
                return .blue
            case 6:
                return .brown
            case 7:
                return .purple
            case 8:
                return .cyan
            case 9:
                return .magenta
            case 10:
                return .gray
            case 11:
                return .white
            case 12:
                return .darkGray
            default:
                return .red
            }
        }
    }
}

    


/*
 
 enum Color: ??? {
 case red = 1
 case orange = 2
 case green = 3
 case yellow = 4
 case blue = 5
 case brown = 6
 case purple = 7
 case cyan = 8
 case magenta = 9
 case gray = 10
 case white = 11
 case darkGray = 12
 
 
 static func getColor(???) ->  {
 switch colorId {
 case 1:
 return .red
 case 2:
 return .orange
 case 3:
 return .green
 case 4:
 return .yellow
 case 5:
 return .blue
 case 6:
 return .brown
 case 7:
 return .purple
 case 8:
 return .cyan
 case 9:
 return .magenta
 case 10:
 return .gray
 case 11:
 return .white
 case 12:
 return .darkGray
 default:
 return .red
 }
 }
 }
 }
 
 
 
 
 ViewController
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
 
 */

//
//  ApplicationData.swift
//  SplitViewController
//
//  Created by Palliboina on 28/04/24.
//

import Foundation
import UIKit

enum Sections{
    case main
}

class ItemData:Identifiable{
    var id:UUID = UUID()
    var name:String
    var image:String
    var calories:Int
    var selected:Bool
    
    init(name: String, image: String, calories: Int, selected: Bool) {
        self.name = name
        self.image = image
        self.calories = calories
        self.selected = selected
    }
}

struct ApplicationData{
    var dataSource:UICollectionViewDiffableDataSource<Sections,ItemData.ID>!
    var items:[ItemData] = [] {
        didSet{
            items.sort(by: {$0.name<$1.name})
        }
    }
    
    init(){
        items.append(ItemData(name: "Bagels", image: "bagels", calories: 250, selected: false))
        items.append(ItemData(name: "Brownies", image: "brownies", calories: 466, selected: false))
        items.append(ItemData(name: "Butter", image: "butter", calories: 717, selected: false))
        items.append(ItemData(name: "Cheese", image: "cheese", calories: 402, selected: false))
        items.append(ItemData(name: "Coffee", image: "coffee", calories: 0, selected: false))
        items.append(ItemData(name: "Tomatoes", image: "tomatoes", calories: 502, selected: false))
        items.append(ItemData(name: "Potatoes", image: "potatoes", calories: 250, selected: false))
        items.append(ItemData(name: "Grapes", image: "grapes", calories: 250, selected: false))
        items.append(ItemData(name: "Brinjal", image: "brinjal", calories: 250, selected: false))
    }
}

var appData = ApplicationData()

//
//  DetailedViewController.swift
//  SplitViewController
//
//  Created by Palliboina on 27/04/24.
//

import UIKit

//assign this class to secondary scene in storyboard
class DetailedViewController: UIViewController {

    @IBOutlet weak var picrure: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var calories: UILabel!
    
    var selected:ItemData.ID!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonItem = UIBarButtonItem(title: "Menu",image:nil,primaryAction: UIAction(handler: {[unowned self] action in
            self.showcolumns()
        }),menu: nil)
        navigationItem.leftBarButtonItem = buttonItem

        if selected != nil {
            if let item = appData.items.first(where: {$0.id == selected!}) {
                picrure.image = UIImage(named: item.image)
                name.text = item.name
                calories.text = "Calories : \(item.calories)"
            }
        }else{
            if let item = appData.items.first {
                picrure.image = UIImage(named:item.image)
                name.text = item.name
                calories.text = "Calories : \(item.calories)"
            }
        }
        
    }
    
    func showcolumns(){
        if splitViewController?.isCollapsed == true {
            splitViewController?.hide(.secondary)
        }else{
            if splitViewController?.displayMode == .secondaryOnly {
                splitViewController?.show(.primary)
            }else{
                splitViewController?.hide(.primary)
            }
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

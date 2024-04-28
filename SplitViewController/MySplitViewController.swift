//
//  MySplitViewController.swift
//  SplitViewController
//
//  Created by Palliboina on 28/04/24.
//

import UIKit
//assign to split view controller in storyboard
//By default, in portrait&landscape of iphone and portrait of ipad -->secondaryOnly, in landscape of ipad -->primary and secondary
class MySplitViewController: UISplitViewController,UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        presentsWithGesture = false
        
        preferredDisplayMode = .oneBesideSecondary
        preferredSplitBehavior = .tile
        
        delegate = self
    }
    
   /* func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        //by default, when app is launched, split view controller decides to show what we said
        return .primary
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

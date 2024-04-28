//
//  FoodCollectionViewController.swift
//  SplitViewController
//
//  Created by Palliboina on 27/04/24.
//

import UIKit


//assign this class to primary scene in storyboard
class FoodCollectionViewController: UICollectionViewController {
    
    var selected:ItemData.ID!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = UICollectionLayoutListConfiguration(appearance: .sidebar)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView.collectionViewLayout = layout
        
        prepareDataSource()
        prepareSnapshot()
        
    }

    func prepareDataSource(){
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,ItemData.ID>{cell,indexPath,itemId in
            if let item = appData.items.first(where: {$0.id == itemId}) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                cell.contentConfiguration = config
            }
        }
        
        appData.dataSource = UICollectionViewDiffableDataSource<Sections,ItemData.ID>(collectionView: collectionView, cellProvider: {collectionView,indexPath,itemId in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemId)
        })
    }
    
    func prepareSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,ItemData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(appData.items.map({$0.id}))
        appData.dataSource.apply(snapshot)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let itemId = appData.dataSource.itemIdentifier(for: indexPath){
            selected = itemId
            performSegue(withIdentifier: "showSecondary", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondary" {
            if let navigator = segue.destination as? UINavigationController {  //? - forcely
                let controller = navigator.topViewController as! DetailedViewController
                controller.selected = selected
            }
        }
    }

}

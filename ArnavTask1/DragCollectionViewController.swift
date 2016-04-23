//
//  DragCollectionViewController.swift
//  ArnavTask1
//
//  Created by Mayank on 10/03/16.
//  Copyright © 2016 Mayank. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DragCollectionViewController: UICollectionViewController {
    var characterArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for i in str.characters {
            characterArray.append(String(i))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // 1
        // Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2 Return the number of items in the section
        return characterArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 3
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! AlphabetCell
    
        // Configure the cell
        cell.alphabetLabel.text = characterArray[indexPath.row]
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath,toIndexPath destinationIndexPath: NSIndexPath) {
        // swap values if sorce and destination
        let temp = characterArray[sourceIndexPath.row]
        characterArray[sourceIndexPath.row] = characterArray[destinationIndexPath.row]
        characterArray[destinationIndexPath.row] = temp
    }
}

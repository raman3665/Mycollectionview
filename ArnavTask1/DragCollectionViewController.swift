//
//  DragCollectionViewController.swift
//  ArnavTask1
//
//  Created by Mayank on 10/03/16.
//  Copyright © 2016 Mayank. All rights reserved.
//

import UIKit

private let sectionInsets = UIEdgeInsets(top: 50.0, left: 25.0, bottom: 50.0, right: 25.0)

class DragCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout, PinterestLayoutDelegate {
   
    @IBOutlet var myCollectionView: UICollectionView!
var images = ["pin1.jpg","pin2.jpg","pin3.jpg","pin4.jpg","pin5.jpg","pin1.jpg","pin2.jpg","pin3.jpg","pin4.jpg","pin5.jpg","pin1.jpg","pin2.jpg","pin3.jpg","pin4.jpg","pin5.jpg","pin1.jpg","pin2.jpg","pin3.jpg","pin4.jpg","pin5.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = myCollectionView?.collectionViewLayout as? PininterestLayout {
            layout.delegate = self
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath , withWidth width:CGFloat) -> CGFloat {
            if Int(indexPath.row%6) == 0 {
                return 200            }
            else{
                return 80
            }
        }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.imageView.image = UIImage(named: images[indexPath.row])
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath,toIndexPath destinationIndexPath: NSIndexPath) {
       
        let temp = images[sourceIndexPath.row]
        images[sourceIndexPath.row] = images[destinationIndexPath.row]
        images[destinationIndexPath.row] = temp
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
}

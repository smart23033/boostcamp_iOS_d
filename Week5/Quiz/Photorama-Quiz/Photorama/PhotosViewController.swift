	//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Febrix on 2017. 7. 31..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    var editBarButton = UIBarButtonItem()
    var deleteBarButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BarButtonItem으로 활용하세요.
//        editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(Insert Your Method))
//        deleteBarButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(Insert Your Method))
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchRecentPhotos { (photosResult) in
            OperationQueue.main.addOperation({
                switch photosResult {
                case let .success(photos):
                    print("Successfully found \(photos.count) recent photos.")
                    self.photoDataSource.photos = photos
                case let .failure(error):
                    self.photoDataSource.photos.removeAll()
                    print("Error fetching recent photos: \(error)")
                }
                self.collectionView.reloadSections([0])
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        store.fetchImageForPhoto(photo: photo) { (result) in
            OperationQueue.main.addOperation({
                let photoIndex = self.photoDataSource.photos.index(of: photo)!
                let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                
                if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                    cell.updateWithImage(image: photo.image)
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[selectedIndexPath.row]
                let destinationVC = segue.destination as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            }
        }
    }
}

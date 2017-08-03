//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Febrix on 2017. 7. 31..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    func updateWithImage(image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        }
        else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(image: nil)
    }
}

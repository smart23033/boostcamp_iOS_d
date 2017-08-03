	//
//  Photo.swift
//  Photorama
//
//  Created by Febrix on 2017. 7. 31..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class Photo {
    let title: String
    let photoID: String
    let remoteURL: URL
    let dateToken: Date
    var image: UIImage?
    
    init(title: String, photoID: String, remoteURL: URL, dateToken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateToken = dateToken
    }
}

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        //같은 photoID를 가지면 두 사진은 같다.
        return lhs.photoID == rhs.photoID
    }
}

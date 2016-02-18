//
//  Meal.swift
//  FoodTracker
//
//  Created by Anita Yeung on 2/10/16.
//  Copyright © 2016 Test. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    

//    init(coder aDecoder: NSCoder)
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        // Because photo is an optional property of Meal, use conditional cost.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeObjectForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating as! Int)
    }
    

    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}
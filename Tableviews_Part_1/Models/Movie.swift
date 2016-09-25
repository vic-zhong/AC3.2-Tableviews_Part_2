//
//  Movie.swift
//  Tableviews_Part_1
//
//  Created by Louis Tur on 9/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

internal struct Movie {
    
    internal var title: String
    internal var year: Int
    internal var genre: String
    internal var cast: [Actor]
    internal var locations: [String]
    internal var summary: String
    
    init(from data: [String : Any]) {
        // 1. Start by getting our property values and casting them..
        //    hint: use if let statements to check for values and cast them
        if let movieTitle: String = data["name"] as? String,
            let movieYear: Int = data["year"] as? Int,
            let movieGenre: String = data["genre"] as? String,
            let movieLocations: [String] = data["locations"] as? [String],
            let movieSynopsis: String = data["description"] as? String {
            
            self.title = movieTitle
            self.year = movieYear
            self.genre = movieGenre
            self.locations = movieLocations
            self.summary = movieSynopsis
            
            if let allActorNames: [String] = data["cast"] as? [String] {
                var castContainer: [Actor] = []
                
                for actorName in allActorNames {
                    castContainer.append(Actor(from: actorName))
                    
                }
                
                self.cast = castContainer
            }
            else {
                self.cast = []
            }
        }

        else {
            self = Movie()
        }
    }
    
    init() {
        self.title = ""
        self.year = 1970
        self.genre = ""
        self.cast = []
        self.locations = []
        self.summary = ""
    }
 }

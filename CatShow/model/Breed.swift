//
//  CatBreed.swift
//  CatApp
//
//  Created by beardmikle on 15.08.2023.
//

import Foundation

struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage?
    
    var description: String {
        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
       name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    init(name: String, id: String, explaination: String, temperament:String, energyLevel: Int, isHairless: Bool, image: BreedImage?) {
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.image = image
        self.isHairless = isHairless
    }
    
    static func example1() -> Breed {
        return Breed(name: "Abyssinian", id: "abys", explaination: "The Abyssinian is easy to care for, and a joy to have in your home.They’re affectionate cats and love both people and other animals.",temperament: "Active, Energetic, Independent, Intelligent, Gentle", energyLevel: 4, isHairless: false, image: nil)
    }
    
    static func example2() -> Breed {
        return Breed(name: "Cooper", id: "coop", explaination: "Testing explaination text there",temperament: "Not passionate cat", energyLevel: 33, isHairless: true, image: nil)
    }
    
}

/*
 "image": {
   "height": 1445,
   "id": "0XYvRd7oD",
   "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
   "width": 1204
 },
 */

/*
https://api.thecatapi.com/v1/images/0XYvRd7oD

 {
   "id": "0XYvRd7oD",
   "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
   "breeds": [
     {
       "weight": {
         "imperial": "7  -  10",
         "metric": "3 - 5"
       },
       "id": "abys",
       "name": "Abyssinian",
       "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
       "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
       "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
       "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
       "origin": "Egypt",
       "country_codes": "EG",
       "country_code": "EG",
       "description": "The Abyssinian is easy to care for, and a joy to have in your home.
 They’re affectionate cats and love both people and other animals.",
       "life_span": "14 - 15",
       "indoor": 0,
       "lap": 1,
       "alt_names": "",
       "adaptability": 5,
       "affection_level": 5,
       "child_friendly": 3,
       "dog_friendly": 4,
       "energy_level": 5,
       "grooming": 1,
       "health_issues": 2,
       "intelligence": 5,
       "shedding_level": 2,
       "social_needs": 5,
       "stranger_friendly": 5,
       "vocalisation": 1,
       "experimental": 0,
       "hairless": 0,
       "natural": 1,
       "rare": 0,
       "rex": 0,
       "suppressed_tail": 0,
       "short_legs": 0,
       "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
       "hypoallergenic": 0,
       "reference_image_id": "0XYvRd7oD"
     }
   ],
   "width": 1204,
   "height": 1445
 }

 
 
*/

// Another version

/*
https://api.thecatapi.com/v1/images/search

[
  {
    "id": "bu9",
    "url": "https://cdn2.thecatapi.com/images/bu9.jpg",
    "width": 1095,
    "height": 730
  }
]
 
*/

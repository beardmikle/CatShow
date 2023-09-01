import Foundation

struct BreedImage: Codable {
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
}



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

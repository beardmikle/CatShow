
import Foundation


class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fecthAllBreed()
        
    }
    
    func fecthAllBreed() {
        
        isLoading = true
        
        // TODO show error if vannot create url
//        let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=9")!
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!



        let task = URLSession.shared.dataTask(with: url) {[unowned self] data, response, error in

            self.isLoading = false
            let decoder = JSONDecoder()
            if let data = data {

                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    print(breeds)
                    self.breeds = breeds

                } catch {
                    //TODO show error
                    print(error)
                }
            }
        }

        task.resume()

        
    }
    
}


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
        errorMessage = nil
        
     let service = APIService()
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchBreeds(url: url) {[unowned self] result in
            self.isLoading = false
            switch result {
            case.failure(let error):
                self.errorMessage = error.localizedDescription
//                print(error.description)
                print(error)
            case.success(let breeds):
                self.breeds = breeds
            }
        }
        
    }
    
}

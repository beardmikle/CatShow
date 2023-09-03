//


import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]

     
    @State private var searchText: String = ""

    
    
    var body: some View {
        List {
            ForEach(breeds) { breed in
                Text(breed.name)
            }
        }
        
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}

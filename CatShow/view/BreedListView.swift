//


import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
     
    @State private var searchText: String = ""

    
    
    var body: some View {
        NavigationView {
            
            
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}

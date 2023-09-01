//
//  LoadingView.swift
//  CatApp
//
//  Created by beardmikle on 22.08.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("🐈").font(.system(size: 120))
        }
        ProgressView()
        
        VStack {
            Text("Getting server data. Please wait.")
                .foregroundColor(.gray)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

//
//  ContentView.swift
//  ListApp
//
//  Created by maho hayashi on 2025/07/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List{
                ForEach(Animal.allCases, id: \.self){ animal in
                    NavigationLink(destination:  DetailView(animal: animal)){
                        HStack{
                            Image(animal.iconName)
                            Text(animal.name)
                        }
                    }
                }
            }
            .navigationTitle("動物")
        }
    }
}

#Preview {
    ContentView()
}

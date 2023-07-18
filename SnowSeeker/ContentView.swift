//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Nicolò Perino on 17.07.23.
//

import SwiftUI

struct ContentView: View {
    let resorts:[Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchedText: String = ""
    @State private var isOrderedByDefault = true

    var body: some View {
        NavigationView {
            
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: resort.flagRatio == .rectangular ? 40 : 25, height: 25)
                            //.frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay() {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                            .padding(.horizontal, resort.flagRatio == .square ? 7.5 : 0)
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchedText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isOrderedByDefault ? "Sort by Country" : "Sort by Name") {
                        isOrderedByDefault.toggle()
                    }
                }
            }
            
            WelcomeView()
    
        }
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        var filteredResorts:[Resort]
        
        if searchedText.isEmpty {
            filteredResorts = resorts
        } else {
            filteredResorts = resorts.filter { $0.name.localizedCaseInsensitiveContains(searchedText) }
        }
        
        if isOrderedByDefault {
            return filteredResorts.sorted { $0.name < $1.name }
        } else {
            return filteredResorts.sorted { $0.country < $1.country }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

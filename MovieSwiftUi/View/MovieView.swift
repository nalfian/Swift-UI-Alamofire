//
//  ContentView.swift
//  MovieSwiftUi
//
//  Created by Unknown on 30/01/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            NowPlayView()
            UpcomingView()
            FavoriteView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}

struct NowPlayView: View {
    var body: some View {
        NavigationView {
            List(0..<15) { item in
                MovieItem(movie: "Now Play Movie Title")
            }
            .navigationBarTitle("Now Play")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .tabItem {
            VStack {
                Image(systemName: "tv.fill")
                Text("Now Play")
            }
        }.tag(0)
    }
}

struct UpcomingView: View {
    var body: some View {
        NavigationView {
            List(0..<15) { item in
                MovieItem(movie: "Upcoming Movie Title")
            }
            .navigationBarTitle("Upcoming")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .tabItem {
            VStack {
                Image(systemName: "phone.fill")
                Text("Upcoming")
            }
        }
        .tag(1)
    }
}

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            List(0..<15) { item in
                MovieItem(movie: "Favorite Movie Title")
            }
            .navigationBarTitle("Favorite")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .tabItem{
            VStack{
                Image(systemName: "bookmark.fill")
                Text("Favorite")
            }
        }
        .tag(2)
    }
}

struct MovieItem: View {
    var movie: String
    var body: some View {
        return NavigationLink(destination: MovieDetail()) {
            HStack {
               Image(systemName: "photo")
               Text(movie)
                   .padding(.leading, 9)
            }
        }
    }
}

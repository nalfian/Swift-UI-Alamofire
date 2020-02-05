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

let apiRequest = MovieClient()

struct NowPlayView: View {
    @State private var movies = [Movie]()
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                MovieItem(movie: movie)
            }
            .onAppear(perform: loadData)
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
    
    func loadData() {
        apiRequest.getNowPlaying { (movies, error) in
            if let error = error {
                print(error)
                return
            }
            self.movies = movies
        }
    }
}


struct UpcomingView: View {
    @State private var movies = [Movie]()
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                MovieItem(movie: movie)
            }
            .onAppear(perform: loadData)
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
    
    func loadData() {
        apiRequest.getUpcoming { (movies, error) in
            if let error = error {
                print(error)
                return
            }
            self.movies = movies
        }
    }
}

struct FavoriteView: View {
    @State private var movies = [Movie]()
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                MovieItem(movie: movie)
            }
            .onAppear(perform: loadData)
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
    
    func loadData() {
        apiRequest.getNowPlaying { (movies, error) in
            if let error = error {
                print(error)
                return
            }
            self.movies = movies
        }
    }
}

struct MovieItem: View {
    var movie: Movie
    var body: some View {
        return NavigationLink(destination: MovieDetail()) {
            HStack {
                Image(systemName: "photo")
                Text(movie.title)
                   .padding(.leading, 9)
            }
        }
    }
}

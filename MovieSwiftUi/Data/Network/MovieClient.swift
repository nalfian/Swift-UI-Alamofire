//
//  MovieClient.swift
//  MovieSwiftUi
//
//  Created by Unknown on 05/02/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import Foundation
import Alamofire

class MovieClient {
    
    static let apiKey = "221fbf2bcc939e0de03af53af4e1744a"
    
    enum EndPoints {
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(MovieClient.apiKey)"
        
        case getNowPlaying
        case getUpcoming
        case search(String)
        case posterImage(String)
        
        var stringValue: String{
            switch self {
            case .getNowPlaying:
                return EndPoints.base + "/movie/now_playing" + EndPoints.apiKeyParam
            case .getUpcoming:
                return EndPoints.base + "/movie/upcoming" + EndPoints.apiKeyParam
            case .search(let keyword):
                return EndPoints.base + "/search/movie" + EndPoints.apiKeyParam + "&query=\(keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""))"
            case .posterImage(let path):
                return "https://image.tmdb.org/t/p/w500/" + path
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    func getNowPlaying(completion: @escaping ([Movie], Error?) -> ()) {
        Alamofire
            .request(MovieClient.EndPoints.getNowPlaying.url)
            .response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let movie = try decoder.decode(MovieResult.self, from: data)
                    completion(movie.results, nil)
                } catch let error {
                    completion([], error)
                }
            }
    }

    func getUpcoming(completion: @escaping ([Movie], Error?) -> ()) {
        Alamofire
            .request(MovieClient.EndPoints.getUpcoming.url)
            .response { response in
                guard let data = response.data else { return }
                do {
                    let decode = JSONDecoder()
                    let movie = try decode.decode(MovieResult.self, from: data)
                    completion(movie.results, nil)
                } catch let error {
                    completion([], error)
                }
        }
    }

    func search(query: String, completion: @escaping ([Movie], Error?) -> ()) {
        Alamofire
            .request(MovieClient.EndPoints.search(query).url)
            .response { response in
                guard let data = response.data else { return }
                do {
                    let decode = JSONDecoder()
                    let movie = try decode.decode(MovieResult.self, from: data)
                    completion(movie.results, nil)
                } catch let error {
                    completion([], error)
                }
        }
    }

    func downloadImage(path: String, completion: @escaping (Data?, Error?) -> ()) {
        Alamofire
            .request(MovieClient.EndPoints.posterImage(path).url)
            .response { response in
                guard let data = response.data else { return }
                completion(data, nil)
        }
    }
    
}

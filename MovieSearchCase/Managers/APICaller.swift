//
//  APICaller.swift
//  MovieSearchCase
//
//  Created by Ertugrul Berber on 10.02.2024.
//

import Foundation
import Alamofire
import UIKit

struct Constants {
    static let API_KEY = "35e3684bbfeca8df762ca9b0c4534e73"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    weak var viewController: UIViewController?
    var loadingIndicator: UIActivityIndicatorView?

    func showLoadingIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let loadingView = UIActivityIndicatorView(style: .large)
            loadingView.center = self.viewController?.view.center ?? CGPoint(x: 0, y: 0)
            loadingView.startAnimating()
            self.viewController?.view.addSubview(loadingView)
            self.loadingIndicator = loadingView
        }
    }

    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator?.removeFromSuperview()
            self.loadingIndicator = nil
        }
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }

    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/trending/movie/day"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/trending/tv/day"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/movie/upcoming"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY, "language": "en-US", "page": 1]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/movie/popular"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY, "language": "en-US", "page": 1]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/movie/top_rated"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY, "language": "en-US", "page": 1]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let url = "\(Constants.baseURL)/3/discover/movie"
        let parameters: [String: Any] = [
            "api_key": Constants.API_KEY,
            "language": "en-US",
            "sort_by": "popularity.desc",
            "include_adult": false,
            "include_video": false,
            "page": 1,
            "with_watch_monetization_types": "flatrate"
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        showLoadingIndicator()
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let url = "\(Constants.baseURL)/3/search/movie"
        let parameters: [String: Any] = ["api_key": Constants.API_KEY, "query": query]
        
        AF.request(url, parameters: parameters).responseDecodable(of: TrendingTitleResponse.self) { response in
            switch response.result {
            case .success(let result):
                self.hideLoadingIndicator()
                completion(.success(result.results))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }

    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let url = "\(Constants.YoutubeBaseURL)"
        let parameters: [String: Any] = ["q": query, "key": Constants.YoutubeAPI_KEY]
        
        AF.request(url, parameters: parameters).responseDecodable(of: YoutubeSearchResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result.items[0]))
            case .failure(let error):
                completion(.failure(error))
                self.showAlert(title: "Internet Bağlantı Hatası", message: "")
            }
        }
    }
}

//
//  NetworkingService.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 10.01.2022.
//

import Foundation

class NetworkService {

//    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                guard let data = data else { return }
//                print(data)
//                completion(.success(data))
//            }
//        }.resume()
//    }
}

class NetworkDataFetcher {

    let networkService = NetworkService()

    func fetchEvents(urlString: String, completion: @escaping (Events?) -> Void) {
//        networkService.request(urlString: urlString) { (result) in
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            switch result {
//            case .success(let data):
//                do {
//                    print(data)
//                   // guard let inputData = result.data(using: .utf8) else { return }
//                   // guard let data = data.data(using: .utf8) else { return }
//
//                    let strData = String.init(data: data, encoding: .utf8)
//                    let places = try decoder.decode(Places.self, from: data)
//                    response(places)
//                } catch let jsonError {
//                    print("Failed to decode JSON", jsonError)
//                    response(nil)
//                }
//            case .failure(let error):
//                print("Error received requesting data: \(error.localizedDescription)")
//                response(nil)
//            }
//        }
//    }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
            do {
                let places = try decoder.decode(Events.self, from: data)
                DispatchQueue.main.async {
                    completion(places)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

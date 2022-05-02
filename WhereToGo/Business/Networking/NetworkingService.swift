//
//  NetworkingService.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 10.01.2022.
//

import Foundation

class NetworkingService {

    func fetchEvents(urlString: String, completion: @escaping (Events?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
            do {
                let events = try decoder.decode(Events.self, from: data)
                DispatchQueue.main.async {
                    completion(events)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

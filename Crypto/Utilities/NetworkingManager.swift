//
//  NetworkingManager.swift
//  Crypto
//
//  Created by Rana Ayman on 17/10/2023.
//

import Foundation
import Combine

class NetworkingManager {

    enum NetworkingError : LocalizedError {
        case badURLResponse(url:URL)
        case unkown

        var errorDescription: String? {
            switch self {
                // ctrl , command , space -> opens emojis
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unkown:return "[❗️] Unkown error occured."
            }
        }
    }

    // general Publisher get request
    static func download(url : URL) ->  AnyPublisher<Data, any Error> {
 //    let temp = URLSession -> to get the function return type from temp
        // another way to change the return type is to add eraseToAnyPublisher -> to make the return type AnyPublisher<Data, any Error>
     return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try HandleURLResponse(output: $0, url:url) }).receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    static func HandleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url:url)
        }
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

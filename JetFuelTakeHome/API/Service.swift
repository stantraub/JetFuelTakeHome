//
//  Service.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/14/20.
//

import Alamofire
import SwiftyJSON

struct Service {
    static func fetchCampaigns(completion: @escaping(Result<[Campaign], Error>) -> Void) {
        let endpoint = "https://www.plugco.in/public/take_home_sample_feed"
        
        AF.request(endpoint).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let json = try JSON(data: data)
                let decoder = JSONDecoder()
                let offers = try decoder.decode([Campaign].self, from: try json["campaigns"].rawData())
                completion(.success(offers))
            } catch let jsonErr {
                completion(.failure(DecodingError.failedToDecode(error: jsonErr)))
            }
        }
    }
    
    public enum DecodingError: Error {
        case failedToDecode(error: Error)
        
        public var description: String {
            switch self {
            case .failedToDecode(let error):
                return "Failed to decode with: \(error.localizedDescription)"
            }
        }
    }
}

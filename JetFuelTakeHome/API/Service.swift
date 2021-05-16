//
//  Service.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/14/20.
//

import Alamofire

struct Service {
    static func fetchCampaigns(completion: @escaping(Result<CampaignResponse, Error>) -> Void) {
        let endpoint = "https://www.plugco.in/public/take_home_sample_feed"
        
        AF.request(endpoint).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let campaigns = try decoder.decode(CampaignResponse.self, from: data)
                completion(.success(campaigns))
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

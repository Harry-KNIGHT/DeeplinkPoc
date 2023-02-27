//
//  DeeplinkManager.swift
//  DeeplinkPoc
//
//  Created by Elliot Knight on 13/02/2023.
//

import Foundation


class DeeplinkManager {
    enum DeeplinkTarget: Equatable {
        case home
        case details(reference: String)
    }
    
    class DeepLinkConstants {
        static let scheme = "deeplink"
        static let host = "com.numers"
        static let detailsPath = "/number"
        static let query = "id"
    }
    // path = deeplink://com.numers/number?id=5
    
    func manage(_ url: URL) -> DeeplinkTarget {
        
        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.detailsPath,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else { return .home }
            
        let query = queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
        
        guard let id = query[DeepLinkConstants.query] else { return .home }
        
        return .details(reference: id)        
    }
}


//
//  URL+SwiftInstagram.swift
//  SwiftInstagram
//
//  Created by Ander Goig on 14/12/17.
//  Copyright © 2017 Ander Goig. All rights reserved.
//

import Foundation
import UIKit

public typealias Parameters = [String: Any]

extension URL {

    /// Returns a URL constructed by appending the given parameters to self.
    public func appendingQueryParameters(_ parameters: Parameters) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map { URLQueryItem(name: $0, value: "\($1)") }
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    /// Modifies the current URL by appending the given parameters.
    public mutating func appendQueryParameters(_ parameters: Parameters) {
        self = appendingQueryParameters(parameters)
    }
}

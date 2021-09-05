//
//  Constants.swift
//  Constants
//
//  Created by SEAN BLAKE on 9/4/21.
//

import Foundation

// Reference
// https://newsapi.org/v2/top-headlines?country=us&apiKey=bf523f196f5a40febc1afb7888abbb4b
enum Constants {
    static let baseURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey"
    static let country = "jp"
    static let APIKEY = "bf523f196f5a40febc1afb7888abbb4b"
    static var endPoint: String {
        self.baseURL + "?country=" + self.country + "&apiKey=" + self.APIKEY
    }
}

//
//  String+Extension.swift
//  String+Extension
//
//  Created by SEAN BLAKE on 9/5/21.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with: "", options: .regularExpression, range: nil)
    }
}

//
//  String+Extension.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 11.10.2021.
//

import Foundation

extension String {
    func convertDateFromat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let date = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = "MMM dd yyyy h:mm a"
        let newDate = dateFormatter.string(from: date!)
        return newDate
    }
}

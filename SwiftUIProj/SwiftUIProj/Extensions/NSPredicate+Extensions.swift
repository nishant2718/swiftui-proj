//
//  NSPredicate+Extensions.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/27/23.
//

import Foundation

extension NSPredicate {
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
}

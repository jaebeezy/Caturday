//
//  Tabs.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/17/22.
//

import Foundation

enum Tabs: Int, CaseIterable {
    case main
    case details
    case etc
    
    var title: String {
        switch self {
        case .main:
            return "Main"
        case .details:
            return "Details"
        case .etc:
            return "Etc"
        }
    }
}

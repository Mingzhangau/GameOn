//
//  Teams.swift
//  GameOn
//
//  Created by Ming Zhang on 11/1/2023.
//

import Foundation

struct Team: Identifiable, Equatable {
    var id: String
    var isInOptions: Bool

    var name: String { id }
}

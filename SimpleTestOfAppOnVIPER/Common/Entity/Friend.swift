//
//  Friend.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

struct Friend {
    var name: String
    var age: Int
}

extension Friend: Equatable {
    static func ==(lhs: Friend, rhs: Friend) -> Bool {
        return (lhs.name == rhs.name && lhs.age == rhs.age) ? true : false
    }
}

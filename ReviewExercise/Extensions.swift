//
//  Extensions.swift
//  ReviewExercise
//
//  Created by Vo Minh Don on 9/28/21.
//

import Foundation

extension String {
    func trim() -> String
    {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

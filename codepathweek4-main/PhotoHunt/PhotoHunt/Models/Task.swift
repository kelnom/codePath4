//
//  Task.swift
//  PhotoHunt
//
//  Created by kelechi Nnorom on 3/17/23.
//

import Foundation
import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Collect a waterfall picture",
                 description: "For you assignment today look for a waterfall picture and write facts about it"),
            Task(title: "Find flowers in California",
                 description: "Find a pic of a field of flowers in California."),
            Task(title: "Find facts about Niagara Falls",
                 description: "Write facts about the formation of the Niagara Falls")
        ]
    }
}


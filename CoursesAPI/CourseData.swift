//
//  CourseData.swift
//  CoursesAPI
//
//  Created by ramil on 29.11.2021.
//

import Foundation

struct CourseData: Decodable, Identifiable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let numberOfLessons: Int
}

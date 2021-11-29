//
//  API.swift
//  CoursesAPI
//
//  Created by ramil on 29.11.2021.
//

import Foundation

class API {
    
    let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses")!
    
    func fetchData(completion: @escaping ([CourseData]) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            let courses = try! JSONDecoder().decode([CourseData].self, from: data)
            
            DispatchQueue.main.async {
                completion(courses)
            }
            
        }.resume()
    }
}

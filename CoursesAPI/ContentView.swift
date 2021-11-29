//
//  ContentView.swift
//  CoursesAPI
//
//  Created by ramil on 29.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var courses: [CourseData] = []
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(courses) { course in
                    Link(destination: URL(string: course.link)!) {
                        VStack {
                            AsyncImage(
                                url: URL(string: course.imageUrl),
                                content: { image in
                                    image.resizable()
                                        .scaledToFit()
                                },
                                placeholder: { ProgressView() }
                            )
                            VStack {
                                HStack {
                                    Text(course.name)
                                        .foregroundColor(.primary)
                                        .font(.caption)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(course.numberOfLessons) lessons")
                                        .foregroundColor(.secondary)
                                        .font(.caption2)
                                    Spacer()
                                }
                            }.padding()
                        }
                    }
                }
            }.navigationTitle(Text("Couses"))
        }
        .onAppear {
            API().fetchData { data in
                self.courses = data
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

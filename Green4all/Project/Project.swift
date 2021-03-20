//
//  Project.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import Foundation

// La structure projet
struct Project :Identifiable {
    
    let id:UUID = UUID()
    var title:String
    var description_project:String
    var budget: Int
    var picture: String
    var video:String?
    var created_date = Date()
    var finished_date: Date
    var category: CategoryProject
}

// EXTENSIONS
extension Project {
    static var project1:Project = Project(title: "Projet 1", description_project: "Description 1",
        budget: 12000,
        picture: "icon_project1",
        video: "video_project1",
        finished_date: Date(),
        category: CategoryProject.energie
    )

    static var project2:Project = Project(title: "Projet 2", description_project: "Description 2",
        budget: 12000,
        picture: "icon_project2",
        video: "video_project2",
        finished_date: Date(),
        category: CategoryProject.batiment
    )

    static var project3:Project = Project(title: "Projet 3", description_project: "Description 3",
        budget: 12000,
        picture: "icon_project3",
        video: "video_project3",
        finished_date: Date(),
        category: CategoryProject.energie
    )

    static var project4:Project = Project(title: "Projet 4", description_project: "Description 4",
        budget: 12000,
        picture: "icon_project4",
        video: "video_project4",
        finished_date: Date(),
        category: CategoryProject.transport
    )

    static var listProjects: [Project] = [project1, project2, project3, project4]
}

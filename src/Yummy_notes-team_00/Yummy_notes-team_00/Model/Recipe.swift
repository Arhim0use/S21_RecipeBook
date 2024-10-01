//
//  Recipe.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 30.07.2024.
//

import Foundation
import SwiftUI


struct RecipeFile: Hashable, Codable {
  var name: String
  var filename: String
}

struct Recipe: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var tags: Set<String>
  private var imageUrl: String
  var image: Image { Image(imageUrl) }
  var ingredients: [Ingredient]
  var steps: [Step]
    
  struct Ingredient: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var quantity: String
  }
    
  struct Step: Codable, Hashable, Identifiable {
    var id: Int
    var step: String
  }
}

enum RecipeError: Error {
  case notFoundFile(String)
  case cantLoadFile(String)
  case cantReadFile(String)
  case fileIsEmpty
}


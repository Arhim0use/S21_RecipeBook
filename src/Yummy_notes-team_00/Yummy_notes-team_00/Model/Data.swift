//
//  Data.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 30.07.2024.
//

import Foundation


class ModelData {
  var recipes: (success: [Recipe],failure: [RecipeError]) = RecipeData().load()
}

fileprivate class RecipeData {
  
  func load() -> (success: [Recipe],failure: [RecipeError]) {

    let recipeFilesResult: Result<[RecipeFile], RecipeError> = getData(fileName: "recipes.json")
    
    switch recipeFilesResult {
    case .success(let files):
      return parceRecipes(files)
    case .failure(let error):
      print("\n\n\n\n\(error)\n")
      return ([], [error])
    }
  }
  
  private func getData<T: Decodable>(fileName: String) -> Result<T, RecipeError> {
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
      return .failure(.notFoundFile(fileName))
    }
    
    let data: Data
    do {
    data = try Data(contentsOf: fileURL)
    } catch {
      return .failure(.cantLoadFile("\(fileURL.lastPathComponent)"))
    }

    do {
      let decoder = JSONDecoder()
      let decodedData = try decoder.decode(T.self, from: data)
      return .success(decodedData)
    } catch {
      print(error)
      return .failure(.cantReadFile(fileURL.lastPathComponent))
    }
  }
  
  private func parceRecipes(_ files: ([RecipeFile])) -> (success: [Recipe], failure: [RecipeError]) {
    var recipes: [Recipe] = []
    var errors: [RecipeError] = []
    
    for file in files {
      let loadedRecipesResult: Result<[Recipe], RecipeError> = getData(fileName: file.filename)
      
      switch loadedRecipesResult {
      case .success(let loadedRecipes):
        recipes.append(contentsOf: loadedRecipes)
      case .failure(let error):
        print(error)
        errors.append(error)
      }
    }
    
    return (recipes, errors)
  }

}

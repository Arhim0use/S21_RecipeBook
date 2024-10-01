//
//  Ingredients.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 01.08.2024.
//

import SwiftUI

struct Ingredients: View {
  var ingredients: [Recipe.Ingredient]
  var body: some View {
    VStack {
      Text("Ингридиенты:").font(.title2)
        .frame(maxWidth: .infinity, alignment: .topLeading)
      ForEach(ingredients) { ingredient in
        HStack {
          Text(ingredient.name).font(.body)
          Spacer()
          Text(ingredient.quantity).font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
      }
    }
  }
}

struct Ingredients_Previews: PreviewProvider {
  static var previews: some View {
    let data = ModelData().recipes.success
    Ingredients(ingredients: data[0].ingredients)
  }
}

//
//  NoteCard.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 01.08.2024.
//

import SwiftUI

struct NoteCard: View {
  var recipe: Recipe
  var body: some View {
    HStack {
      CircleImage(recipe.image, frame: 100)
        .cornerRadius(25)
      Text(recipe.name)
        .font(.title2)
        .fontDesign(.serif)
        .frame(width: 200, height: 60, alignment: .leading)
        
    }
  }
}

struct NoteCard_Previews: PreviewProvider {
  static var previews: some View {
    let data = ModelData().recipes.success
    NoteCard(recipe: data[2])
  }
}

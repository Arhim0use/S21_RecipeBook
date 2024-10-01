//
//  NoteDescription.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 29.07.2024.
//

import SwiftUI

struct NoteDescription: View {
  var data: Recipe
  
  var body: some View {
      
    ScrollView {
      NoteHead(image: data.image)
      
      Text(data.name).font(.title).fontDesign(.serif)
      Text(data.tags.description).font(.caption).fontDesign(.serif).foregroundColor(.gray)
        
      Divider()

      VStack {
        Ingredients(ingredients: data.ingredients)
        Steps(steps: data.steps)
      }
      .navigationTitle(data.name).fontDesign(.serif)
      .padding()
    }
    .padding()
  }
}

struct NoteDescription_Previews: PreviewProvider {
  static var previews: some View {
    let data = ModelData().recipes.success
    NoteDescription(data: data[4])
  }
}

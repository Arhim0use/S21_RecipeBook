//
//  NoteList.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 29.07.2024.
//

import SwiftUI

struct NoteList: View {
  var recipes = ModelData().recipes
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(recipes.success, id: \.self) { recipe in
            NavigationLink {
              NoteDescription(data: recipe)
            } label: {
              NoteCard(recipe: recipe)
            }
          }
        }.navigationTitle("Книга рецептов")
      }
    }
    
  }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList()
    }
}

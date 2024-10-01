//
//  Steps.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 01.08.2024.
//

import SwiftUI

struct Steps: View {
  var steps: [Recipe.Step]
  var body: some View {
    if steps.isEmpty {
      Label("", systemImage: "questionmark.folder")
    } else {
      VStack {
        ExtractedView(steps: steps)
        ForEach(steps) { step in
          HStack {
            Text("\(step.step)\n").font(.body)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
    }
  }
}

struct Steps_Previews: PreviewProvider {
    static var previews: some View {
      let steps = ModelData().recipes.success[0].steps
      Steps(steps: steps)
    }
}

struct ExtractedView: View {
  @State private var showDetailedSteps = false
  var steps: [Recipe.Step]
  var body: some View {
    HStack {
      Text("Приготовление:").font(.title2)
      Button(action: { showDetailedSteps.toggle() },
             label: { Label("подробнее", systemImage: "doc.richtext") })
      .sheet(isPresented: $showDetailedSteps) {
        StepsTabVew(steps: steps)
      }
      .frame(maxWidth: .infinity, alignment: .topLeading)
    }
  }
}

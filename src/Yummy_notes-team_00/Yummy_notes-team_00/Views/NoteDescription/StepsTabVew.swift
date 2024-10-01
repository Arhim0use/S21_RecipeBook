//
//  StepsTabvVew.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 02.08.2024.
//

import SwiftUI

struct StepsTabVew: View {
  var steps: [Recipe.Step]
  @State private var selectedStep: Int = 0

  var body: some View {
    
    NavigationView {
      VStack {
        TabView(selection: $selectedStep) {
          ForEach(steps, id: \.self) { step in

            NavigationStack {
              Text("\(step.step)")
                .padding()
            } .tabItem {
              Text("\(step.id)")
            }
            .tag(step.id)
            .navigationTitle("Шаг \(step.id):")
          }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        TabVewNavigationsButtons(selectedStep: $selectedStep, maxSteps: steps.count)
      }
    }
    
  }
}

struct StepsTabvVew_Previews: PreviewProvider {
    static var previews: some View {
      let steps = ModelData().recipes.success[0].steps
        StepsTabVew(steps: steps)
    }
}

struct TabVewNavigationsButtons: View {
  @Binding var selectedStep: Int
  var maxSteps: Int
  var body: some View {
    HStack {
      Button(action: {
        selectedStep = selectedStep - 1 > -1 ? selectedStep - 1 : selectedStep
      }, label: {
        Label("Prev", systemImage: "arrowshape.left.fill")
      }
      )
      Spacer()
      Button(action: {
        selectedStep = selectedStep < maxSteps ? selectedStep + 1 : selectedStep
      }, label: {
        Label("Next", systemImage: "arrowshape.right.fill")
      }
      )
    }
    .padding()
    .navigationTitle("HStack Buttons")
  }
}

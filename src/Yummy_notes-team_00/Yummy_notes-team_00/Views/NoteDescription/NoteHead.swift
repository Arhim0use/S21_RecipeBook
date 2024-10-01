//
//  NoteHead.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 01.08.2024.
//

import SwiftUI

struct NoteHead: View {
  var image: Image
  var body: some View {
    ZStack {
      image
      .resizable()
      .frame(width: 400, height: 400)
      .blur(radius: 6)
      .grayscale(0.4)
        
      CircleImage(image)
    }
  }
}

struct NoteHead_Previews: PreviewProvider {
  static var previews: some View {
    NoteHead(image: Image("napoleon"))
  }
}

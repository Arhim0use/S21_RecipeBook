//
//  CircleImage.swift
//  Yummy_notes-team_00
//
//  Created by Felecia Galladon on 29.07.2024.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  var frame: CGFloat
  var body: some View {
    image
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: frame, height: frame)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.primary, lineWidth: 0.2) )
      .shadow(radius: 10)
      
  }
  
  init(_ image: Image, frame: CGFloat = 400) {
    self.image = image
    self.frame = frame
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
//    CircleImage(image: Image("plov"))
        CircleImage(Image("napoleon"))
//    CircleImage(image: Image("bourbon-molasses-butter"))
  }
}

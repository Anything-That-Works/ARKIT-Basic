//
//  ContentView.swift
//  ARKIT Basic
//
//  Created by Promal on 10/10/23.
//

import SwiftUI

struct ContentView: View {
  //MARK: Variable
  @State private var colors: [Color] = [.red, .blue, .orange]
  
  //MARK: View
  var body: some View {
    CustomARViewRepresentable()
      .ignoresSafeArea()
      .overlay(alignment: .bottom) {
        ScrollView(.horizontal) {
          HStack {
            Button {
              //MARK: Action
              ARManager.shared.actionStream.send(.removeAllAnchors)
            } label: {
              Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(10)
            }
            
            ForEach(colors, id: \.self) {color in
              Button {
                //MARK: Action
                ARManager.shared.actionStream.send(.placeBlock(color: color))
              } label: {
                color
                  .frame(width: 50, height: 50)
                  .padding()
                  .background(.regularMaterial)
                  .cornerRadius(10)
              }
            }
          }
        }
      }
  }
}

#Preview {
  ContentView()
}

//
//  CustomARViewRepresentable.swift
//  ARKIT Basic
//
//  Created by Promal on 15/10/23.
//

import Foundation
import SwiftUI


struct CustomARViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> CustomARView {
    return CustomARView()
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    //MARK: Not much to do here
  }
  
}

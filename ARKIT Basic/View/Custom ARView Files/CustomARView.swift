//
//  CustomARView.swift
//  ARKIT Basic
//
//  Created by Promal on 15/10/23.
//

import ARKit
import RealityKit
import SwiftUI

class CustomARView: ARView{
  
  required init(frame frameRect: CGRect) {
    super.init(frame: frameRect)
  }
  
  dynamic required init?(coder decoder: NSCoder) {
    fatalError("init(coder:) was not implemented")
  }
  
  convenience init() {
    self.init(frame: UIScreen.main.bounds)
  }
}

//
//  CustomARView.swift
//  ARKIT Basic
//
//  Created by Promal on 15/10/23.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView{
  
  required init(frame frameRect: CGRect) {
    super.init(frame: frameRect)
  }
  
  dynamic required init?(coder decoder: NSCoder) {
    fatalError("init(coder:) was not implemented")
  }
  
  convenience init() {
    self.init(frame: UIScreen.main.bounds)
    
    subscribedToActionStream()
  }
  
  private var cancelables: Set<AnyCancellable> = []
  func subscribedToActionStream() {
    ARManager.shared
      .actionStream
      .sink { [weak self] action in
        switch action {
        case .placeBlock(let color):
          self?.placeBlock(ofColor: color)
        case .removeAllAnchors:
          self?.scene.anchors.removeAll()
        }
      }
      .store(in: &cancelables)
  }
  
  
  func configurationExample() {
    //MARK: Tracking the device relative to environment
    let configuration = ARWorldTrackingConfiguration()
    session.run(configuration)
    
    //MARK: Tracking Global coordinates (Not supported in all regions)
    let _ = ARGeoTrackingConfiguration()
    
    //MARK: Tracking face in the scene
    let _ = ARFaceTrackingConfiguration()
    
    //MARK: Tracking Body in the scene
    let _ = ARBodyTrackingConfiguration()
    
  }
  
  func anchorExample() {
    //MARK: Attach Anchor at specific coordinates in the Device centered coordinate system
    let coordinateAnchor = AnchorEntity(world: .zero)
    
    //MARK: Attach anchor to detached space
    let _ = AnchorEntity(plane: .horizontal)
    let _ = AnchorEntity(plane: .vertical)
    
    //MARK: Anchor to track body part
    let _ = AnchorEntity(.face)
    
    //MARK: Anchor to track image/marker/visual code
    let _ = AnchorEntity(.image(group: "group", name: "name"))
    
    //MARK: Adding Anchor to scene
    scene.addAnchor(coordinateAnchor)
  }
  
  func entityxample() {
    //MARK: Loading Entity from usdz file
    let _ = try? Entity.load(named: "usdz filename")
    
    //MARK: Loading Entity from Reality file
    let _ = try? Entity.load(named: "reality filename")
    
    //MARK: Generate Entity with code
    let box = MeshResource.generateBox(size: 4)
    let entity = ModelEntity(mesh: box)
    
    
    //MARK: Adding Entity to an anchor
    let anchor = AnchorEntity()
    anchor.addChild(entity)
    
  }
  
  func placeBlock(ofColor color: Color) {
    let block = MeshResource.generateBox(size: 1)
    let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
    let entity = ModelEntity(mesh: block, materials: [material])
    
    let anchor = AnchorEntity(plane: .horizontal)
    anchor.addChild(entity)
    scene.addAnchor(anchor)
  }
}

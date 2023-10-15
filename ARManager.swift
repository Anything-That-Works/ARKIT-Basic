//
//  ARManager.swift
//  ARKIT Basic
//
//  Created by Promal on 15/10/23.
//

import Combine

class ARManager {
  //MARK: Making the class singleton
  static let shared = ARManager()
  private init() { }
  
  var actionStream = PassthroughSubject<ARAction, Never>()
}

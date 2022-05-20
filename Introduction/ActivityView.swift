//
//  ActivityView.swift
//  Introduction
//
//  Created by Канат Сейтов on 20.05.2022.
//

import SwiftUI



struct ActivityView: UIViewControllerRepresentable{
  
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let viewController = UIActivityViewController(activityItems: self.activityItems, applicationActivities: self.applicationActivities)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
    
    
}

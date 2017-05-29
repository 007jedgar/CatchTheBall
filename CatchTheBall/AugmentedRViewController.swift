//
//  AugmentedRViewController.swift
//  CatchTheBall
//
//  Created by Jonathan Edgar on 5/28/17.
//  Copyright © 2017 Jonathan Edgar. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import HDAugmentedReality

class AugmentedRViewController: ARViewController, ARDataSource {
    
    let arViewController = AugmentedRViewController()
    arViewController.dataSource = self
    self.present(arViewController, animated: true, completion: nil)

    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        //let annotationView =  AugmentedRViewController(annotation: viewForAnnotation)
        let testAnnotationView = AugmentedRView(annotation: viewForAnnotation)
        return testAnnotationView
    }
}

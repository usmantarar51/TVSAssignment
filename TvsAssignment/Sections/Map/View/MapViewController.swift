//
//  MapViewController.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MapViewController: BaseViewController {
    // MARK: - IBOutlet

    @IBOutlet var mapView: MKMapView!

    // MARK: - Properties

    var presenter: MapPresentation?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func setupAppearance() {
        title = "Locations"
        colorScheme = .none
    }

    // MARK: - Private Methods
}

// MARK: MapView

extension MapViewController: MapView {
    func showLocations(locations: [CityModel]) {
        mapView.addAnnotations(locations)
        mapView.delegate = self

        let lat: CLLocationDegrees = 15
        let lon: CLLocationDegrees = 15
        let span = MKCoordinateSpan(latitudeDelta: lat, longitudeDelta: lon)

        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mapView.setRegion(region, animated: false)
    }
}

// MARK: MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        if annotationView == nil {
            let annotation = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
            annotation.image = UIImage(named: "annotation")
            annotationView = annotation
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? CityModel {
            self.mapView.deselectAnnotation(annotation, animated: true)
            presenter?.locationDidTapped(model: annotation)
        }
    }
}

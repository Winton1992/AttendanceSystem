//
//  ViewController.swift
//  AttendanceSystem
//
//  Created by LIWEIJIE on 12/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import CoreBluetooth
import CoreLocation
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    let beaconUUID = UUID(uuidString: "39ED98FF-2900-441A-802F-9C398FC199D3")!
    let locationManager = CLLocationManager()
    let identifier = "com.winton.myDeviceRegion"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupUserNotificationCenter()
        startScanning()
    }
    
    private func setupUserNotificationCenter() {
        // Request Permission Grant
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            print("Permission granted? \(granted)")
        }
        UNUserNotificationCenter.current().delegate = self
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    func startScanning() {
        let constraint = CLBeaconIdentityConstraint(uuid: beaconUUID, major: 1, minor: 1)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: identifier)
        self.locationManager.startMonitoring(for: beaconRegion)
    }
}


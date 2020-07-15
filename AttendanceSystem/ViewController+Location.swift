//
//  ViewController+Location.swift
//  AttendanceSystem
//
//  Created by LIWEIJIE on 13/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//

import CoreLocation
import Foundation

extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        locationManager.requestState(for: region)
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == .inside {
            postEnterNotification()
        } else if state == .outside {
            postExitNotification()
        }
    }
}

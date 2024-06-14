//
//  ViewController.swift
//  GPS_Practice
//
//  Created by Jinyoung Leem on 5/19/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    private var locationManager : CLLocationManager?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserLocation()
    }
    
    func getUserLocation(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        //authenticationChecker()
        
    }
    
    func authenticationChecker() {
        let access = CLLocationManager.authorizationStatus()
        
        if ((access == .restricted) || (access == .denied)){
            print("Access Denied")
// 만약 access 거절을 누른 상태에서 앱을 재실행 할 경우 권한을 다시 묻게 하기 위해 아래 instruction 을 넣었는데 왜 작동하지 않을까?
// -> 이유는 애플의 보안 정책 때문에, 권한을 다시 물을 수 없고, setting 을 통해 유저가 직접 바꿔야 한다!
            locationManager?.requestAlwaysAuthorization()


        } else if ((access == .authorizedAlways) || (access == .authorizedWhenInUse)){
            locationManager?.startUpdatingLocation()
            locationManager?.allowsBackgroundLocationUpdates = true
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authenticationChecker()
    }
}



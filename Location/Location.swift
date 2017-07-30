//
//  ViewController.swift
//  Location
//
//  Created by Ryan on 2017/7/17.
//  Copyright © 2017年 Ryan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        //设置定位模式
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        locationManager.distanceFilter = 5
        ////发送授权申请
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled())
        {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let targetLocation = CLLocation(latitude: 52.105526, longitude: 51.141151)
        //获取最新的坐标
        let currLocation:CLLocation = locations.last!
        print(currLocation)
        let distance:CLLocationDistance = currLocation.distance(from: targetLocation)
        //获取经度
        label1.text = "经度: \(currLocation.coordinate.longitude)"
        print(currLocation.coordinate.longitude)
        //获取纬度
        label2.text = "纬度：\(currLocation.coordinate.latitude)"
        //获取距离
        label3.text = "距离: \(distance)"
        //        //获取海拔
        //        newLabel.text = "海拔：\(currLocation.altitude)"
        //        //获取水平精度
        //        newLabel.text = "水平精度：\(currLocation.horizontalAccuracy)"
        //        //获取垂直精度
        //       newLabel.text = "垂直精度：\(currLocation.verticalAccuracy)"
        //        //获取方向
        //        newLabel.text = "方向：\(currLocation.course)"
        //        //获取速度
        //        newLabel.text = "速度：\(currLocation.speed)"  
    }  
}

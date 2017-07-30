//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ryan on 2017/6/22.
//  Copyright © 2017年 Ryan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let url = "http://localhost:8080/MyServe/data.jsp"
//        
//        if let jsonData = NSData(contentsOf:NSURL(string: url)!as URL) {
//            if let userArray = try? JSONSerialization.jsonObject(with: jsonData as Data,
//                                                                 options: .allowFragments) as? [[String: AnyObject]],
//                let phones = userArray?[0]["phones"] as? [[String: AnyObject]],
//                let number = phones[0]["number"] as? String {
//                // 找到电话号码
//                print("第一个联系人的第一个电话号码：",number)
//            }
//        }
        
            //创建URL对象
            let urlString = "http://localhost:8080/MyServe/userdata.json"
            let url = URL(string:urlString)
            //创建请求对象
            let request = URLRequest(url: url!)
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request,
                completionHandler: {(data, response, error) -> Void in
                if error != nil{
                    print(error.debugDescription)
                }else{
                    let str = String(data: data!, encoding: String.Encoding.utf8)
                    print(str!)
                    let userArray = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                    let uname = userArray?["username"]
                    print("userdata：\(uname!)")
                }
            }) as URLSessionTask
            
            //使用resume方法启动任务
            dataTask.resume()
        

        
//        let url = URL(string: "http://localhost:8080/MyServe/data.jsp")
//        
//        let request = URLRequest(url:url!)
//        
//        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
//            print("fitst")
//            if error != nil{
//                print(error!)
//            }else{
//                guard let data = data else {
//                    print ("data was nil?")
//                    return
//                }
//                print("second")
//                if let json = try? JSON(data:data){
//                    print("forth")
//                    print("jason 文件:", json)
//                    if let username = json[0]["username"].string{
//                        print("用户名: ", username)
//                    }
//                }
//            }
//        }) as URLSessionTask
//        dataTask.resume()
//    
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
//    @IBAction func login() {
//        let url = URL(string: "http://localhost:8080/MyServe/data.jsp")
//        
//        let request = URLRequest(url:url!)
//        
//        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
//            if error != nil{
//                print(error!)
//            }else{
//                do{
//                    let json = try JSON(data:data!)
//                    print(json)
//                    if let username = json[0]["username"].string{
//                        print("用户名: ", username)
//                    }
//                }catch{}
//            }
//        }) as URLSessionTask
//        dataTask.resume()
//    }
//    
}


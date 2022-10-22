//
//  ViewController.swift
//  a902HelloAPI
//
//  Created by 申潤五 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI()
        
    }

    func callAPI(){
        APIModel.share.queryRandomUser { rowData, respError in
            if let respError = respError{
                print(respError.localizedDescription)
                return
            }
            
            if let data = rowData as? Data{
                
                let str = String(decoding: data, as: UTF8.self)
                print("===============")
                print(str)
                print("===============")
            }
            
            //我們要處理 JSON
            
        }
    }

}


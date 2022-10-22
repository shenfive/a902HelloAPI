//
//  ViewController.swift
//  a902HelloAPI
//
//  Created by 申潤五 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headContainer: UIView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabe: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
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


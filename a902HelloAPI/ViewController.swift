//
//  ViewController.swift
//  a902HelloAPI
//
//  Created by 申潤五 on 2022/10/22.
//

import UIKit
import SwiftyJSON
import Kingfisher

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headerImage.clipsToBounds = true
        headerImage.backgroundColor = UIColor.white
        headerImage.layer.cornerRadius = headerImage.frame.height / 2
        headerImage.layer.borderColor = UIColor.red.cgColor
        headerImage.layer.borderWidth = 5
        
        headContainer.backgroundColor = UIColor.clear
        
        headContainer.clipsToBounds = false
        headContainer.layer.shadowRadius = 20
        headContainer.layer.shadowOpacity = 0.6
        headContainer.layer.shadowColor = UIColor.gray.cgColor
        headContainer.layer.shadowOffset = CGSize(width: 20, height: 20)

    }
    
    
    

    func callAPI(){
        APIModel.share.queryRandomUser { rowData, respError in
            if let respError = respError{
                print(respError.localizedDescription)
                return
            }
            
            if let data = rowData as? Data{
                do{
                    let json = try JSON(data:data)
                    let imageString = json["results"][0]["picture"]["large"].stringValue
                    self.headerImage.kf.setImage(with: URL(string: imageString))
                    
                    let nameString = json["results"][0]["name"]["title"].stringValue + ". " + json["results"][0]["name"]["first"].stringValue + " " + json["results"][0]["name"]["last"].stringValue
                    self.nameLabel.text = nameString
                    
                    self.emailLabel.text = json["results"][0]["email"].stringValue
                    self.phoneLabe.text = json["results"][0]["phone"].stringValue
                    
                }catch{
                    
                }
            }
        }
    }

}


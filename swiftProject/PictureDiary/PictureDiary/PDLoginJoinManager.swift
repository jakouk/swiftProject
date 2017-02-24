//
//  PDLoginJoinManager.swift
//  PictureDiary
//
//  Created by jakouk on 2017. 2. 23..
//  Copyright © 2017년 jakouk. All rights reserved.
//
import UIKit

import Alamofire
import SDWebImage


class PDLoginJoinManager {
    
    class func requestJoinData(userId:String, userPassword:String, userName:String, userProfile:UIImage?, updateFinishDataClosure:@escaping ()->Void) {
        
        let requestUrl = RequestObject.reqeustURL(requestType: RequestType.join, param: nil, postNumber: nil)!
        let bodyParam: Dictionary<String,String> = [ParameterType.username.rawValue:userName, ParameterType.email.rawValue:userId, ParameterType.password.rawValue:userPassword]
        
        
        
        print("bodyParam = \(bodyParam)")
        
        var profileImageData = UIImagePNGRepresentation(UIImage(named: "Nameicon")!)!
        
        if let userImage = userProfile {
            profileImageData = UIImagePNGRepresentation(userImage)!
        }
        
        print("requestURL = \(requestUrl)")
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(profileImageData, withName: "profile")
            
            for (key, value) in bodyParam {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to: requestUrl) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                    
                    // let userInfo = UserInfo.info
                    
                    print("responseData = \(response.data)")
                    print("responseDescription = \(response.description)")
                    
                    print(response)
                    print("가입성공")
                    
                    updateFinishDataClosure()
                }
            case .failure(let encodingError):
                print(encodingError)
                print("가입 실패")
            }
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

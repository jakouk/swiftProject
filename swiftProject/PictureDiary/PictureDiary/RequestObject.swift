//
//  RequestObjer.swift
//  PictureDiary
//
//  Created by jakouk on 2017. 2. 23..
//  Copyright © 2017년 jakouk. All rights reserved.
//

import UIKit

enum RequestType {
    case login, join, mainData, readData, searchData, write, logout, userInfo, readModify, delete
}

enum ParameterType: String {
    case email = "email",
        username = "username",
        password = "password",
        profile_img = "profile_img",
        title = "title",
        content = "content"
}


class RequestObject{
    
    class public func reqeustURL( requestType type:RequestType, param paramDictionary:Dictionary<String,String>?, postNumber postData:String? ) -> URL? {
        
        var urlString = "http://team1photodiary.ap-northeast-2.elasticbeanstalk.com/"
        
        switch type {
        case RequestType.join:
            urlString.append("member/create")
        case RequestType.login:
            urlString.append("member/login")
        case RequestType.mainData:
            urlString.append("post")
        case RequestType.readData:
            urlString.append("post")
        case RequestType.userInfo:
            urlString.append("member/detail")
        case RequestType.logout:
            urlString.append("member/logout")
        case RequestType.searchData:
            urlString.append("post/search")
        case RequestType.readModify:
            urlString.append("post")
        case RequestType.delete:
            urlString.append("post")
        case RequestType.write:
            urlString.append("post")
        }
        
        if let param = paramDictionary {
            
            var paramString = "?"
            for (key,value) in param {
                paramString.append(key+"="+value+"&")
            }
            urlString.append(paramString)
        }
        
        if let postNumber = postData {
            urlString.append(postNumber)
        }
        
        return URL(string: urlString)
        
    }
    
    class public func requstURL( url:URL, httpMehotd:String) -> URLRequest {
        
        var urlRequest: URLRequest = URLRequest(url: url)
        
        if httpMehotd != "POST" {
            urlRequest.httpMethod = httpMehotd
        }
        
        return urlRequest
    }
    
    class public func urlReqeustToken( urlRequest:URLRequest ) {
        
        var addToeknRequest = urlRequest
        let userInfo = UserInfo.info
        var token:String = "Token "
        
        if let userToken = userInfo.userToken {
            token.append(userToken)
        }
        addToeknRequest.addValue(token, forHTTPHeaderField: "X-Authorization")
    }
}

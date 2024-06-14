//
//  FeedUploadModel.swift
//  Section4_LoginPage
//
//  Created by Jinyoung Leem on 5/7/24.
//

struct FeeduploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
    
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}

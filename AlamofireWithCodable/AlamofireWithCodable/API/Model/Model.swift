//
//  Model.swift
//  pangyogreat
//
//  Created by wani.kim on 2017. 11. 15..
//  Copyright © 2017년 wani.kim. All rights reserved.
//

import Foundation

enum Model {}

extension Model {
    struct Restaurant: Codable {
        let phoneNumber: String
        let restaurantName: String
        let address: String
        let price: Int
        let restaurantId: Int
        
        enum CodingKeys: String, CodingKey {
            case phoneNumber = "phoneNumber"
            case restaurantName = "restaurantName"
            case address = "address"
            case price = "price"
            case restaurantId = "restaurantId"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber) ?? ""
            self.restaurantName = try values.decodeIfPresent(String.self, forKey: .restaurantName) ?? ""
            self.address = try values.decodeIfPresent(String.self, forKey: .address) ?? ""
            self.price = try values.decodeIfPresent(Int.self, forKey: .price) ?? 0
            self.restaurantId = try values.decodeIfPresent(Int.self, forKey: .restaurantId) ?? 0
        }
    }
    
    struct MenuItem: Codable {
        let created: Date
        let menu: Menu?
        let restaurantName: String
        let restaurantId: String
        
        enum CodingKeys: String, CodingKey {
            case created = "created"
            case menu = "menu"
            case restaurantName = "restaurantName"
            case restaurantId = "restaurantId"
        } 
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.created = try values.decodeIfPresent(Date.self, forKey: .created) ?? Date()
            self.menu = try values.decodeIfPresent(Menu.self, forKey: .menu)
            self.restaurantName = try values.decodeIfPresent(String.self, forKey: .restaurantName) ?? ""
            self.restaurantId = try values.decodeIfPresent(String.self, forKey: .restaurantId) ?? ""
        }   
    }
    
    struct Menu: Codable {
        let mainMenu: String
        let others: [String]
        
        enum CodingKeys: String, CodingKey {
            case mainMenu = "mainMenu"
            case others = "others"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.mainMenu = try values.decodeIfPresent(String.self, forKey: .mainMenu) ?? ""
            self.others = try values.decodeIfPresent([String].self, forKey: .others) ?? []
        }
    }
}


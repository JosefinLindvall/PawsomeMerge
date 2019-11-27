//
//  ServiceTests.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-26.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//



import Foundation
import XCTest // Why will this not be loaded?
@testable import Pawsome //What to replace this line with?

class ServiceTests: XCTestCase
{
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Correct values are set in initializer
    
    func testGiveInvalidCategoryInInitializer()
    {
        //let service = Service ("Not a category" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        //XCTAssertEqual(service, "", "An invalid category was given but service was not set to nil.")
    }
    
    func testGiveCategoryInInitializer()
    {
        let service = Service ("Dog sitter" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.category, "Dog sitter", "The category of the service was not set correctly in the initializer.")
    }
    
    func testGiveNameInInitializer()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.name, "Kelly the vet", "The name of the service was not set correctly in the initializer.")
    }
    
    func testGiveTelephoneNumbeInInitializer()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.telephoneNumber, "070 123 45 67", "The telephone number of the service was not set correctly in the initializer.")
    }
    
    
    func testGiveAddressInInitializer()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.address, "Paw street 20", "The address of the service was not set correctly in the initializer.")
    }
    
    
    
    func testGiveLinkToWebsiteInInitializer()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.linkToWebsite, "www.kellythevet.com", "The link to the website of the service was not set correctly in the initializer.")
    }
    
    func testGiveEmailInInitializer()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        XCTAssertEqual(service.email, "kelly@pawsome.com", "The email of the service was not set correctly in the initializer.")
    }
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Correct attributes are fetched using strings
    
    func testGetNameFromString()
    {
        let service = Service ("Veterinary" , "Kelly the vet" , "070 123 45 67", "Paw street 20" , "www.kellythevet.com" , "kelly@pawsome.com")
        let name = service.getAttributeFromString("name")
        XCTAssertEqual(name, service.name, "The correct attribute service.name was not fetched from string 'name'.")
    }
    
    //should I do more tests like the one above?
    //inputForServiceIsValid



}

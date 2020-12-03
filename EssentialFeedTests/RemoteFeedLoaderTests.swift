//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Maxim Soldatov on 12/3/20.
//

import XCTest

final class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.get(from:URL(string: "https://any-url.com")!)
    }
}

class HTTPClient {
    
    static var shared = HTTPClient()
    
    func get(from url: URL) { }
}

final class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}

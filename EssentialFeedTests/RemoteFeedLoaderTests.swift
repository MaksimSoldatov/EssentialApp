//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Maxim Soldatov on 12/3/20.
//

import XCTest

final class RemoteFeedLoader {
    
}

final class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }

}

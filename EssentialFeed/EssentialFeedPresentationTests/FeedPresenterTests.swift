//
//  Created by Maksim Soldatov on 11.12.20.
//
import XCTest
import EssentialFeed
import EssentialFeedPresentation

class FeedPresenterTests: XCTestCase {
    
    func test_title_isLocalized() {
        XCTAssertEqual(FeedPresenter.title, localized("feed_view_title"))
    }
    
    func test_map_createViewModel() {
        let feed = uniqueImageFeed().models
        
        let viewModel = FeedPresenter.map(feed)
        
        XCTAssertEqual(viewModel.feed, feed)
    }
    
    //MARK: - Helpers
    
    private func localized(_ key: String, table: String = "Feed", file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = table
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
    
}

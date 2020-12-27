//
//  Created by Maksim Soldatov on 27.12.20.
//
import XCTest
import EssentialFeed
import EssentialFeedPresentation

final class LoadResourcePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let(_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    func test_didStartLoading_displaysNoErrorMessageAndStartsLoading() {
        let (sut, view) = makeSUT()
        
        sut.didStartLoading()
        
        XCTAssertEqual(view.messages, [
                     .display(errorMessage: .none),
                     .display(isLoading: true)
                 ])
    }
    
    func test_didFinishLoadingResource_displaysResourceAndStopsLoading() {
        let (sut, view) = makeSUT(mapper: { resource in
            resource + " view model"
        })
        
        sut.didFinishLoading(with: "resource")
        
        XCTAssertEqual(view.messages, [
            .display(resourceViewModel: "resource view model"),
            .display(isLoading: false)
        ])
    }
    
    func test_didFinishLoadingWithError_displaysLocalizedErrorMessageAndStopsLoading() {
        let (sut, view) = makeSUT()
        
        sut.didFinishLoading(with: anyNSError())
        
        XCTAssertEqual(view.messages, [
            .display(errorMessage: localized("generic_view_connection_error")),
            .display(isLoading: false)
        ])
    }

    //MARK: - Helpers
    
    private typealias SUT = LoadResourcePresenter<String, ViewSpy>
    
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line,
        mapper: @escaping SUT.Mapper = { _ in "any" }
        ) -> (sut: SUT, view: ViewSpy) {
        let view = ViewSpy()
        let sut = SUT(resourceView: view, loadingView: view, errorView: view, mapper: mapper)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: SUT.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
    
    private class ViewSpy: ResourceView, FeedErrorView, FeedLoadingView {
        
        typealias ResourceViewModel = String
        
        enum Message: Hashable {
            case display(errorMessage: String?)
            case display(isLoading: Bool)
            case display(resourceViewModel: String)
        }
        
        private(set) var messages = Set<Message>()
        
        func display(_ viewModel: FeedErrorViewModel) {
            messages.insert(.display(errorMessage: viewModel.message))
        }
        
        func display(_ viewModel: FeedLoadingViewModel) {
            messages.insert(.display(isLoading: viewModel.isLoading))
        }
        
        func display(_ viewModel: String) {
            messages.insert(.display(resourceViewModel: viewModel))
        }
    }}
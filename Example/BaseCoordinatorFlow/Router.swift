import UIKit

// MARK: - Router
public protocol Router: Presenter {
  func present(_ module: Presenter?)
  func present(_ module: Presenter?, animated: Bool)
  func present(_ module: Presenter?, animated: Bool, completion: CompletionBlock?)

  func dismiss(_ module: Presenter?)
  func dismiss(_ module: Presenter?, animated: Bool)
  func dismiss(_ module: Presenter?, animated: Bool, completion: CompletionBlock?)

  func push(_ module: Presenter?)
  func push(_ module: Presenter?, animated: Bool)
  func push(_ module: Presenter?, animated: Bool, completion: CompletionBlock?)

  func pop()
  func pop(animated: Bool)
  func pop(animated: Bool, completion: CompletionBlock?)

  func setRoot(_ module: Presenter?)
  func setRoot(_ module: Presenter?, hideBar: Bool)
  func setRoot(_ module: Presenter?, hideBar: Bool, completion: CompletionBlock?)
}

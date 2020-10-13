import UIKit

/// Router completion block
public typealias RouterCompletions = [UIViewController: CompletionBlock]

// MARK: - Router
final public class RouterImp: NSObject {
  fileprivate var rootController: UINavigationController?
  fileprivate var completions: RouterCompletions

  /// Init with 'rootController'
  ///
  /// - Parameters:
  ///       rootController: root UInavigationController
  public init(rootController: UINavigationController?) {
    self.rootController = rootController
    completions = [:]
  }
}

// MARK: - Privates
private extension RouterImp {
  private func performCompletionBlock(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }

    completion()
    completions.removeValue(forKey: controller)
  }
}

// MARK: - Router
extension RouterImp: Router {
  public func present(_ module: Presenter?) {
    present(module, animated: true)
  }
  
  public func present(_ module: Presenter?, animated: Bool) {
    present(module, animated: animated, completion: nil)
  }
  
  public func present(_ module: Presenter?, animated: Bool, completion: CompletionBlock?) {
    guard let viewController = module as? UIViewController else { return }
    rootController?.viewControllers.last?.present(viewController, animated: animated, completion: completion)
  }
  
  public func dismiss(_ module: Presenter?) {
    dismiss(module, animated: true)
  }
  
  public func dismiss(_ module: Presenter?, animated: Bool) {
    dismiss(module, animated: animated, completion: nil)
  }
  
  public func dismiss(_ module: Presenter?, animated: Bool, completion: CompletionBlock?) {
    guard let viewController = module as? UIViewController else { return }
    viewController.dismiss(animated: animated, completion: completion)
  }
  
  public func push(_ module: Presenter?) {
    push(module, animated: true)
  }
  
  public func push(_ module: Presenter?, animated: Bool) {
    push(module, animated: animated, completion: nil)
  }
  
  public func push(_ module: Presenter?, animated: Bool, completion: CompletionBlock?) {
    guard let viewController = module as? UIViewController else { return }
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    rootController?.pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
  
  public func pop() {
    pop(animated: true)
  }
  
  public func pop(animated: Bool) {
    pop(animated: animated, completion: nil)
  }

  public func pop(animated: Bool, completion: CompletionBlock?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    rootController?.popViewController(animated: animated)
    CATransaction.commit()
  }
    
  public func setRoot(_ module: Presenter?) {
    setRoot(module, hideBar: false)
  }
  
  public func setRoot(_ module: Presenter?, hideBar: Bool) {
    setRoot(module, hideBar: hideBar, completion: nil)
  }

  public func setRoot(_ module: Presenter?, hideBar: Bool, completion: CompletionBlock?) {
    guard let viewController = module as? UIViewController else { return }
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    rootController?.setViewControllers([viewController], animated: false)
    rootController?.isNavigationBarHidden = hideBar
    CATransaction.commit()
  }
}

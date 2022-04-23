import UIKit

protocol SetupViewController {  }

func commonInit()

class UserLoginView: UIView {  }





final class UserLoginViewController: UIViewController {
    
    //MARK: - Properties
    private(set) let contentView: UserLoginView
    private let viewModel: UserLoginViewModelProtocol

    //MARK: - Constructor
    init(contentView: UserLoginView, viewModel: UserLoginViewModelProtocol) {
       self.contentView = contentView
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
       commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupDelegates()
    }
    
    //MARK: - Helpers
    private func setupDelegates() {
       contentView.delegate = self
    }
}

//MARK: - UserLoginViewControllerDelegate
extension UserLoginViewController: UserLoginViewControllerDelegate {
    func loginButtonWasTapped() {

    }
}

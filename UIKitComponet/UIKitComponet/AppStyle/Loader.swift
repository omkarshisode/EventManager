import UIKit

class Loader: UIView {
    
    // The spinner for the loading indicator
    private let spinner = UIActivityIndicatorView(style: .large)
    
    // Static singleton instance of the loader
    private static var loader: Loader?
    
    // Private initializer to prevent external instantiation
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLoader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLoader()
    }
    
    // Setup method for configuring the loader view and spinner
    private func setUpLoader() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)  // Semi-transparent background
        
        // Cover the full screen with loader
        self.frame = UIScreen.main.bounds
        
        spinner.color = .white  // Set the spinner color to white
        spinner.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(spinner)
        
        // Set constraints to center the spinner inside the loader view
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    // Show the loader on the provided view
    static func show(on view: UIView) {
        // If the loader is not already created, create and show it
        if loader == nil {
            loader = Loader()
            view.addSubview(loader!)  // Add the loader to the view hierarchy
            loader?.spinner.startAnimating()  // Start the spinner animation
        }
    }
    
    // Hide the loader from the view
    static func hide() {
        if let loader = loader {
            loader.removeFromSuperview()  // Remove loader from its superview
            loader.spinner.stopAnimating()  // Stop the spinner animation
            self.loader = nil  // Set the static loader to nil to ensure it's recreated when needed
        }
    }
}

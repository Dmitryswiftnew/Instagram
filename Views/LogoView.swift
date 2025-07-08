
import SnapKit
import UIKit

class LogoView: UIView {
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "InstagramLogo")
        return view
    }()
    
    
}


// MARK: - Private constans

private enum UIConstans {
    static let logoWidth: CGFloat = 104
    static let logoHeight: CGFloat = 80
}

// MARK: - Private methods

private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstans.logoWidth)
            make.height.equalTo(UIConstans.logoHeight)
        }
    }
}

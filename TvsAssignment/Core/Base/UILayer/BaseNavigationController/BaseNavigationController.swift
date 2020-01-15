//
//  BaseNavigationViewController.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

enum NavigationBarColorScheme: Int {
    case none
    case transparent
    case transparentWhite
}

extension NavigationBarColorScheme {
    var forgroundColor: UIColor {
        switch self {
        case .transparent:
            return UIColor.navigationBarTitleColor()

        case .transparentWhite:
            return UIColor.navigationBarWhiteTitleColor()

        case .none:
            return UIColor.clear
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .transparent:
            return UIColor.clear

        case .transparentWhite:
            return UIColor.clear

        case .none:
            return UIColor.clear
        }
    }

    var backImage: UIImage {
        switch self {
        case .transparent:
            return #imageLiteral(resourceName: "back-white")

        case .transparentWhite:
            return #imageLiteral(resourceName: "back-white")

        case .none:
            return #imageLiteral(resourceName: "back-white")
        }
    }

    var backImageColor: UIColor {
        switch self {
        case .transparent:
            return .white

        case .transparentWhite:
            return .white

        case .none:
            return UIColor.clear
        }
    }

    var translucent: Bool {
        switch self {
        case .transparent:
            return true

        case .transparentWhite:
            return true

        case .none:
            return true
        }
    }
}

enum NavigationBarType: Int {
    case cross
    case none = -1
}

class BaseNavigationController: UINavigationController {
    // MARK: - Properties

    // __________________________________________________________________________________
    //

    var didCallPopViewController = false
    var rightItem: UIBarButtonItem?
    var leftItem: UIBarButtonItem?
    var colorScheme: NavigationBarColorScheme = .transparent {
        didSet {
            if colorScheme != oldValue {
                updateColorScheme()
            }
        }
    }

    var type: NavigationBarType = .none

    // MARK: - Constructors

    // __________________________________________________________________________________
    //
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    init(rootViewController: UIViewController?, colorScheme: NavigationBarColorScheme) {
        if let rootVC = rootViewController {
            super.init(rootViewController: rootVC)
        } else {
            super.init()
        }
        self.colorScheme = colorScheme
    }

    init(rootViewController: UIViewController?, colorScheme: NavigationBarColorScheme, type: NavigationBarType) {
        if let rootVC = rootViewController {
            super.init(rootViewController: rootVC)
        } else {
            super.init()
        }
        self.colorScheme = colorScheme
        self.type = type
    }

    // MARK: - Life Cycle

    // __________________________________________________________________________________
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupAppearance()
    }

    fileprivate func _setupAppearance() {
        // Remove Shadow
        navigationBar.shadowImage = UIImage()

        // Remove Background
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        view.backgroundColor = UIColor.clear

        // Color Scheme
        updateColorScheme()
    }

    // MARK: - Helper methods

    // __________________________________________________________________________________
    //

    func showNavigationBar(animated: Bool) {
        setNavigationBarHidden(false, animated: animated)
    }

    func hideNavigationBar(animated: Bool) {
        setNavigationBarHidden(true, animated: animated)
    }

    func hideLeftItemFor(viewController: UIViewController?) {
        if viewController != nil {
            viewController?.navigationItem.leftBarButtonItem = nil
            viewController?.navigationItem.setHidesBackButton(true, animated: false)
        }
    }

    func showLeftItemFor(viewController: UIViewController?) {
        if let lItem = leftItem, let vc = viewController {
            vc.navigationItem.leftBarButtonItem = lItem
        }
    }

    func hideRightItemFor(viewController: UIViewController?) {
        if let vc = viewController {
            vc.navigationItem.rightBarButtonItem = nil
        }
    }

    func showRightItemFor(viewController: UIViewController?) {
        if let rItem = rightItem, let vc = viewController {
            vc.navigationItem.rightBarButtonItem = rItem
        }
    }

    // MARK: - Color Scheme

    // __________________________________________________________________________________
    //
    func updateColorScheme() {
        if colorScheme == .none {
            hideNavigationBar(animated: false)
            return
        }

        _setupBackgroundAppearance()
        _setupForgroundAppearance()
        _setupBackButton()

        showNavigationBar(animated: false)
    }

    // MARK: - Back Button

    // __________________________________________________________________________________
    //
    fileprivate func _setupBackButton() {
        let backButtonBackgroundImage = colorScheme.backImage
        let barAppearance = UINavigationBar.appearance()
        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage

        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton

        let verticalOffset: CGFloat = 0
        // Hide back button text
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -16000, vertical: verticalOffset), for: .default)

        // Set title vertical position
        //        navigationBar.setTitleVerticalPositionAdjustment(CGFloat(verticalOffset * (-1)), for: .default)
    }

    // MARK: - Background AppearanceappGrayColor

    // __________________________________________________________________________________
    //

    fileprivate func _setupBackgroundAppearance() {
        navigationBar.isTranslucent = colorScheme.translucent
        if colorScheme == .transparent || colorScheme == .transparentWhite {
            navigationBar.backgroundColor = UIColor.clear
            navigationBar.barTintColor = UIColor.clear
            navigationBar.setBackgroundImage(UIImage(), for: .default)

        } else {
            navigationBar.barTintColor = colorScheme.backgroundColor
        }
    }

    // MARK: - Forground Appearance

    // __________________________________________________________________________________
    //
    fileprivate func _setupForgroundAppearance() {
        // Set title appearance
        let color = colorScheme.forgroundColor
        _setupNavigationFont()
        navigationBar.tintColor = colorScheme.backImageColor
        _refreshColorScheme(with: color)
    }

    @objc fileprivate func _setupNavigationFont() {}

    fileprivate func _refreshColorScheme(with color: UIColor?) {
        DispatchQueue.main.async {
            for view: UIView in self.navigationBar.subviews {
                let subviews = view.subviews
                for subview: UIView in subviews {
                    if subview.self is UILabel {
                        if let color = color {
                            (subview as? UILabel)?.textColor = color
                        }
                    }
                }
            }
        }
    }
}

extension BaseNavigationController: UINavigationBarDelegate {
    override func popViewController(animated: Bool) -> UIViewController? {
        didCallPopViewController = true
        return super.popViewController(animated: animated)
    }

    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        // If this is a subsequence call after `popViewController(animated:)`, we should just pop the view controller right away.
        if didCallPopViewController {
            return originalImplementationOfNavigationBar(navigationBar, shouldPop: item)
        }

        // The following code is called only when the user taps on the back button.

        guard let vc = topViewController, item == vc.navigationItem else {
            return false
        }

        if vc.shouldBePopped(self) {
            return originalImplementationOfNavigationBar(navigationBar, shouldPop: item)
        } else {
            return false
        }
    }

    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        didCallPopViewController = false
    }

    private func originalImplementationOfNavigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool { let sel = #selector(UINavigationBarDelegate.navigationBar(_:shouldPop:))
        let imp = class_getMethodImplementation(class_getSuperclass(BaseNavigationController.self), sel)
        typealias ShouldPopFunction = @convention(c) (AnyObject, Selector, UINavigationBar, UINavigationItem) -> Bool
        let shouldPop = unsafeBitCast(imp, to: ShouldPopFunction.self)
        return shouldPop(self, sel, navigationBar, item)
    }
}

extension UIViewController {
    @objc func shouldBePopped(_ navigationController: UINavigationController) -> Bool {
        return true
    }
}

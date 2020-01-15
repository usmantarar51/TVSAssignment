//
//  BaseViewController.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: IBOutlets

    @IBOutlet var tableView: UITableView?
    @IBOutlet var activityIndicator: UIActivityIndicatorView?

    // MARK: Properties

    var tableViewItems = [BaseRowModel]()

    var colorScheme = NavigationBarColorScheme.transparent
    var navigationBarAdded = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupAppFonts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _applyTheme()
    }

    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            _applyBackTheme()
            super.willMove(toParent: parent)
        }
    }

    func setupAppearance() {}
    @objc func setupAppFonts() {}
    func applyTheme() {
        _applyTheme()
    }
}

// Navigation Bar
extension BaseViewController {
    private func _applyTheme() {
        if let navController = navigationController as? BaseNavigationController {
            navController.colorScheme = colorScheme
        }
    }

    private func _applyBackTheme() {
        if let viewControllers = navigationController?.viewControllers {
            if viewControllers.count > 1 {
                if let vc = viewControllers[viewControllers.count - 2] as? BaseViewController, let navController = navigationController as? BaseNavigationController {
                    navController.colorScheme = vc.colorScheme
                }
            }
        }
    }
}

// MARK: - Loadable

extension BaseViewController: Loadable {
    func showLoading() {
        activityIndicator?.isHidden = false
        activityIndicator?.startAnimating()
    }

    func hideLoading() {
        activityIndicator?.isHidden = true
        activityIndicator?.startAnimating()
    }
}

// MARK: - UITableViewDelegate

extension BaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableViewItems[indexPath.row]
        tableView.register(UINib(nibName: item.rowCellIdentifier, bundle: nil), forCellReuseIdentifier: item.rowCellIdentifier)

        // Check Nib cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier) as? BaseTableViewCell else {
            return UITableViewCell()
        }

        cell.updateCell(rowModel: tableViewItems[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDataSource

extension BaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = tableViewItems[indexPath.row]
        return item.rowHeight
    }
}

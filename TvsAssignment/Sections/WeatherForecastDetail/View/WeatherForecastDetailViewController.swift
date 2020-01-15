//
//  WeatherForecastDetailViewController.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class WeatherForecastDetailViewController: BaseViewController {
    // MARK: - IBOutlets

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var bgTopConstraint: NSLayoutConstraint!

    // MARK: - Properties

    var presenter: WeatherForecastDetailPresentation?
    var forecast: ForecastModel?
    var coordinates: CLLocationCoordinate2D?
    var cityname: String = ""

    var oldContentOffset = CGPoint.zero
    let topConstraintRange = (CGFloat(0)..<CGFloat(80))

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad(coordinates: coordinates)
    }

    override func setupAppearance() {
        colorScheme = .transparent

        let height: CGFloat = DeviceType.hasNotch ? 160 : 79
        bgTopConstraint.constant = -height

        setupTableView()
    }

    // MARK: - Private Methods

    fileprivate func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}

// MARK: - WeatherForecastDetailView

extension WeatherForecastDetailViewController: WeatherForecastDetailView {
    func updateCityDetails(forecast: ForecastModel) {
        self.forecast = forecast
        cityLabel.text = cityname
        detailLabel.text = forecast.currently?.summary
        let temp = forecast.currently?.apparentTemperature?.fahrToCelsius()
        temperatureLabel.text = "\(temp ?? 0)\u{00B0}"
    }

    func rowModelsGenerated(rowModels: [BaseRowModel]) {
        tableViewItems.removeAll()
        tableViewItems.append(contentsOf: rowModels)
        tableView?.reloadData()
        tableView?.tableFooterView = UIView()
    }

    func showError(error: Error) {
        showAlertWith(message: error.localizedDescription) { _ in
        }
    }
}

// MARK: - TableViewDelegates && UITableViewDataSource

extension WeatherForecastDetailViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.y - oldContentOffset.y

        // we compress the top view
        if delta > 0, headerViewHeightConstraint.constant > topConstraintRange.lowerBound, scrollView.contentOffset.y > 0 {
            headerViewHeightConstraint.constant = max(topConstraintRange.lowerBound, headerViewHeightConstraint.constant - delta)
            scrollView.contentOffset.y -= delta
            temperatureLabel.alpha = headerViewHeightConstraint.constant / 100
        }

        // we expand the top view
        if delta < 0, headerViewHeightConstraint.constant < topConstraintRange.upperBound, scrollView.contentOffset.y < 0 {
            headerViewHeightConstraint.constant = min(headerViewHeightConstraint.constant - delta, topConstraintRange.upperBound)
            scrollView.contentOffset.y -= delta
            temperatureLabel.alpha = headerViewHeightConstraint.constant / 100
        }
        oldContentOffset = scrollView.contentOffset
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let forcast = self.forecast else {
            return UIView()
        }
        tableView.register(UINib(nibName: "ForecastHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ForecastHeaderView")
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ForecastHeaderView") as? BaseTableViewHeaderFooterView else {
            return UIView()
        }
        header.updateView(rowModel: forcast)
        return header
    }
}

extension WeatherForecastDetailViewController {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
}

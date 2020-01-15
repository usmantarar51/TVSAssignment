//
//  ForecastHeaderView.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class ForecastHeaderView: BaseTableViewHeaderFooterView {
    // MARK: IBOutlets
    
    @IBOutlet var lowestTempLabel: UILabel!
    @IBOutlet var hightestTempLabel: UILabel!
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var dayNameLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var headerView: UIView!
    
    // MARK: Properties
    
    var collectionViewItems = [BaseRowModel]()
    var hourlyForecast: Daily?
    var presenter: TableViewHeaderPresenter?
    
    // MARK: - Override UpdateCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        setupCollectionView()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupView() {
        presenter = TableViewHeaderPresenter()
        presenter?.view = self
    }
    
    fileprivate func setupCollectionView() {
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    fileprivate func setupDailyForecast(model: Data?) {
        let tempHigh = model?.apparentTemperatureHigh?.fahrToCelsius()
        let tempLow = model?.apparentTemperatureLow?.fahrToCelsius()
        let day = Date().getDayName(date: Date(seconds: model?.time ?? 0))
        
        lowestTempLabel.text = "\(tempLow ?? 0)"
        hightestTempLabel.text = "\(tempHigh ?? 0)"
        todayLabel.text = "TODAY"
        dayNameLabel.text = day
    }
    
    // MARK: - Override UpdateView
    
    override func updateView(rowModel: Any?) {
        if let model = rowModel as? ForecastModel {
            if let daily = model.daily?.data?[0] {
                setupDailyForecast(model: daily)
            }
            
            if let hourly = model.hourly {
                hourlyForecast = hourly
                presenter?.generateRowModels(hourlyForcast: hourly)
            }
        }
    }
}

// MARK: - TableViewHeaderView

extension ForecastHeaderView: TableViewHeaderView {
    func rowModelsGenerated(rowModels: [BaseRowModel]) {
        collectionViewItems.removeAll()
        collectionViewItems.append(contentsOf: rowModels)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension ForecastHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionViewItems[indexPath.row]
        collectionView.register(UINib(nibName: item.rowCellIdentifier, bundle: nil), forCellWithReuseIdentifier: item.rowCellIdentifier)
        
        // Check Nib cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.rowCellIdentifier, for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCell(rowModel: collectionViewItems[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ForecastHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = collectionViewItems[indexPath.row]
        return CGSize(width: item.rowWidth, height: item.rowHeight)
    }
}

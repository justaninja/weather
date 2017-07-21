//
//  TodayWeatherViewController.swift
//  WetherApp
//
//  Created by Konstantin Khokhlov on 19.07.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class TodayWeatherViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    // MARK: - Properties
    var viewModel: TodayWeatherViewModel! {
        didSet {
            stateLabel.text = viewModel.stateDescription
            temperatureLabel.text = viewModel.temperatureDescription
            humidityLabel.text = viewModel.humidity
            rainLabel.text = viewModel.rain
            pressureLabel.text = viewModel.pressure
            speedLabel.text = viewModel.speed
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkClient.shared.getWeather(lat: "35", long: "139", success: { [weak self] json in
            let state = State(json: json)
            self?.viewModel = TodayWeatherViewModel(state: state)
        }) { message in
            print(message)
        }
    }
}

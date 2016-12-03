//
//  ViewController.swift
//  TartuWeatherTV
//
//  Created by Kristaps Grinbergs on 03/12/2016.
//  Copyright © 2016 Kristaps Grinbergs. All rights reserved.
//

import UIKit

import TartuWeatherProvider

class ViewController: UIViewController {

  /// Update interval
  private let updateInterval:Int = 10
  
  /// Update weather in interval
  private var timer:Timer?

  /// Current image
  @IBOutlet var currentImage: UIImageView!
  
  /// Temperature label
  @IBOutlet var temperatureLabel: UILabel!
  
  /// Wind label
  @IBOutlet var windLabel: UILabel!
  
  /// Last measured label
  @IBOutlet var lastMeasuredLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // cut corners for current image
    currentImage.layer.cornerRadius = 8.0
    currentImage.clipsToBounds = true
    
    currentImage.accessibilityLabel = "Current image"
    
    // update for first time
    self.updateWeatherData()
    
    // update automatically
    self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(updateInterval), repeats: true, block: {timer in
      self.updateWeatherData()
    })
  }
  
  /**
    Update weather data
  */
  func updateWeatherData() {
    // Get weather data
    TartuWeatherProvider.getWeatherData(completion: {(temperature, wind, lastMeasured) in
    
      self.temperatureLabel.text = temperature
      self.temperatureLabel.accessibilityLabel = temperature
      
      self.windLabel.text = wind
      self.windLabel.accessibilityLabel = wind
      
      self.lastMeasuredLabel.text = lastMeasured
      self.lastMeasuredLabel.accessibilityLabel = lastMeasured
    })
    
    // Get current image
    TartuWeatherProvider.getCurrentImage(completion: {(image) in
      self.currentImage.image = image
    })
  }

}

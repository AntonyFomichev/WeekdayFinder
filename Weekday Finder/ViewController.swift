//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Антон on 07.02.2020.
//  Copyright © 2020 Tony Blaire. All rights reserved.
//

import UIKit

let weekdays: [Int: String] = [
  1: "Sunday",
  2: "Monday",
  3: "Tuesday",
  4: "Wednesday",
  5: "Thursday",
  6: "Friday",
  7: "Saturday"
]

class ViewController: UIViewController {
  @IBOutlet weak var dayText: UITextField!
  @IBOutlet weak var monthText: UITextField!
  @IBOutlet weak var yearText: UITextField!
  @IBOutlet weak var weekDayText: UITextField!
  
  override func viewDidLoad() {
    let date = Date()
    let calendar = Calendar.current
      
    
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    
    dayText.text = "\(day)"
    monthText.text = "\(month)"
    yearText.text = "\(year)"
  }
  
  @IBAction func findDay() {
    let calendar = Calendar.current
    var components = DateComponents()
    components.day = Int(dayText.text!)
    components.month = Int(monthText.text!)
    components.year = Int(yearText.text!)
    
    if dayText.text! == "" {
      dayText.placeholder = "Required"
    } else {
      dayText.placeholder = ""
    }
    
    if monthText.text! == "" {
      monthText.placeholder = "Required"
    } else {
      monthText.placeholder = ""
    }
    
    if yearText.text! == "" {
      yearText.placeholder = "Required"
    } else {
      yearText.placeholder = ""
    }
    
    let newDate = calendar.date(from: components)
    let weekDay = calendar.component(.weekday, from: newDate!)
    
    weekDayText.text = "\(weekdays[weekDay]!)"
  }
}


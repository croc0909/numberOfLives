//
//  ResultViewController.swift
//  numberOfLives
//
//  Created by AndyLin on 2022/8/2.
//

import UIKit
import WebKit

class ResultViewController: UIViewController {
    
    var birthday: Date!
    var lifeNumber:Int!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        //let number = calculateLifeNumber(date: birthday)
        //title = "\(number) \(lifeNumberNames[number])數"
        let number = lifeNumber
        print(number)
        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

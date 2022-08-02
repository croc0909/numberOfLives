//
//  birthdayViewController.swift
//  numberOfLives
//
//  Created by AndyLin on 2022/8/2.
//

import UIKit

class birthdayViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectDateView: UIView!
    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var lifeNumberLabel: UILabel!
    @IBOutlet weak var lifeNumberMeanLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var constellationImageView: UIImageView!
    @IBOutlet weak var constellationLabel: UILabel!
    
    
    let lifeCodeMeanings = ["","開創", "協調", "創意", "務實", "自由","關懷", "探究", "權威", "智慧"]
    
    //宣告 lifeNumber 計算加總結果
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        // Do any additional setup after loading the view.
    }
    
    func viewInit(){
        selectDateView.layer.cornerRadius = 30
        selectDateButton.layer.cornerRadius = 20
        moreInfoButton.layer.cornerRadius = 20
        titleLabel.layer.cornerRadius = 20
        lifeNumberLabel.layer.cornerRadius = 40
        lifeNumberMeanLabel.layer.cornerRadius = 20
        constellationLabel.layer.cornerRadius = 20
        constellationImageView.layer.cornerRadius = 40
    }
    
    
    @IBAction func selectDateAction(_ sender: Any) {
        self.getLifeNumber()
        self.getConstellation()
    }
    
    @IBAction func moreInfoAction(_ sender: Any) {
        performSegue(withIdentifier: "lifeNumberSegue", sender: nil)
    }
    
  
    @IBSegueAction func lifeNumberSegueAction(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.lifeNumber = sum
        
        return controller
    }
    
    
    // 計算生命靈數
    func getLifeNumber()
    {
        //日期轉字串
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var dateString = dateFormatter.string(from: datePicker.date)
        
        //repeat-while迴圈
        repeat{
            //每次repeat都由0開始，否則將進入無限迴圈
            sum = 0
            //for迴圈：取日期數字相加之結果
            for lifeNumber in dateString {
                //字串轉數字
                let number = Int(String(lifeNumber))!
                sum = sum + number
            }
            //得到的總和轉成字串，dateString函數=sum總和字串
            dateString = "\(sum)"
            //如果sum>9代表還沒完全計算完
        }while sum > 9
        
        //顯示生命靈數
        lifeNumberLabel.text = "\(sum)"
        //顯示生命靈數代表的意思
        lifeNumberMeanLabel.text = lifeCodeMeanings[sum]
    }
    
    // 計算星座
    func getConstellation()
    {
        //取值
        let pickDate = datePicker.date
        let datecomponents = Calendar.current.dateComponents(in: TimeZone.current, from: pickDate)
        let year = datecomponents.year!
        let month = datecomponents.month!
        let day = datecomponents.day!
        
        //設定星座日期區間＆顯示星座對應image
        if month == 1 && day >= 19 || month == 2 && day <= 19 {
            constellationLabel.text = "水瓶座"
            constellationImageView.image = UIImage(named: "水瓶")
        }else if month == 2 && day >= 20 || month == 3 && day <= 20 {
            constellationLabel.text = "雙魚座"
            constellationImageView.image = UIImage(named: "雙魚")
        }else if month == 3 && day >= 21 || month == 4 && day <= 20 {
            constellationLabel.text = "牡羊座"
            constellationImageView.image = UIImage(named: "牡羊")
        }else if month == 4 && day >= 21 || month == 5 && day <= 20 {
            constellationLabel.text = "金牛座"
            constellationImageView.image = UIImage(named: "金牛")
        }else if month == 5 && day >= 21 || month == 6 && day <= 20 {
            constellationLabel.text = "雙子座"
            constellationImageView.image = UIImage(named: "雙子")
        }else if month == 6 && day >= 21 || month == 7 && day <= 22 {
            constellationLabel.text = "巨蟹座"
            constellationImageView.image = UIImage(named: "巨蟹")
        }else if month == 7 && day >= 23 || month == 8 && day <= 22 {
            constellationLabel.text = "獅子座"
            constellationImageView.image = UIImage(named: "獅子")
        }else if month == 8 && day >= 23 || month == 9 && day <= 22 {
            constellationLabel.text = "處女座"
            constellationImageView.image = UIImage(named: "處女")
        }else if month == 9 && day >= 23 || month == 10 && day <= 22 {
            constellationLabel.text = "天秤座"
            constellationImageView.image = UIImage(named: "天秤")
        }else if month == 10 && day >= 23 || month == 11 && day <= 22 {
            constellationLabel.text = "天蠍座"
            constellationImageView.image = UIImage(named: "天蠍")
        }else if month == 11 && day >= 23 || month == 12 && day <= 22 {
            constellationLabel.text = "射手座"
            constellationImageView.image = UIImage(named: "射手")
        }else{
            constellationLabel.text = "摩羯座"
            constellationImageView.image = UIImage(named: "摩羯")
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

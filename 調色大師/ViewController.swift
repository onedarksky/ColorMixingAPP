//
//  ViewController.swift
//  調色大師
//
//  Created by 江庸冊 on 2021/10/21.
//

import UIKit

class ViewController: UIViewController {
    //backgrundView
    @IBOutlet weak var backgroundImageView: UIImageView!
    //陰影shadowImageView
    @IBOutlet weak var shadowImageView: UIView!
    //圓角RadiusImageView
    @IBOutlet weak var RadiusImageView: UIView!
    //漸層View
    @IBOutlet weak var gradientImageView: UIView!
    //cupImageView
    @IBOutlet weak var cupImageView: UIImageView!
    //顏色UISlider
    @IBOutlet weak var redUISlider: UISlider!
    @IBOutlet weak var greenUISlider: UISlider!
    @IBOutlet weak var blueUISlider: UISlider!
    @IBOutlet weak var alphaUISlider: UISlider!
    //圓角、邊框、陰影、漸層 UISlider
    @IBOutlet weak var radiusUISlider: UISlider!
    @IBOutlet weak var borderUISlider: UISlider!
    @IBOutlet weak var shadowUISlider: UISlider!
    @IBOutlet weak var gradientUISlider: UISlider!
    //顏色Lable顯示
    @IBOutlet weak var redUILabel: UILabel!
    @IBOutlet weak var greenUILabel: UILabel!
    @IBOutlet weak var blueUILabel: UILabel!
    @IBOutlet weak var alphaUILabel: UILabel!
    //顏色開關
    @IBOutlet weak var redUISwitch: UISwitch!
    @IBOutlet weak var greenUISwitch: UISwitch!
    @IBOutlet weak var blueUISwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    //改顏色UISlider
    @IBAction func changeColor(_ sender: UISlider) {
        cupImageView.backgroundColor = UIColor(red: CGFloat(redUISlider.value), green: CGFloat(greenUISlider.value), blue: CGFloat(blueUISlider.value), alpha: CGFloat(alphaUISlider.value))
        
        //取小數兩位
        //(format: "%.2f", (redUISlider.value))
        //取小數一位
        //(format: "%.1f", alphaSlider.value)
        //取整數
        //(format: "%.0f", redSlider.value * 255)
        if sender == redUISlider || sender == blueUISlider || sender == greenUISlider || sender == alphaUISlider {
            redUILabel.text = String(format: "%.0f", (redUISlider.value*255))
            greenUILabel.text = String(format:"%.0f",(greenUISlider.value*255))
            blueUILabel.text = String(format: "%.0f",(blueUISlider.value*255))
            alphaUILabel.text = String(format: "%.1f",(alphaUISlider.value))
        }
    }
    //button亂數
    @IBAction func changeButton(_ sender: UIButton) {
        redUISlider.value = Float.random(in: 0...1)
        greenUISlider.value = Float.random(in: 0...1)
        blueUISlider.value = Float.random(in: 0...1)
        alphaUISlider.value = Float.random(in: 0...1)
        cupImageView.backgroundColor = UIColor(displayP3Red: CGFloat(redUISlider.value)
                                               , green: CGFloat(greenUISlider.value)
                                               , blue: CGFloat(blueUISlider.value)
                                               , alpha: CGFloat(alphaUISlider.value))
        
    }
    
    //Radius UISlider Action
    @IBAction func sliderRadius(_ sender: UISlider) {
        self.cupImageView.clipsToBounds = true
        self.cupImageView.layer.cornerRadius = CGFloat(radiusUISlider.value)
        self.shadowImageView.layer.cornerRadius = CGFloat(radiusUISlider.value)
    }
    //Border UISlider Action
    @IBAction func sliderBorder(_ sender: UISlider) {
        self.cupImageView.layer.borderColor = UIColor.black.cgColor
        self.cupImageView.layer.borderWidth = CGFloat(borderUISlider.value)
    }
    //Shadow UISlider Action
    @IBAction func sliderShadow(_ sender: UISlider) {
        self.shadowImageView.layer.masksToBounds = false
        self.shadowImageView.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.shadowImageView.layer.shadowColor = UIColor.brown.cgColor
        self.shadowImageView.layer.shadowOpacity = 1
        self.shadowImageView.layer.shadowRadius = CGFloat(shadowUISlider.value)
    }
    //Gradient UISlider Action
    @IBAction func sliderGradient(_ sender: UISlider) {
        let gradientLayer = CAGradientLayer()
        let locationTop = round(10*gradientUISlider.value)/10
        gradientLayer.colors = [UIColor.yellow.cgColor,UIColor.red.cgColor]
        gradientLayer.frame = self.gradientImageView.bounds
        gradientLayer.locations = [0.0,NSNumber(value:locationTop)]
        self.gradientImageView.layer.addSublayer(gradientLayer)
    }
    
    //Switch Button Action
    @IBAction func switchColor(_ sender: UISwitch) {
        if !redUISwitch.isOn {
            redUISlider.isEnabled = false;
        }else{
            redUISlider.isEnabled = true;
        }
        if !greenUISwitch.isOn{
            greenUISlider.isEnabled = false;
        }else {
            greenUISlider.isEnabled = true;
        }
        if !blueUISwitch.isOn{
            blueUISlider.isEnabled = false;
        }else {
            blueUISlider.isEnabled = true;
         }
        }
    func initView(){
        self.cupImageView.clipsToBounds = true
    }
}

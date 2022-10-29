//
//  ViewController.swift
//  DrinksPackageSelect
//
//  Created by kuani on 2022/10/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionPic: UIImageView!
    @IBOutlet var answerButton: [UIButton]!
    
    
    var topicInfo = [Topic(questionPic: "珍煮丹", answerArr: ["50嵐","珍煮丹","可不可","迷客夏"], answer: "珍煮丹"),
                    Topic(questionPic: "麻古茶坊", answerArr: ["清心福全","老賴茶棧","麻古茶坊","春陽茶事"], answer: "麻古茶坊"),
                    Topic(questionPic: "大苑子", answerArr: ["珍煮丹","迷客夏","施房茶","大苑子"], answer: "大苑子"),
                    Topic(questionPic: "龜記", answerArr: ["龜記","茶聚","萬波","清原"], answer: "龜記"),
                    Topic(questionPic: "迷客夏", answerArr: ["可不可","大苑子","施房茶","迷客夏"], answer: "迷客夏"),
                    Topic(questionPic: "老賴茶棧", answerArr: ["老賴茶棧","清心福全","COMEBUY","春陽茶事"], answer: "老賴茶棧"),
                    Topic(questionPic: "可不可", answerArr: ["可不可","施房茶","50嵐","COCO都可"], answer: "可不可"),
                    Topic(questionPic: "comebuy", answerArr: ["茶湯會","橘子工坊","COCO","COMEBUY"], answer: "COMEBUY"),
                    Topic(questionPic: "茶聚", answerArr: ["萬波","50嵐","茶聚","龜記"], answer: "茶聚"),
                    Topic(questionPic: "清心福全", answerArr: ["五桐號","再睡五分鐘","沐白","清心福全"], answer: "清心福全")]
    
    var sum = 0
    var index = 0
    var answer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = "\(sum)"
        topicInfo.shuffle()
        play()
        
    }
    
    func play(){
        
        numberLabel.text = "\(index + 1)"
        questionPic.image = UIImage(named: "\(topicInfo[index].questionPic)")
        answer = topicInfo[index].answer
        topicInfo[index].answerArr.shuffle()
        for i in 0 ... 3 {
            answerButton[i].setTitle(topicInfo[index].answerArr[i], for: .normal)
        }
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        
        index += 1
        if sender.currentTitle == answer{
            sum += 10
            scoreLabel.text = "\(sum)"
        }
        else{
            if sum <= 0{
                scoreLabel.text = "0"
            }
            else{
                sum -= 5
            }
            scoreLabel.text = "\(sum)"
        }
        if index < 10 {
            play()
        }
        else{
            totalScore()
        }
    }
    
    func restart(){
        index = 0
        sum = 0
        numberLabel.text = "\(index + 1)"
        scoreLabel.text = "\(sum)"
        topicInfo.shuffle()
        play()
    }
    
    
    func totalScore(){
        
        if sum <= 10 {
            let alertController = UIAlertController(title: "運氣欠佳，請多喝幾間不同的飲料", message: nil, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.restart()
            }
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "結束", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else if sum > 10 && sum < 60{
            let alertController = UIAlertController(title: "看來飲料喝得不夠多", message: nil, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.restart()
            }
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "結束", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else if sum >= 60 && sum < 100{
            let alertController = UIAlertController(title: "平時飲料喝得蠻多的喔", message: nil, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.restart()
            }
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "結束", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else if sum == 100{
            let alertController = UIAlertController(title: "你是飲料達人，請注意身體健康", message: nil, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "再玩一次", style: .default) { _ in
                self.restart()
            }
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "結束", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }

  
    
}


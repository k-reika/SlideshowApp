//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by 菊池 玲花 on 2019/04/17.
//  Copyright © 2019 reika.kikuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // タイマー
    var timer: Timer?
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    // 表示している画像の番号
    var displayImageNo:Int = 0
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var startstopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //画像ファイルを読み込み
        let image = UIImage(named: "ichigo")
        // Image Viewに画像を設定
        ImageView.image = image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapImageView(_:)))
        self.ImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapImageView(_ sender: UITapGestureRecognizer) {
        self.timer?.invalidate()
        self.timer = nil
        startstopButton.setTitle("再生", for: .normal)
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerに値を代入して渡す
        resultViewController.image = ImageView.image
    
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func TapreturnButton(_ sender: Any) {
        // 表示している画像の番号を1増やす
        displayImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func TapmoveButton(_ sender: Any) {
        // 表示している画像の番号を1増やす
        displayImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func TapstartstopButton(_ sender: Any) {
        if self.timer == nil {
            // タイマー作成・始動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.onTimer), userInfo: nil, repeats: true)
            // ボタンを停止にする
            startstopButton.setTitle("停止", for: .normal)
            // 進む・戻るボタンを無効にする
            moveButton.isEnabled = false
            returnButton.isEnabled = false
        } else {
            // タイマーを停止させる
            self.timer?.invalidate()
            // タイマーをリセットさせる
            self.timer = nil
            // ボタンを再生にする
            startstopButton.setTitle("再生", for: .normal)
            // 進む・戻るボタンを有効にする
            moveButton.isEnabled = true
            returnButton.isEnabled = true
        }
    }
    
    @IBAction func onTapImage(_ sender: Any ) {
        self.timer?.invalidate()
        moveButton.isEnabled = false
        returnButton.isEnabled = false
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    //表示している画像の番号を元に画像を表示する
    func displayImage()  {
        
        // 画像の名前の配列
        let imageNameArray = ["ichigo", "sakura", "sakurapark","skyberry"]
        
        if displayImageNo < 0{
            displayImageNo = imageNameArray.count - 1
        }
        if displayImageNo > imageNameArray.count - 1{
            displayImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name:String = imageNameArray[displayImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }
    
    // タイマーによって一定の間隔で呼び出される関数
    @objc func onTimer() {
        // 表示している画像の番号を1増やす
        displayImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        
    }
    
    
    
}


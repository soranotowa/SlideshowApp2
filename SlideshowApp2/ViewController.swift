//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by sorano.t on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    //outlet配置、どのボタンとも直接紐付けるコーディングがあるため
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sp: UIButton!
    @IBOutlet weak var st: UIButton!
    @IBOutlet weak var pv: UIButton!
    
    // スライドショー用タイマーを宣言
    var timer: Timer!
    
    //配列index番号
    var viewindex = 0
    
    // UIImage の配列を作る、画像番号を配列indexと揃えた
    let imageArray = ["ポプテピ0", "ポプテピ1", "ポプテピ2"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //画像をタップした時のアクションーーーーーーーーーーーーーーーーーーーーーーーーーー
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "zoom", sender: nil)
    }
    //前のレッスンで作ったアプリにあったものをコピペ、理解が必要
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as!
            ZoomViewController
        
        //渡す値をviewindexにしてみたらできた
        zoomViewController.intoZoomView = "\(viewindex)"
    }
    
    //「進む」をタップした時のアクションーーーーーーーーーーーーーーーーーーーーーーーーーー
    @IBAction func next(_ sender: Any) {
        //初期表示が配列0の画像だしこれでいいでしょうか
        viewindex += 1
        if (viewindex == 3) {
        //3以上は行かないように
            viewindex = 0
        }
        //imagenameにその時のindex番号の画像を代入してそれを画面に表示
        let imagename = imageArray[viewindex]
        imageView.image = UIImage(named: imagename)
        
    }
    
    //「戻る」をタップした時のアクションーーーーーーーーーーーーーーーーーーーーーーーーーー
    @IBAction func preview(_ sender: Any) {
        viewindex -= 1
        if viewindex == -1 {
            viewindex = 2
        }
        //imagenameにその時のindex番号の画像を代入してそれを画面に表示
        let imagename = imageArray[viewindex]
        imageView.image = UIImage(named: imagename)
        
    }
    
    //「再生/停止」をタップした時のアクションーーーーーーーーーーーーーーーーーーーーーーーーーー
    @IBAction func startpause(_ sender: Any) {
        //条件分岐として２パターンしかない、nilということは再生なので、1.再生時の処理
        if self.timer == nil {
            //タイマーをセット
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            //ボタン表示を変更
            sp.setTitle("停止", for: .normal)
            //他のボタンを無効に
            st.isEnabled = false
            pv.isEnabled = false

        } else {
        // 再生以外は停止するのみ、2.停止時の処理
            // タイマー停止
            self.timer.invalidate()
            // タイマーを削除というかnilに戻す
            self.timer = nil
            //ボタン表示を変更
            sp.setTitle("再生", for: .normal)
            //他のボタンを有効に
            st.isEnabled = true
            pv.isEnabled = true
        
    }
        }
    //タイマーのselector、changeImageをここで設定
    @objc func changeImage() {
            viewindex += 1
        if (viewindex == 3) {
            viewindex = 0
        }
        //imagenameにその時のindex番号の画像を代入してそれを画面に表示
        let imagename = imageArray[viewindex]
        imageView.image = UIImage(named: imagename)
    }
    
    
    
    //出かける前から帰りたいーーーーーーーーーーーーーーーーーーーーーーーーーー
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}


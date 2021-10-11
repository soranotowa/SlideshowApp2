//
//  ZoomViewController.swift
//  SlideshowApp2
//
//  Created by sorano.t on 2021/10/10.
//

import UIKit

class ZoomViewController: UIViewController {
    //outletを配置
    @IBOutlet weak var zoomView: UIImageView!
    
    //前の画面からもらってくる情報を格納する用の変数を宣言
    var intoZoomView = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像番号を利用して画面に表示することにした
        let imagename2 = UIImage(named: "ポプテピ\(intoZoomView).jpeg")
        zoomView.image = imagename2

        // Do any additional setup after loading the view.
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

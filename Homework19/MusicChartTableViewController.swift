//
//  MusicChartTableViewController.swift
//  Homework19
//
//  Created by 黃柏嘉 on 2021/11/23.
//

import UIKit

class MusicChartTableViewController: UITableViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topPageControl: UIPageControl!
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lyricScrollView: UIScrollView!
    var currentPage = 0
    var imageArray = ["1","2","3","4","5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //pageControl
    @IBAction func changeCurrentPage(_ sender: UIPageControl) {
        currentPage = sender.currentPage
        changePage()
    }
    
    //上一頁
    @IBAction func back(_ sender: UIButton) {
        if currentPage > 0{
            currentPage -= 1
            changePage()
        }
    }
    //下一頁
    @IBAction func next(_ sender: UIButton) {
        if currentPage < 4{
            currentPage+=1
            changePage()
        }
    }
    //選擇控制
    @IBAction func changeContentView(_ sender: UISegmentedControl) {
        currentPage = topSegmentedControl.selectedSegmentIndex
        changePage()
    }
    
    //swipe螢幕變更畫面
    @IBAction func swipeToChangePage(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left{
            currentPage += 1
            if currentPage < 5{
                changePage()
            }else{
                currentPage = 0
                changePage()
            }
            
        }
        if sender.direction == .right{
            currentPage -= 1
            if currentPage > -1{
                changePage()
            }else{
                currentPage = 4
                changePage()
            }
        }
    }
    
    //主要function
    func changePage(){
        topLabel.text = "Top\(currentPage+1)"
        backgroundImage.image = UIImage(named: imageArray[currentPage])
        imageScrollView.contentOffset.x = CGFloat(currentPage*250)
        lyricScrollView.contentOffset.x = CGFloat(currentPage*374)
        topPageControl.currentPage = currentPage
        topSegmentedControl.selectedSegmentIndex = currentPage
        if currentPage == 0{
            backButton.isHidden = true
            nextButton.isHidden = false
        }else if currentPage == 4{
            nextButton.isHidden = true
            backButton.isHidden = false
        }else{
            nextButton.isHidden = false
            backButton.isHidden = false
        }
    }
    
   
    
    
}

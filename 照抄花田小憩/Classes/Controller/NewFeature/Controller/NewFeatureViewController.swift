//
//  NewFeatureViewController.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/9.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit
import SnapKit

private let NewFeatureCellIdentifier = "NewFeature"

class NewFeatureViewController: UICollectionViewController {

    
        // MARK: - Life cycle
    init(){
        
        super.init(collectionViewLayout: NewFeatureViewLayout())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.registerNib(UINib.init(nibName: "NewFeatureCell", bundle: nil), forCellWithReuseIdentifier: NewFeatureCellIdentifier)
        
        setupInit()
        
    }

    private func setupInit() {
        // Add page control
        collectionView?.addSubview(pageControl)
        
        // Layout pageControl
        pageControl.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(100, 20))
        }
    }
    
    private lazy var pageControl: UIPageControl = {
       
        let pageControl = UIPageControl()
        pageControl.numberOfPages = self.imageNames.count ?? 0
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor.yellowColor()
        return pageControl
    }()
    
    private let imageNames: [String] = ["gp_bg_0","gp_bg_1", "gp_bg_2"]
    
    
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count ?? 0

    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NewFeatureCellIdentifier, forIndexPath: indexPath) as!NewFeatureCell
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NewFeatureCellIdentifier, forIndexPath: indexPath) as!NewFeatureCell
        
        let count = imageNames.count ?? 0
        if count > 0 {
            cell.image = UIImage(named: imageNames[indexPath.item])
        }
    
    
        return cell
    }


   override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // 最后一个点击进入首页
    if indexPath.item == imageNames.count - 1{
        
    KeyWindow.rootViewController = TabViewController()
        
       }
    }
        // MARK: - ScrollView Delegate
    // 最后一页不显示 pageControl
     override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / self.view.bounds.width + 0.5)
        pageControl.currentPage = currentPage
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView){
        if scrollView.contentOffset.x/self.view.bounds.width > (CGFloat(imageNames.count) - 1.5){
            pageControl.hidden = true
        }else{
            pageControl.hidden = false
        }
      }
    
}


class NewFeatureViewLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0.0
        scrollDirection = .Horizontal
        
        collectionView?.pagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        
        
    }
}

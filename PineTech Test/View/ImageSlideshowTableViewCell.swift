//
//  ImageSlideshowTableViewCell.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImageSlideshowTableViewCell: UITableViewCell {

    @IBOutlet weak var slideShow: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        slideShow.slideshowInterval = 3.0
        slideShow.contentScaleMode = UIView.ContentMode.scaleAspectFit
        slideShow.setImageInputs([ImageSource(image: UIImage(named: "Logo_w – 1")!), ImageSource(image: UIImage(named: "Logo_w – 2")!), ImageSource(image: UIImage(named: "Logo_w – 3")!)])
//        slideShow.currentPageChanged = { page in
//            self.pageController.currentPage = page
//        }
//        let image = UIImage.outlinedEllipse(size: CGSize(width: 7.0, height: 7.0), color: .darkGray)
//        slideShow.pageControl.pageIndicatorTintColor = UIColor.init(patternImage: image!)
//        slideShow.pageControl.currentPageIndicatorTintColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

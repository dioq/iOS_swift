//
//  PhotosTableViewCell.swift
//  Swift_Info
//
//  Created by lzd_free on 2019/2/6.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Photos

class PhotosTableViewCell: UITableViewCell {
    
    private var firstImageView: UIImageView?
    private var albumTitleLabel: UILabel?
    
    var asset: PHAsset?
    var albumTitleAndCount: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    private func setupUI() {
        firstImageView = UIImageView.init(image: UIImage.init(named: "iw_nilPic"))
        addSubview(firstImageView!)
        //下面两行代码作用: 内容自动放大缩小适应 imageView
        firstImageView?.contentMode = .scaleAspectFill
        firstImageView?.clipsToBounds = true
        
        albumTitleLabel = UILabel()
        albumTitleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        addSubview(albumTitleLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.height - 2
        firstImageView?.frame = CGRect(x: 1, y: 1, width: width, height: width)
        albumTitleLabel?.frame = CGRect(x: firstImageView!.frame.maxX + 5, y: 4, width: 200, height: width)
        
        if asset != nil{
            let defaultSize = CGSize(width: UIScreen.main.scale + bounds.height, height: UIScreen.main.scale + bounds.height)
            //从PHAsset取出图片
            PHCachingImageManager.default().requestImage(for: asset!, targetSize: defaultSize, contentMode: .aspectFill, options: nil, resultHandler: { (img, _) in
                self.firstImageView?.image = img
            })
        }
        
        self.albumTitleLabel?.text = albumTitleAndCount!
    }

}

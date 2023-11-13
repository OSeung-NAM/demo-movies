//
//  MoviesTableViewCell.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: BaseTableViewCell {
    
    private lazy var container: UIView = {
        let view: UIView = UIView()
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var thumbnailImg: UIImageView = {
        let image: UIImageView = UIImageView()
        image.backgroundColor = UtilColor.get(r: 230, g: 230, b: 230, alpha: 1)
        image.layer.cornerRadius = UtilAspectRatio.get(designSize: 10)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        container.addSubview(image)
        return image
    }()
    
    private lazy var titleLB: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UtilColor.get(r: 0, g: 0, b: 0, alpha: 1)
        container.addSubview(label)
        return label
    }()

    override func setupViews() {
        super.setupViews()
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UtilAspectRatio.get(designSize: 16))
            make.leading.equalToSuperview().offset(UtilAspectRatio.get(designSize: 16))
            make.trailing.equalToSuperview().offset(-UtilAspectRatio.get(designSize: 16))
            make.bottom.equalToSuperview().offset(-UtilAspectRatio.get(designSize: 16))
        }
        
        thumbnailImg.snp.makeConstraints { make in
            make.size.equalTo(UtilAspectRatio.get(designSize: 100))
            make.top.leading.bottom.equalToSuperview()
        }
        
        titleLB.snp.makeConstraints { make in
            make.leading.equalTo(self.thumbnailImg.snp.trailing).offset(UtilAspectRatio.get(designSize: 16))
            make.trailing.centerY.equalToSuperview()
        }
    }
    
    func bind(data: MovieEntity) {
        titleLB.text = data.title
        thumbnailImg.imageDownLoad(url: data.movieImgUrl)
    }
}

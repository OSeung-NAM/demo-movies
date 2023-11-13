//
//  MovieDetailView.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit
 
class MovieDetailView: BaseView {
    
    private lazy var closeBtn: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("닫기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.addSubview(button)
        return button
    }()
    
    private lazy var thumbnailImg: UIImageView = {
        let image: UIImageView = UIImageView()
        image.backgroundColor = UtilColor.get(r: 230, g: 230, b: 230, alpha: 1)
        image.layer.cornerRadius = UtilAspectRatio.get(designSize: 10)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        self.addSubview(image)
        return image
    }()
    
    private lazy var titleLB: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UtilColor.get(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        self.addSubview(label)
        return label
    }()
    
    override func setupViews() {
        closeBtn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(UtilAspectRatio.get(designSize: 16))
        }
        
        thumbnailImg.snp.makeConstraints { make in
            make.top.equalTo(self.closeBtn.snp.bottom)
            make.centerX.equalToSuperview()
            make.size.equalTo(UtilAspectRatio.get(designSize: 300))
        }
        
        titleLB.snp.makeConstraints { make in
            make.top.equalTo(self.thumbnailImg.snp.bottom).offset(UtilAspectRatio.get(designSize: 20))
            make.leading.trailing.equalToSuperview()
        }
    }
    
    override func setupEvents() {
        closeBtn.setOnClickListener { [weak self] in
            self?.tapClose?()
        }
    }
    
    func bind(data: MovieEntity) {
        thumbnailImg.imageDownLoad(url: data.movieImgUrl)
        titleLB.text = data.title
    }
    
    private var tapClose: (() -> Void)?
    func configure(tapClose: (() -> Void)?) {
        self.tapClose = tapClose
    }
}

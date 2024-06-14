//
//  PostCollectionViewCell.swift
//  Section4_LoginPage
//
//  Created by Jinyoung Leem on 5/2/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupData() {
        // 이미지뷰의 이미지를 업로드 한다.
    }
}

//
//  GoodsTableViewCell.swift
//  homework 4
//
//  Created by User on 29/10/23.
//

import UIKit

class GoodsTableViewCell: UITableViewCell {

    private let BGView = UIView()
    
    private let goodsImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 11
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameGoods: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countGoods: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1)
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCellUI()
    }

    private func initCellUI() {
        contentView.addSubview(BGView)
        setupConstraintsForBGView()
        
        BGView.addSubview(goodsImage)
        setupConstraintsForGoodsImage()
        
        BGView.addSubview(nameGoods)
        setupConstraintsForNameGoods()
        
        BGView.addSubview(countGoods)
        setupConstraintsForCountGoods()
    }
    
    private func setupConstraintsForBGView() {
        BGView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            BGView.topAnchor.constraint(equalTo: contentView.topAnchor),
            BGView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            BGView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            BGView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            BGView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupConstraintsForGoodsImage() {
        NSLayoutConstraint.activate([
            goodsImage.topAnchor.constraint(equalTo: BGView.topAnchor),
            goodsImage.leadingAnchor.constraint(equalTo: BGView.leadingAnchor),
            goodsImage.trailingAnchor.constraint(equalTo: BGView.trailingAnchor),
            goodsImage.heightAnchor.constraint(equalToConstant: 166)
        ])
    }
    
    func initCellData(_ goods: Goods) {
        goodsImage.image = UIImage(named: goods.image)
        nameGoods.text = goods.name
        countGoods.text = goods.count
        
    }
    
    private func setupConstraintsForNameGoods() {
        NSLayoutConstraint.activate([
            nameGoods.topAnchor.constraint(equalTo: goodsImage.bottomAnchor, constant: 8),
            nameGoods.leadingAnchor.constraint(equalTo: BGView.leadingAnchor)
        ])
    }
    
    private func setupConstraintsForCountGoods() {
        NSLayoutConstraint.activate([
        countGoods.topAnchor.constraint(equalTo: nameGoods.bottomAnchor, constant: 8),
        countGoods.leadingAnchor.constraint(equalTo: BGView.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not been implemented")
    }
}

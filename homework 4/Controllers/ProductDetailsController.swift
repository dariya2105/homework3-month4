//
//  ProductDetailsController.swift
//  homework 4
//
//  Created by User on 29/10/23.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    var goods: Goods?
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var heartBtn: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        let heartImage = UIImage(named: "heart")
        view.tintColor = .white
        view.setImage(heartImage, for: .normal)
        return view
    }()
    
    private let nameOfHouseholdGoods: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 22, weight: .regular)
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starsImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priceLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .link
        view.font = .systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    private let productDetailsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Product Details"
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .medium)
        return view
    }()
    
    private let infoProductDetailsLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.text = "Room Type \nColor \nMaterial \nDimensions \nWeight"
        view.numberOfLines = 5
        view.textColor = .gray
        view.font = .systemFont(ofSize: 15, weight: .regular)
        let text = "Room Type \nColor \nMaterial \nDimensions \nWeight"
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 6
                let attributes = [NSAttributedString.Key.paragraphStyle : paragraphStyle]
                let attributedText = NSAttributedString(string: text, attributes: attributes)
                view.attributedText = attributedText

        return view
    }()
    
    private let infoAboutGoods: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.numberOfLines = 6
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 6
        let attributedText = NSAttributedString(string: "", attributes: [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: view.font
        ])
        view.attributedText = attributedText
        return view
    }()
    
    private let buyButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Buy", for: .normal)
        view.backgroundColor = .link
        view.setTitleColor(UIColor.white, for: .normal)
        view.layer.cornerRadius = 8
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
    }
    
    private func initUI() {
        view.addSubview(imageView)
        setupConstraintsForImageView()
        
        imageView.addSubview(heartBtn)
    setupConstraintsForHeartButton()
        
        view.addSubview(nameOfHouseholdGoods)
        setupConstraintsForNameOfHouseholdGoods()
        
        view.addSubview(starsImageView)
        setupConstraintsForImageStars()
        
        view.addSubview(priceLbl)
        setupConstraintsForPriceLbl()
        
        view.addSubview(productDetailsLabel)
        setupConstraintsForProductDetailsLbl()
        
        view.addSubview(infoProductDetailsLbl)
        setupConstraintsForInfoProductDetailsLbl()
        
        view.addSubview(infoAboutGoods)
        setupConstraintsForInfoAboutGoods()
        
        view.addSubview(buyButton)
        setupConstraintsForBuyButton()
        
    }
    private func setupConstraintsForImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 375)
        ])
        imageView.image = UIImage(named: goods?.image ?? "")
    }
    
    func initDataCell(_ goods: Goods) {
        nameOfHouseholdGoods.text = goods.nameOfFurniture
        priceLbl.text = goods.price
        infoAboutGoods.text = goods.infoGoods
    }
    
    private func setupConstraintsForHeartButton() {
        NSLayoutConstraint.activate([
            heartBtn.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 50),
            heartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            heartBtn.widthAnchor.constraint(equalToConstant: 36),
            heartBtn.heightAnchor.constraint(equalToConstant: 36)
        ])
        heartBtn.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
}

@objc private func heartButtonTapped() {
    heartBtn.tintColor = .red
}

    
    private func setupConstraintsForNameOfHouseholdGoods() {
        NSLayoutConstraint.activate([
            nameOfHouseholdGoods.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            nameOfHouseholdGoods.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameOfHouseholdGoods.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupConstraintsForImageStars() {
        NSLayoutConstraint.activate([
            starsImageView.topAnchor.constraint(equalTo: nameOfHouseholdGoods.bottomAnchor, constant: 6),
            starsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            starsImageView.heightAnchor.constraint(equalToConstant: 18),
            starsImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        starsImageView.image = UIImage(named: goods?.stars ?? "")
    }
    
    private func setupConstraintsForPriceLbl() {
        NSLayoutConstraint.activate([
        priceLbl.topAnchor.constraint(equalTo: starsImageView.bottomAnchor, constant: 18),
        priceLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)
        ])
    }
    
    private func setupConstraintsForProductDetailsLbl() {
        NSLayoutConstraint.activate([
            productDetailsLabel.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 26),
            productDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            productDetailsLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    private func setupConstraintsForInfoProductDetailsLbl() {
        NSLayoutConstraint.activate([
            infoProductDetailsLbl.topAnchor.constraint(equalTo: productDetailsLabel.bottomAnchor, constant: 10),
            infoProductDetailsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            infoProductDetailsLbl.widthAnchor.constraint(equalToConstant: 98),
            infoProductDetailsLbl.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupConstraintsForInfoAboutGoods() {
        NSLayoutConstraint.activate([
            infoAboutGoods.topAnchor.constraint(equalTo: infoProductDetailsLbl.topAnchor),
            infoAboutGoods.leadingAnchor.constraint(equalTo: infoProductDetailsLbl.trailingAnchor, constant: 18),
            infoAboutGoods.widthAnchor.constraint(equalToConstant: 226),
            infoAboutGoods.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupConstraintsForBuyButton() {
        NSLayoutConstraint.activate([
        buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

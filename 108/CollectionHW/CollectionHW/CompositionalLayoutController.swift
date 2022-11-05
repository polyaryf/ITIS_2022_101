//
//  CompositionalLayoutController.swift
//  CollectionHW
//
//  Created by Полина Рыфтина on 02.11.2022.
//

import UIKit

class CompositionalLayoutController: UIViewController, UICollectionViewDataSource {
    private func headerCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(view.bounds.width),
                heightDimension: .absolute(100)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(view.bounds.width),
                heightDimension: .absolute(100)
            ),
            repeatingSubitem: item, count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func happyCatCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(view.bounds.width/2),
                heightDimension: .absolute(300)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(view.bounds.width),
                heightDimension: .absolute(300)
            ),
            repeatingSubitem: item, count: 2
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func upsetCatCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(250)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(250)
            ),
            repeatingSubitem: item, count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    enum Section: Int, CaseIterable {
        case firstHeader
        case happyCat
        case secondHeader
        case upsetCat
    }
    
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] section, _ in
                guard let self else { fatalError("Self is nil") }
                guard let section = Section(rawValue: section) else {
                    fatalError("This section: (\(section)) does not exist")
                }
                
                switch section {
                case .firstHeader:
                    return self.headerCellSection()
                case .happyCat:
                    return self.happyCatCellSection()
                case .secondHeader:
                    return self.headerCellSection()
                case .upsetCat:
                    return self.upsetCatCellSection()
                }
            },
            configuration: configuration)
        
        return UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        collectionView.register(UpsetCatViewCell.self, forCellWithReuseIdentifier: "\(Section.upsetCat)")
        collectionView.register(HappyCatCollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.happyCat)")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.firstHeader)")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.secondHeader)")

        collectionView.dataSource = self
    }
    
    private struct UpsetCat{
        let name: String
        let url: URL
    }
    
    private let usetCatsImages: [UpsetCat] = [
        .init(name: "cat1", url: URL(string: "https://a.pinatafarm.com/312x296/ae7f8ccd22/sad-thumbs-up-cat.jpg")!),
        .init(name: "cat2", url: URL(string: "https://i.imgflip.com/5n88b8.jpg")!),
        .init(name: "cat3", url: URL(string: "https://www.meme-arsenal.com/memes/d7437d8b4e4cca9c4dfd14590798440d.jpg")!),
        .init(name: "cat4", url: URL(string: "https://cdn.kapwing.com/video_image-T3rRLSM4t.jpg")!),
        .init(name: "cat5", url: URL(string: "https://assets.stickpng.com/images/5ee772d099588c0004aa684b.png")!),
        .init(name: "cat6", url: URL(string: "https://i.pinimg.com/736x/72/5f/84/725f8484bc1567944c17b208b8871759.jpg")!),
        .init(name: "cat7", url: URL(string: "https://www.meme-arsenal.com/memes/f04ebf47a09312cbedfca22256c5722d.jpg")!),
        .init(name: "cat8", url: URL(string: "https://i.pinimg.com/originals/6a/04/9f/6a049fedf32ee207c22245b59e244e0c.jpg")!),
        .init(name: "cat9", url: URL(string: "https://i.imgur.com/pGpb0WC.jpg")!),
        .init(name: "cat10", url: URL(string: "https://i.pinimg.com/550x/cb/99/27/cb99275b388b88aba3b419abcba11aff.jpg")!),
        .init(name: "cat11", url: URL(string: "https://i.imgflip.com/458xfx.jpg")!),
        .init(name: "cat12", url: URL(string: "https://www.meme-arsenal.com/memes/15e151362eec0276dbccc11f0fe40fc8.jpg")!)
    ]
    
    private let happyCatsImages: [URL] = [
        URL(string: "https://i.imgflip.com/cnudu.jpg")!,
        URL(string: "https://i.imgflip.com/1rpfag.jpg")!,
        URL(string: "https://i.imgflip.com/paj59.jpg")!,
        URL(string: "https://www.meme-arsenal.com/memes/25bd41b4371cc7b1c206f98a1619b3cb.jpg")!,
        URL(string: "https://static.boredpanda.com/blog/wp-content/uploads/2015/09/happy-cat-smiling-25__880.jpg")!,
        URL(string: "https://i.imgflip.com/59awdu.jpg")!,
        URL(string: "https://img-comment-fun.9cache.com/media/aXrj2bV/a49kEq7D_700w_0.jpg")!,
        URL(string: "https://wompampsupport.azureedge.net/fetchimage?siteId=7575&v=2&jpgQuality=100&width=700&url=https%3A%2F%2Fi.kym-cdn.com%2Fphotos%2Fimages%2Fnewsfeed%2F002%2F205%2F309%2F1d3.jpg")!,
        URL(string: "https://i.pinimg.com/564x/6f/fe/04/6ffe0401e2b20da731be89561cb9c7e1--happy-friday-funny-cats.jpg")!,
        URL(string: "https://p.favim.com/orig/2018/08/17/cat-memes-funny-memes-Favim.com-6204886.jpg")!,
        URL(string: "https://i.pinimg.com/736x/15/a4/8e/15a48e0bac682fd51afc57a09f13df3e.jpg")!,
        URL(string: "https://i.pinimg.com/originals/90/1d/fc/901dfca7406689e2ba859bc7bda8c7b8.png")!
    ]
    
    private func cellContenConfiguration(section: Section, indexPath: IndexPath, cell: UICollectionViewCell) -> UIContentConfiguration {
        var configuration = UIListContentConfiguration.cell()
        switch section {
        case.firstHeader:
            configuration.text = "Happy cats ^^"
            configuration.textProperties.color = .darkGray
            configuration.textProperties.font = .boldSystemFont(ofSize: 30)
        case .secondHeader:
            configuration.text = "Upset cats >:"
            configuration.textProperties.color = .darkGray
            configuration.textProperties.font = .boldSystemFont(ofSize: 30)
        default:
            return UIListContentConfiguration.cell()
        }
        return configuration
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .firstHeader: return 1
        case .happyCat: return usetCatsImages.count
        case .secondHeader: return 1
        case .upsetCat: return happyCatsImages.count
        case nil: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .happyCat:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath)
                    as? HappyCatCollectionViewCell else { fatalError("can't unwrappe cell as HappyCatCollectionViewCell") }
            let image = happyCatsImages[indexPath.item]
            cell.backgroundColor = .darkGray
            cell.set(imageUrl: image)
            return cell
        case .upsetCat:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath)
                    as? UpsetCatViewCell else { fatalError("can't unwrappe cell as UpsetCatViewCell") }
            let image = usetCatsImages[indexPath.item]
            cell.set(text: image.name, imageUrl: image.url)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath)
            cell.contentConfiguration = cellContenConfiguration(section: section, indexPath: indexPath, cell: cell)
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }
}

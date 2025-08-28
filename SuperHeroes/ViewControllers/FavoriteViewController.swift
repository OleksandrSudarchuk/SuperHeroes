//
//  FavoriteViewController.swift
//  SuperHeroes
//
//  Created by Oleksandr Sudarchuk on 08/07/2025.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    //MARK: - Variables
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private lazy var fetchResultController: NSFetchedResultsController<Hero> = {
        let req: NSFetchRequest<Hero> = Hero.fetchRequest()
        req.predicate = NSPredicate(format: "isFavorite == %@", NSNumber(value: true))
        req.sortDescriptors = [
            NSSortDescriptor(key: "favoritedAt", ascending: false),
            NSSortDescriptor(key: "name", ascending: true)
        ]
        
        let controller = NSFetchedResultsController(fetchRequest: req, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        return controller
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightWhite
        tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: "StatsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
        
        do {
            try fetchResultController.performFetch()
        } catch {
            print("FRC error:", error)
        }
    }
    
    override func loadView() {
        view = tableView
    }
    
    //MARK: - UI Components
    private let tableView = UITableView()
}

//MARK: - Extensions
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchResultController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatsTableViewCell", for: indexPath) as! StatsTableViewCell
        let hero = fetchResultController.object(at: indexPath)
        let vm = HeroStatsVM(hero: hero)
        cell.apply(vm)
        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete") {
            [weak self] _, _, done in
            guard let self = self else {return}
            let hero = self.fetchResultController.object(at: indexPath)
            hero.isFavorite = false
            hero.favoritedAt = nil
            do {
                try self.context.save()
                
            } catch {
                print("Save error:", error)
            }
            done(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

//
//  ViewController.swift
//  Example
//
//  Created by abedalkareem omreyh on 07/03/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit
import SimpleEngine

class ViewController: BaseGameViewController {

  // MARK: - IBOutlets

  @IBOutlet weak var movingBackgroundView: MovingBackgroundView!
  @IBOutlet weak var livesView: LivesView!


  // MARK: - Private properties

  private var virusSprite: VirusSpriteView!

  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    addVirus()

    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
      self.addBloodCells()
      self.addWhiteCells()
    }

    livesView.livesCount = 4
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    movingBackgroundView.view = StreamBackgroundView(frame: view.bounds)
  }

  private func addVirus() {
    virusSprite = VirusSpriteView()
    virusSprite.attachTo(analogView)
    let rightMargen: CGFloat = virusSprite.frame.width
    let x = view.frame.width - virusSprite.frame.width - rightMargen
    let y = (view.frame.height / 2) - virusSprite.frame.height
    virusSprite.frame.origin = CGPoint(x: x, y: y)
    sceneView.addSubview(virusSprite)
  }

  private func addBloodCells() {
    let bloodCellSprite = BloodCellSpriteView()
    let width = CGFloat(bloodCellSprite.width)
    let randomY = CGFloat.random(in: width...(view.bounds.height-width))
    bloodCellSprite.frame.origin = CGPoint(x: -width, y: randomY)
    sceneView.addSubview(bloodCellSprite)
    bloodCellSprite.moveTo(x: view.bounds.width, y: randomY)
  }

  private func addWhiteCells() {
    let bloodCellSprite = WhiteCellSpriteView()
    let width = CGFloat(bloodCellSprite.width)
    let randomY = CGFloat.random(in: width...(view.bounds.height-width))
    bloodCellSprite.frame.origin = CGPoint(x: -width, y: randomY)
    sceneView.addSubview(bloodCellSprite)
    bloodCellSprite.moveTo(x: view.bounds.width, y: randomY)
  }

}


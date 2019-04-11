//
//  MyScene.swift
//  Book_Sources
//
//  Created by João Paulo de Oliveira Sabino on 18/03/19.
//

import SpriteKit
import PlaygroundSupport

public class MyScene: SKScene {
    
    let pollution = SKSpriteNode(imageNamed: "pollution")
    let base_city = Ground(imageNamed: "base_city")
    
    let sea = Sea()
    let seaAnimation = Atlas.create(named: "Sea")
    let dirtySeaAnimation = Atlas.create(named: "DirtySea")
    let dirtySand = SKSpriteNode(imageNamed: "dirty_sand")
   
    var panGesture: UIPanGestureRecognizer!
    var lastCameraPosition = CGPoint.zero
    
    var trees: [SKSpriteNode] = []
    let treeAnimation = Atlas.create(named: "Tree")
    
    var garbages: [Garbage] = []
    let trash_papers = Trash(imageNamed: "trash_papers", type: .paper)
    let trash_organic = Trash(imageNamed: "trash_organic", type: .organic)
    let trash_plastic = Trash(imageNamed: "trash_plastic", type: .plastic)
    let trash_metal = Trash(imageNamed: "trash_metal", type: .metal)
    var trashes: [Trash] = []
   
    var clouds : [Cloud] = []
    
    var currentPage = 0
    var label = SKLabelNode()
    
    var effectSea = SKEffectNode()
    
    var isTouchingGarbage = false {
        didSet{
            if !isTouchingGarbage {
                view?.addGestureRecognizer(panGesture)
            }else{
                view?.removeGestureRecognizer(panGesture)
            }
        }
    }
    
    override public func didMove(to view: SKView) {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
        
        self.size = CGSize(width: 2300, height: 1300)
        base_city.position = CGPoint.zero
        base_city.zPosition = 2
        addChild(base_city)
        
        pollution.zPosition = 32
        pollution.setScale(6)
        
    
        setupCamera()
        
        label.text = "aaaaaa"
        label.position = CGPoint.zero
        label.zPosition = 50
        label.fontSize = 50
        
        setupCity()
        
        setupSea()
    
        if currentPage == 2 {
            setupClouds()
            addChild(pollution)
            setupInteractionArea()
        }
        
        if currentPage == 3 {
            if let cam = self.camera {
                cam.setScale(0.25)
                cam.position = CGPoint(x: 347, y: -207)
                lastCameraPosition = cam.position
            }

            setupGarbage()
            
            let treePos1 = CGPoint(x: -640, y: 132)
            let treePos2 = CGPoint(x: -560, y: 85)
            let treePos3 = CGPoint(x: -459.3, y: 24)
            let treePos4 = CGPoint(x: -375, y: -24)
            let treePos5 = CGPoint(x: -320, y: -52.5)
            let treePos6 = CGPoint(x: 58.4, y: -80)
            let treePos7 = CGPoint(x: 128, y: -118.5)
            
            for i in 0...5 {
                let pos = CGPoint(x: treePos1.x + CGFloat(50*i), y: treePos1.y + CGFloat(30*i))
                plantTree(in: pos)
                let pos2 = CGPoint(x: treePos2.x + CGFloat(50*i), y: treePos2.y + CGFloat(30*i))
                plantTree(in: pos2)
                let pos3 = CGPoint(x: treePos3.x + CGFloat(50*i), y: treePos3.y + CGFloat(30*i))
                plantTree(in: pos3)
                let pos4 = CGPoint(x: treePos4.x + CGFloat(50*i), y: treePos4.y + CGFloat(30*i))
                plantTree(in: pos4)
                let pos5 = CGPoint(x: treePos5.x + CGFloat(50*i), y: treePos5.y + CGFloat(30*i))
                plantTree(in: pos5)
            }
            
            for i in 0...2{
                let pos = CGPoint(x: treePos6.x + CGFloat(50*i), y: treePos6.y + CGFloat(30*i))
                plantTree(in: pos)
                let pos2 = CGPoint(x: treePos7.x + CGFloat(50*i), y: treePos7.y + CGFloat(30*i))
                plantTree(in: pos2)
            }
            
            //dirty sand
            dirtySand.position = CGPoint(x: 290.5, y: -290)
            dirtySand.zPosition = 2
            dirtySand.alpha = 0.6
            addChild(dirtySand)
        }
        

        trash_papers.position = CGPoint(x: 295, y: -156)
        trash_papers.zPosition = 10
        addChild(trash_papers)
        
        trash_organic.position = CGPoint(x: 276, y: -167)
        trash_organic.zPosition = 10.5
        addChild(trash_organic)
        
        trash_plastic.position = CGPoint(x: 256.5, y: -176)
        trash_plastic.zPosition = 11
        addChild(trash_plastic)
        
        trash_metal.position = CGPoint(x: 238.5, y: -188)
        trash_metal.zPosition = 12
        addChild(trash_metal)
        
        trashes = [trash_papers, trash_organic, trash_plastic, trash_metal]
        
        trashes.forEach {
            $0.setScale(0.04)
            $0.anchorPoint = CGPoint(x: 0.7, y: 0.5)
        }
        
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
    }
    
    func setupCamera(){
        let camera = SKCameraNode()
        self.camera = camera
        self.addChild(camera)
    }
    
    func setupCity(){
       
        let build1 = SKSpriteNode(imageNamed: "build_1")
        build1.position = CGPoint(x: -1013.5, y: 182)
        build1.zPosition = 5
        addChild(build1)
        
        let build2 = SKSpriteNode(imageNamed: "build_2")
        build2.position = CGPoint(x: -172, y: -86.5)
        build2.zPosition = 5
        addChild(build2)
        
        let build3 = SKSpriteNode(imageNamed: "build_3")
        build3.position = CGPoint(x: -15.5, y: 388.5)
        build3.zPosition = 5
        addChild(build3)
        
        let build4 = SKSpriteNode(imageNamed: "build_4")
        build4.position = CGPoint(x: -682, y: 0)
        build4.zPosition = 5
        addChild(build4)
        
        let houses = SKSpriteNode(imageNamed: "houses")
        houses.position = CGPoint(x: -620.5, y: 301.5)
        houses.zPosition = 5
        addChild(houses)
        
        
        let beach1 = SKSpriteNode(imageNamed: "beach1")
        beach1.position = CGPoint(x: 235, y: -260)
        beach1.zPosition = 5
        beach1.setScale(0.2)
        addChild(beach1)
        
        let beach2 = SKSpriteNode(imageNamed: "beach2")
        beach2.position = CGPoint(x: 404.5, y: -174)
        beach2.zPosition = 5
        beach2.setScale(0.2)
        addChild(beach2)
    }
    
    func plantTree(in position: CGPoint){
        let tree = SKSpriteNode()
        tree.anchorPoint = CGPoint(x: 0.7, y: 0.3)
        tree.size = CGSize(width: 100, height: 108)
        tree.position = position
        
        tree.zPosition = 4
        addChild(tree)
        
        trees.forEach {
            if $0.intersects(tree) && $0.position.y < tree.position.y {
                tree.zPosition = $0.zPosition - 0.01
            }
        }
        
        trees.append(tree)

        let action = SKAction.animate(with: treeAnimation, timePerFrame: 0.02, resize: false, restore: false)
        
        tree.removeAllActions()
        tree.run(action)
        
        clouds.forEach { (cloud) in
            cloud.cloudClean.run(SKAction.fadeAlpha(by: 0.05, duration: 0.75))
            cloud.cloudDirty.run(SKAction.fadeAlpha(by: -0.05, duration: 0.75))
        }
        pollution.run(SKAction.fadeAlpha(by: -0.05, duration: 0.75))
        
    }
    
    func removeAllTrees(){
        self.trees.forEach { (tree) in
           
            let showPollution = SKAction.fadeAlpha(to: 1, duration: 1)
            pollution.run(showPollution)
            
            let cloudAlpha = SKAction.fadeAlpha(to: 0.5, duration: 1)
            
            clouds.forEach({
                $0.cloudDirty.run(cloudAlpha)
                $0.cloudClean.run(cloudAlpha)
            })
            
            if let treeTexture = tree.texture, let index: Int = treeAnimation.reversed().index(of: treeTexture) {
                let arrayAtlas = Array(treeAnimation.reversed()[index...40])
                let action = SKAction.animate(with: arrayAtlas, timePerFrame: 0.03, resize: false, restore: false)
                tree.removeAllActions()
                tree.run(action) {
                    tree.removeFromParent()
                }
            }
        }
        
    }
    
    func setupInteractionArea(){
        let points1 = [CGPoint(x: -715.5, y: 131),
                      CGPoint(x: -367, y: 331),
                      CGPoint(x: 86.5, y: 73),
                      CGPoint(x: -263.5, y: -127.5)]
        
        
        
        createInteractionArea(points: points1)
        
        let points2 = [CGPoint(x: -529, y: -362.5),
                       CGPoint(x: -261, y: -209),
                       CGPoint(x: -96, y: -307),
                       CGPoint(x: -360, y: -458)]
        createInteractionArea(points: points2)
        
        
        let points3 = [CGPoint(x: -20, y: -70),
                       CGPoint(x: 157, y: 33),
                       CGPoint(x: 327.3, y: -65.5),
                       CGPoint(x: 149, y: -167.5)]
        createInteractionArea(points: points3)
        
        let points4 = [CGPoint(x: 227, y: 74),
                       CGPoint(x: 421.3, y: 184),
                       CGPoint(x: 592, y: 85),
                       CGPoint(x: 397.7, y: -25.7)]
        createInteractionArea(points: points4)
        
        let points5 = [CGPoint(x: -508, y: 492),
                       CGPoint(x: -311, y: 608),
                       CGPoint(x: -169, y: 526.5),
                       CGPoint(x: -365.5, y: 411.5)]
        createInteractionArea(points: points5)
        
        let points6 = [CGPoint(x: -927, y: 252),
                       CGPoint(x: -578, y: 453),
                       CGPoint(x: -510, y: 413),
                       CGPoint(x: -858, y: 212)]
        createInteractionArea(points: points6)
        
    }
    func createInteractionArea(points: [CGPoint]){
        var pts = points
        let shape = InterationArea(points: &pts, count: points.count)
        shape.setupShape()
        shape.zPosition = 100
        addChild(shape)
        shape.touchArea = { location in
            self.plantTree(in: location)
        }
    }
    
    func setupGarbage(){
        
        let garbagesTextures = ["garbage_apple", "garbage_banana", "garbage_paper1", "garbage_paper2", "garbage_pet1", "garbage_pet2", "garbage_soda1", "garbage_soda2", "garbage_bag", "garbage_box"]

        
        for i in 0...9 {
            var typeGarbage: TrashType = .paper
            switch(i) {
            case 0,1:
                typeGarbage = .organic
            case 2,3,9:
                typeGarbage = .paper
            case 4,5,8:
                typeGarbage = .plastic
            case 6,7:
                typeGarbage = .metal
            default:
                print("default")
            }
        
            let randomPosX = Int.random(in: 287...330)
            let randomPosY = Int.random(in: -260...(-195))
            
            let garbage = Garbage(imageNamed: garbagesTextures[i], type: typeGarbage)
            garbage.position = CGPoint(x: randomPosX, y: randomPosY)
            garbage.zPosition = 30
            garbage.isUserInteractionEnabled = true
            garbage.setScale(0.01)
            
            garbage.run(SKAction.scale(to: 0.1, duration: 0.3))
            addChild(garbage)
            garbages.append(garbage)
            
            let originalPosition = garbage.position
            garbage.touchGarbage = { bool in
                self.isTouchingGarbage = bool
                
                var trash: Trash?
                
                self.trashes.forEach({
                    if garbage.intersects($0.trashArea) && garbage.type == $0.type {
                        trash = $0
                    }
                })
    
                if let t = trash {
                    if !bool {
                        
                        garbage.run(SKAction.move(to: t.position, duration: 0.3))
                        garbage.run(SKAction.scale(to: 0, duration: 0.75)) {
                            garbage.removeFromParent()
                            self.sea.seaDirty.run(SKAction.fadeAlpha(by: -0.04, duration: 0.75))
                            self.dirtySand.run((SKAction.fadeAlpha(by: -0.04, duration: 0.75)))
                        }
                        
                    }
                }else{
                    if !bool {
                        garbage.run(SKAction.move(to: originalPosition, duration: 0.3))
                    }
                }
            }
            
            garbage.touchMoved = { location in
                garbage.position = location
            }
        }
        
    }
    
    func resetGarbage(){
        self.sea.seaDirty.run(SKAction.fadeAlpha(to: 0.6, duration: 0.5))
        self.dirtySand.run(SKAction.fadeAlpha(to: 0.6, duration: 0.5))
        
        garbages.forEach { (garbage) in
            garbage.removeFromParent()
        }
        garbages = []
        setupGarbage()
    }
    
    func setupSea(){
        sea.position = CGPoint(x: 518.5, y: -364.5)
        sea.zPosition = 25
        sea.setScale(1.03)
        addChild(sea)
        
//        let animate = SKAction.animate(with: seaAnimation, timePerFrame: 0.06, resize: false, restore: false)
//        let sequence = SKAction.sequence([SKAction.wait(forDuration: 0.2), animate])
//        sea.seaClean.run(SKAction.repeatForever(sequence))
        
        if currentPage == 3 {
            sea.addChild(sea.seaDirty)
//            let dirtyAnimate = SKAction.animate(with: dirtySeaAnimation, timePerFrame: 0.06, resize: false, restore: false)
//            let dirtySequence = SKAction.sequence([SKAction.wait(forDuration: 0.2), dirtyAnimate])
//            sea.seaDirty.run(SKAction.repeatForever(dirtySequence))
        }
        
    }

    func setupClouds(){
        let waitTime = SKAction.wait(forDuration: 3)
        
        let addCloud = SKAction.run {
            for _ in 0...2 {
                let randomX = Int.random(in: -1200...1070)
                let randomY = Int.random(in: -720...640)
                
                let cloud = Cloud()
                cloud.zPosition = 40
                cloud.position = CGPoint(x: randomX, y: randomY)
                cloud.alpha = 0
                
                if let firstCloud = self.clouds.first, self.currentPage == 2 {
                    cloud.cloudClean.alpha = firstCloud.cloudClean.alpha
                    cloud.cloudDirty.alpha = firstCloud.cloudDirty.alpha
                }else if self.currentPage == 3 {
                    cloud.cloudClean.alpha = 1
                    cloud.cloudDirty.alpha = 0
                }
                
                
                self.addChild(cloud)
                let fadeIn = SKAction.fadeIn(withDuration: 0.5)
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let moveAction = SKAction.move(by: CGVector(dx: 500, dy: 300), duration: 15)
                
                self.clouds.append(cloud)
                let wait = SKAction.wait(forDuration: 10)
                cloud.run(fadeIn)
                cloud.run(SKAction.sequence([wait, fadeOut]))
               
                cloud.run(moveAction) {
                    cloud.removeFromParent()
                    guard let i = self.clouds.index(of: cloud) else {return}
                    self.clouds.remove(at: i)
                }
            }
            
            
        }
        
        self.run(SKAction.repeatForever(SKAction.sequence([addCloud,waitTime])))
    }
}

extension MyScene: UIGestureRecognizerDelegate {
    @objc func handlePan(_ gesture: UIPanGestureRecognizer){
        
        if gesture.state == .changed {
            let location = gesture.translation(in: self.view)
            
            if let cam = self.camera {
                var camScale: CGFloat = 1
                
                if currentPage == 3 {
                    camScale = 0.25
                }
                
                cam.position.x = -(location.x * camScale) + lastCameraPosition.x
                cam.position.y = (location.y * camScale) + lastCameraPosition.y
                
                
                let borderRight =  (base_city.size.width/2 - self.view!.frame.size.width/2)
                let borderLeft = (-(base_city.size.width/2) + self.view!.frame.size.width/2)
                let borderTop = (base_city.size.height/2 - self.view!.frame.size.height/2)
                let borderDown = (-(base_city.size.height/2) + self.view!.frame.size.height/2)
                
                if cam.position.x >= borderRight {
                    cam.position.x = borderRight - 10
                }
                if cam.position.x <= borderLeft {
                    cam.position.x = borderLeft + 10
                }
                if cam.position.y >= borderTop {
                    cam.position.y = borderTop - 10
                }

                if cam.position.y <= borderDown {
                    cam.position.y = borderDown + 10
                }
            
            }
            
        }
        
        if gesture.state == .ended {
            lastCameraPosition = self.camera!.position
        }
    }
}





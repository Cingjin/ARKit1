//
//  ViewController.swift
//  ARKit1
//
//  Created by Anmo on 2021/5/6.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 存放所有3D几何体容器
        let scene = SCNScene()
        
        // 想要绘制的 3D 立方体（ARKit中坐标单位为米，我们创建 10 X 10 X 10厘米的盒子）
        let boxGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
        
        // 将几何体包装为 node 以便添加到scene
        let boxNode = SCNNode(geometry: boxGeometry)
        
        // 把 box 放在摄像头正前方
        boxNode.position = SCNVector3Make(0, 0, -0.5)
        
        // rootNode 是一个特殊的 node，它是所有 node的起点
        scene.rootNode.addChildNode(boxNode)
        
        // 将 scene 赋给 view
        sceneView.scene = scene
        
        // 3D 场景中设置光照方便看清立方体边缘
        sceneView.autoenablesDefaultLighting = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

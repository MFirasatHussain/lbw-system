import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

class ARAlignmentScreen extends StatefulWidget {
  @override
  _ARAlignmentScreenState createState() => _ARAlignmentScreenState();
}

class _ARAlignmentScreenState extends State<ARAlignmentScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Alignment'),
      ),
      body: ARView(
        onARViewCreated: onARViewCreated,
      ),
    );
  }

  void onARViewCreated(ARViewController arViewController) {
    // Initialize AR session and object manager
    arSessionManager = ARSessionManager(arViewController);
    arObjectManager = ARObjectManager(arSessionManager);

    arSessionManager.onInitialize();
    arObjectManager.onInitialize();

    // Add a straight blue path to align the stumps
    addBluePath();
  }

  void addBluePath() async {
    // Define the blue path as a series of spheres (you can use lines if supported)
    for (int i = 0; i <= 10; i++) {
      await arObjectManager.addNode(
        ARNode(
          type: NodeType.sphere,
          position: Vector3(0, 0, -i.toDouble()), // Move the path forward in Z-axis
          scale: Vector3(0.05, 0.05, 0.05),      // Size of each sphere
          materials: [ARMaterial(color: Colors.blue)],
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the AR session and resources
    arSessionManager.dispose();
    arObjectManager.dispose();
    super.dispose();
  }
}

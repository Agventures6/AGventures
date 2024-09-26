import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  List<File> _mediaFiles = [];
  CameraController? _cameraController;
  late List<CameraDescription> cameras;
  bool isCameraInitialized = false;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController?.initialize();
    setState(() {
      isCameraInitialized = true;
    });
  }

  Future<void> _captureImage() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final XFile? image = await _cameraController!.takePicture();
      if (image != null) {
        setState(() {
          _mediaFiles.add(File(image.path));
        });
      }
    }
  }

  Future<void> _recordVideo() async {
    if (isRecording) {
      XFile? video = await _cameraController?.stopVideoRecording();
      setState(() {
        isRecording = false;
        if (video != null) {
          _mediaFiles.add(File(video.path));
        }
      });
    } else {
      await _cameraController?.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    }
  }

  void _clearMedia() {
    setState(() {
      _mediaFiles.clear();
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearMedia,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: _mediaFiles.isEmpty
                    ? Center(child: Text('No media available'))
                    : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: _mediaFiles.length,
                  itemBuilder: (context, index) {
                    final media = _mediaFiles[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MediaPreviewPage(media: media),
                        ),
                      ),
                      child: Image.file(
                        media,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          if (isCameraInitialized)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Camera Frame
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CameraPreview(_cameraController!),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Capture Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera_alt, size: 40),
                        color: Colors.green,
                        onPressed: _captureImage,
                      ),
                      SizedBox(width: 24),
                      IconButton(
                        icon: Icon(
                          isRecording ? Icons.stop : Icons.videocam,
                          size: 40,
                        ),
                        color: Colors.red,
                        onPressed: _recordVideo,
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Center(child: CircularProgressIndicator()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, color: Colors.black),
            label: '',
          ),
        ],
      ),
    );
  }
}

class MediaPreviewPage extends StatelessWidget {
  final File media;

  MediaPreviewPage({required this.media});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Preview'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Image.file(
          media,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

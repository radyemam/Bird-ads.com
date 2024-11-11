import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:untitled5/generated/l10n.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  TextEditingController _postLinkController = TextEditingController();
  TextEditingController _pageLinkController = TextEditingController();
  TextEditingController _adCodeController = TextEditingController();
  TextEditingController _postContentController = TextEditingController();
  String? _postLink;
  String? _pageLink;
  String? _adCode;
  List<XFile> _selectedImages = [];
  List<String> _imageUrls = [];
  List<String> _imageNames = [];
  List<Uint8List> _selectedImageData = [];
  bool _isUploading = false;
  String _uploadStatus = '';
  String _selectedOption = 'current';
  String? _selectedPlatform;

  @override
  void initState() {
    super.initState();
    _loadPostLink();
    _loadSavedData();
    _loadSelectedOption();
    _loadSelectedPlatform();
  }

  Future<void> _loadPostLink() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _postLink = prefs.getString('postLink');
      _pageLink = prefs.getString('pageLink');
      _adCode = prefs.getString('adCode');
      _postLinkController.text = _postLink ?? '';
      _pageLinkController.text = _pageLink ?? '';
      _adCodeController.text = _adCode ?? '';
    });
  }

  Future<void> _loadSelectedPlatform() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPlatform = prefs.getString('selectedPlatform');
    });
  }

  Future<void> _savePostLink() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('postLink', _postLinkController.text);
    await prefs.setString('pageLink', _pageLinkController.text);
    await prefs.setString('adCode', _adCodeController.text);
    setState(() {
      _postLink = _postLinkController.text;
      _pageLink = _pageLinkController.text;
      _adCode = _adCodeController.text;
    });
  }

  void _clearPostLink() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('postLink');
    await prefs.remove('pageLink');
    await prefs.remove('adCode');
    setState(() {
      _postLink = null;
      _pageLink = null;
      _adCode = null;
      _postLinkController.clear();
      _pageLinkController.clear();
      _adCodeController.clear();
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _selectedImages = pickedFiles;
        _isUploading = true;
        _uploadStatus = S.of(context).uploadStatus;
      });
      for (var pickedFile in pickedFiles) {
        var imageData = await pickedFile.readAsBytes();
        _selectedImageData.add(imageData);
      }
      await _uploadImages();
    }
  }

  Future<void> _uploadImages() async {
    List<String> uploadedUrls = [];
    List<String> uploadedNames = [];
    FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://birdy-d8157.appspot.com');
    for (var i = 0; i < _selectedImages.length; i++) {
      var image = _selectedImages[i];
      var imageData = _selectedImageData[i];
      String fileName = image.name;
      Reference storageRef = storage.ref().child(fileName);
      await storageRef.putData(imageData);
      String downloadURL = await storageRef.getDownloadURL();
      uploadedUrls.add(downloadURL);
      uploadedNames.add(fileName);
    }
    setState(() {
      _imageUrls.addAll(uploadedUrls);
      _imageNames.addAll(uploadedNames);
      _isUploading = false;
      _uploadStatus = S.of(context).uploadStatus;
    });
  }

  void _removeImage(int index) {
    setState(() {
      if (index < _imageUrls.length) {
        _imageUrls.removeAt(index);
        _imageNames.removeAt(index);
      }
      if (index < _selectedImages.length) {
        _selectedImages.removeAt(index);
        _selectedImageData.removeAt(index);
      }
    });
  }

  Future<void> _savePost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedOption', _selectedOption);
    if (_selectedOption == 'current') {
      await _savePostLink();
    } else if (_selectedOption == 'new') {
      await prefs.setStringList('imageUrls', _imageUrls);
      await prefs.setStringList('imageNames', _imageNames);
      await prefs.setString('postContent', _postContentController.text);
    }
    Navigator.pop(context, {
      'selectedOption': _selectedOption,
      'postLink': _postLinkController.text,
      'pageLink': _pageLinkController.text,
      'adCode': _adCodeController.text,
      'postContent': _postContentController.text,
      'imageUrls': _imageUrls.join(' | '),
      'imageNames': _imageNames.join(' | ')
    });
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageUrls = prefs.getStringList('imageUrls') ?? [];
      _imageNames = prefs.getStringList('imageNames') ?? [];
      _postContentController.text = prefs.getString('postContent') ?? '';
    });
  }

  Future<void> _loadSelectedOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedOption = prefs.getString('selectedOption') ?? 'current';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Color(0xFF800080);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).postLink, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  double fontSize = constraints.maxWidth * 0.05;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Radio(
                              value: 'current',
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value.toString();
                                });
                              },
                              activeColor: purpleColor,
                            ),
                            Flexible(
                              child: Text(
                                _selectedPlatform == S.of(context).google
                                    ? S.of(context).pageLink
                                    : _selectedPlatform == S.of(context).youtube
                                    ? S.of(context).videoLink
                                    : S.of(context).postLink,
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: purpleColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Radio(
                              value: 'new',
                              groupValue: _selectedOption,
                              onChanged: (_selectedPlatform == S.of(context).instagram ||
                                  _selectedPlatform == S.of(context).tiktok ||
                                  _selectedPlatform == S.of(context).google ||
                                  _selectedPlatform == S.of(context).youtube)
                                  ? null
                                  : (value) {
                                setState(() {
                                  _selectedOption = value.toString();
                                });
                              },
                              activeColor: purpleColor,
                            ),
                            Flexible(
                              child: Text(
                                S.of(context).createNewPost,
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: (_selectedPlatform == S.of(context).instagram ||
                                        _selectedPlatform == S.of(context).tiktok ||
                                        _selectedPlatform == S.of(context).google ||
                                        _selectedPlatform == S.of(context).youtube)
                                        ? Colors.grey
                                        : purpleColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              if (_selectedOption == 'current') ...[
                TextField(
                  controller: _postLinkController,
                  decoration: InputDecoration(
                    labelText: _selectedPlatform == S.of(context).google
                        ? S.of(context).pageLink
                        : _selectedPlatform == S.of(context).youtube
                        ? S.of(context).videoLink
                        : S.of(context).postLink,
                    labelStyle: TextStyle(color: purpleColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (_selectedPlatform == S.of(context).instagram) ...[
                  Text(
                    S.of(context).instagramAdInfo,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextField(
                    controller: _pageLinkController,
                    decoration: InputDecoration(
                      labelText: S.of(context).pageLink,
                      labelStyle: TextStyle(color: purpleColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
                if (_selectedPlatform == S.of(context).facebookAndInstagram) ...[
                  Text(
                    S.of(context).facebookAndInstagramAdInfo,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 16),
                ],
                if (_selectedPlatform == S.of(context).tiktok) ...[
                  Text(
                    S.of(context).tiktokAdInfo,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextField(
                    controller: _adCodeController,
                    decoration: InputDecoration(
                      labelText: S.of(context).currentAdCode,
                      labelStyle: TextStyle(color: purpleColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    S.of(context).adCodeInfo,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: purpleColor),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            launch('https://vt.tiktok.com/ZSYa39AnH');
                          },
                          child: Text(
                            'https://vt.tiktok.com/ZSYa39AnH',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy, color: Colors.black),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: 'https://vt.tiktok.com/ZSYa39AnH'));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(S.of(context).linkCopied)));
                        },
                      ),
                    ],
                  ),
                ],
                if (_postLink != null) ...[
                  Text(
                    _selectedPlatform == S.of(context).google
                        ? S.of(context).pageLink
                        : _selectedPlatform == S.of(context).youtube
                        ? S.of(context).videoLink
                        : S.of(context).postLink,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (_postLink != null) {
                              _launchURL(_postLink!);
                            }
                          },
                          child: Text(
                            _postLink!,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearPostLink,
                      ),
                    ],
                  ),
                ],
                if (_pageLink != null &&
                    (_selectedPlatform == S.of(context).instagram ||
                        _selectedPlatform == S.of(context).facebookAndInstagram)) ...[
                  Text(S.of(context).currentPageLink,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (_pageLink != null) {
                              _launchURL(_pageLink!);
                            }
                          },
                          child: Text(
                            _pageLink!,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearPostLink,
                      ),
                    ],
                  ),
                ],
                if (_adCode != null && _selectedPlatform == S.of(context).tiktok) ...[
                  Text(S.of(context).currentAdCode,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _adCode!,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear, color: Colors.red),
                        onPressed: _clearPostLink,
                      ),
                    ],
                  ),
                ],
              ],
              if (_selectedOption == 'new') ...[
                TextField(
                  controller: _postContentController,
                  decoration: InputDecoration(
                    labelText: S.of(context).postContent,
                    labelStyle: TextStyle(color: purpleColor),
                    hintText: S.of(context).enterPostContent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
                    ),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        S.of(context).selectImages,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: purpleColor),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_file, color: purpleColor),
                      onPressed: _pickImages,
                    ),
                  ],
                ),
                if (_isUploading)
                  Text(
                    _uploadStatus,
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  children: _imageNames.asMap().entries.map((entry) {
                    int index = entry.key;
                    String name = entry.value;
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  name,
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.clear, color: Colors.red),
                                onPressed: () => _removeImage(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
              ],
              ElevatedButton(
                onPressed: _savePost,
                child: Text(S.of(context).save,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//lib/screens/wallet/vodafone_cash_transfer_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../home_page.dart';
import 'package:untitled5/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VodafoneCashTransferPage extends StatefulWidget {
  final String amount;
  final String originalAmount;

  VodafoneCashTransferPage({
    required this.amount,
    required this.originalAmount,
  });

  @override
  _VodafoneCashTransferPageState createState() => _VodafoneCashTransferPageState();
}

class _VodafoneCashTransferPageState extends State<VodafoneCashTransferPage> {
  File? _file;
  Uint8List? _webFileBytes;
  String? _fileName;
  String? _uploadedFileURL;
  String? _uploadStatus;
  TextEditingController _noteController = TextEditingController();
  static const Color purpleColor = Color(0xFF800080);
  bool _showErrorMessage = false;
  bool _showAttachmentErrorMessage = false;

  List<XFile> _selectedImages = [];
  List<Uint8List> _selectedImageData = [];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userDoc = await FirebaseFirestore.instance.collection('clients').doc(userId).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(
          userData?['firstName'] ?? '',
          userData?['lastName'] ?? '',
          userData?['email'] ?? '',
          userId,
          userData?['phone'] ?? '',
        );
      }
    }
  }

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _selectedImages = pickedFiles;
        _uploadStatus = 'جاري رفع الملفات...';
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
    FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://birdy-d8157.appspot.com');
    for (var i = 0; i < _selectedImages.length; i++) {
      var image = _selectedImages[i];
      var imageData = _selectedImageData[i];
      String fileName = image.name;
      Reference storageRef = storage.ref().child(fileName); // رفع الصورة مباشرة بدون تحديد فولدر
      await storageRef.putData(imageData);
      String downloadURL = await storageRef.getDownloadURL();
      uploadedUrls.add(downloadURL);
    }
    setState(() {
      _uploadedFileURL = uploadedUrls.isNotEmpty ? uploadedUrls.first : null;
      _uploadStatus = _uploadedFileURL != null ? 'تم رفع الملفات بنجاح' : 'فشل في رفع الملفات';
    });
  }

  Future<void> _submitData() async {
    if (_noteController.text.isEmpty || _uploadedFileURL == null) {
      setState(() {
        _showErrorMessage = _noteController.text.isEmpty;
        _showAttachmentErrorMessage = _uploadedFileURL == null;
      });
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    String note = _noteController.text;
    String amountWithoutDecimal = double.parse(widget.amount).toInt().toString();

    try {
      await FirebaseFirestore.instance.collection('transactions').add({
        'amount': amountWithoutDecimal,
        'amount_required': widget.originalAmount,
        'note': note,
        'screenshotUrl': _uploadedFileURL,
        'firstName': userProvider.firstName,
        'lastName': userProvider.lastName,
        'email': userProvider.email,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'تحويل جديد',
      });

      await FirebaseFirestore.instance.collection('notifications').add({
        'message': S.of(context).funds_request_in_progress,
        'firstName': userProvider.firstName,
        'lastName': userProvider.lastName,
        'email': userProvider.email,
        'sender': 'customer',
        'timestamp': FieldValue.serverTimestamp(),
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).request_received),
            content: Text(S.of(context).funds_will_be_added),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('\${S.of(context).data_save_failure}: $e')),
      );
    }
  }

  void _removeFile() {
    setState(() {
      _file = null;
      _webFileBytes = null;
      _fileName = null;
      _uploadStatus = null;
      _uploadedFileURL = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    String amountWithoutDecimal = double.parse(widget.amount).toInt().toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).choose_transfer_method, style: TextStyle(color: Colors.white)),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('vodaphone cash').doc('bFZ6nQi8DtndIYZKFpqN').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var data = snapshot.data!.data() as Map<String, dynamic>;
                var vodafoneCashNumber = data['number cash'] as String;
                var instapayNumber = data['instapay number'] as String;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWithText(
                      icon: Icons.mobile_friendly,
                      label: S.of(context).transfer_via_vodafone_cash,
                      phoneNumber: vodafoneCashNumber,
                      note: S.of(context).transfer_note,
                      iconData: Icons.copy,
                      copyText: S.of(context).copy,
                    ),
                    SizedBox(height: 20),
                    IconWithText(
                      icon: Icons.account_balance_wallet,
                      label: S.of(context).transfer_via_instapay,
                      phoneNumber: instapayNumber,
                      note: S.of(context).transfer_note_instapay,
                      iconData: Icons.copy,
                      copyText: S.of(context).copy,
                    ),
                    SizedBox(height: 20),
                    SupportButton(),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                labelText: S.of(context).transferred_amount,
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
              readOnly: true,
              controller: TextEditingController(text: amountWithoutDecimal),
            ),
            SizedBox(height: 20),
            Text(
              S.of(context).transfer_exact_amount_note,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 20),
            AttachmentNote(
              onFilePicked: _pickImages,
              onRemoveFile: _removeFile,
              fileName: _fileName,
              uploadStatus: _uploadStatus,
            ),
            if (_showAttachmentErrorMessage)
              Text(
                S.of(context).attachment_required,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context).phone_or_instapay,
              ),
              maxLines: 1,
            ),
            if (_showErrorMessage)
              Text(
                S.of(context).transfer_note_error,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitData,
                child: Text(S.of(context).submit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String label;
  final String phoneNumber;
  final String note;
  final IconData iconData;
  final String copyText;
  static const Color purpleColor = Color(0xFF800080);

  const IconWithText({
    required this.icon,
    required this.label,
    required this.phoneNumber,
    required this.note,
    required this.iconData,
    required this.copyText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 50, color: purpleColor),
            SizedBox(width: 10),
            Text(label, style: TextStyle(fontSize: 18, color: purpleColor)),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(phoneNumber, style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(iconData, color: purpleColor),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: phoneNumber));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).copied)),
                );
              },
            ),
            Text(copyText, style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(note, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class SupportButton extends StatelessWidget {
  static const Color purpleColor = Color(0xFF800080);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.support, color: Colors.white),
      label: Text(S.of(context).support),
      style: ElevatedButton.styleFrom(
        backgroundColor: purpleColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

class AttachmentNote extends StatelessWidget {
  final Function onFilePicked;
  final Function onRemoveFile;
  final String? fileName;
  final String? uploadStatus;
  static const Color purpleColor = Color(0xFF800080);

  const AttachmentNote({
    required this.onFilePicked,
    required this.onRemoveFile,
    this.fileName,
    this.uploadStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.attachment, color: purpleColor, size: 30),
              onPressed: () => onFilePicked(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: fileName != null
                  ? Row(
                children: [
                  Text(fileName!),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () => onRemoveFile(),
                  ),
                ],
              )
                  : Text(S.of(context).attachment_note, style: TextStyle(fontSize: 14, color: purpleColor)),
            ),
          ],
        ),
        if (uploadStatus != null)
          Text(
            uploadStatus!,
            style: TextStyle(fontSize: 14, color: uploadStatus == 'تم رفع الملفات بنجاح' ? Colors.green : Colors.red),
          ),
      ],
    );
  }
}
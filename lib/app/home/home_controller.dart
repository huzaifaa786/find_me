import 'dart:io';

import 'package:find_me/utils/images/ui_utils/ui_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  File? pdfFile;
  File? videoFile;
  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";

  bool isSearching = false;

  var dropdownItems = <DropdownItem>[];

  DropdownItem selectedItem = DropdownItem(
    avatarUrl:
        'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
    text: 'Almarwan General Trd',
    verified: true,
  );

  @override
  void onInit() {
    dropdownItems.addAll([
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/fcf9fc/2847e0.png',
        text: 'Mohammed Abdullah',
        verified: true,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/a323a3/2847e0.png',
        text: 'Mohammed x3',
        verified: false,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/4dd620/2847e0.png',
        text: 'Ramei 6666',
        verified: true,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/fcf9fc/2847e0.png',
        text: 'Mohammed',
        verified: true,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/a323a3/2847e0.png',
        text: 'Mohammed x3333',
        verified: false,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/4dd620/28470.png',
        text: 'Ramei 9999999',
        verified: true,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/fcf9fc/2847e0.png',
        text: 'Mohammed 101010101',
        verified: true,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/a323a3/2847e0.png',
        text: 'Mohammed x343434',
        verified: false,
      ),
      DropdownItem(
        avatarUrl: 'https://dummyimage.com/600x400/4dd620/2847e0.png',
        text: 'Ramei 9898989',
        verified: true,
      ),
    ]);
    super.onInit();
  }

  void selectItem(DropdownItem item) {
    selectedItem = item;
    update();
  }

  Future<void> openDocumentPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Picked file: ${file.name}');
      // Handle the selected file
    } else {
      // User canceled the picker
    }
  }

  // Future getImage() async {
  //   ImagePicker imagePicker = ImagePicker();
  //   XFile? pickedFile = await imagePicker
  //       .pickImage(source: ImageSource.gallery)
  //       .catchError((err) {
  //     UiUtilites.errorSnackbar('Error'.tr, err.toString());
  //     return null;
  //   });
  //   if (pickedFile != null) {
  //     imageFile = File(pickedFile.path);
  //     if (imageFile != null) {
  //       bool userConfirmed = await showConfirmationDialog(Get.context!);
  //       if (userConfirmed) {
  //         // setState
  //         (() {
  //           isLoading = true;
  //         });
  //         uploadFile();
  //       }
  //     }
  //   }
  // }

//  Future getPdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     print(result);
//     if (result != null) {
//       List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();
//       if (pickedFiles.isNotEmpty) {
//         pdfFile = pickedFiles.first;
//         String? fileName = result.files.first.name;
//         bool userConfirmed = await showConfirmationDialog(Get.context!);
//         if (userConfirmed) {
//           // setState(() {
//           //   isLoading = true;
//           // });
//           uploadPdf(pdfFile!, fileName);
//         }
//       }
//     }
//   }

//   Future getMp4() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp4'],
//     );

//     if (result != null) {
//       List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();
//       if (pickedFiles.isNotEmpty) {
//         videoFile = pickedFiles.first;
//         String? fileName = result.files.first.name;
//         bool userConfirmed = await showConfirmationDialog(Get.context!);
//         if (userConfirmed) {
//           // setState
//           (() {
//             isLoading = true;
//           });
//           uploadVideo(videoFile!, fileName);
//         }
//       }
//     }
//   }

//   Future uploadVideo(File videoFile, String fileName) async {
//     UploadTask uploadTask = chatProvider.uploadVideo(videoFile, fileName);
//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       String videoUrl = await snapshot.ref.getDownloadURL();
//       print(videoUrl);
//       setState(() {
//         isLoading = false;
//         onSendMessage(videoUrl, TypeMessage.video);
//       });
//       Get.back();
//     } on FirebaseException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       Get.back();
//       print(e);
//     }
//   }

//   Future uploadPdf(File pdfFile, String fileName) async {
//     UploadTask uploadTask = chatProvider.uploadPdf(pdfFile, fileName);
//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       String pdfUrl = await snapshot.ref.getDownloadURL();
//       print(pdfUrl);
//       setState(() {
//         isLoading = false;
//         onSendMessage(pdfUrl, TypeMessage.document);
//       });
//       Get.back();
//     } on FirebaseException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       Get.back();
//       print(e);
//     }
//   }

//   Future uploadFile() async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     UploadTask uploadTask = chatProvider.uploadFile(imageFile!, fileName);
//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       imageUrl = await snapshot.ref.getDownloadURL();
//       setState(() {
//         isLoading = false;
//         onSendMessage(imageUrl, TypeMessage.image);
//       });
//       Get.back();
//     } on FirebaseException catch (e) {
//       setState(() {
//         isLoading = false;
//       });

//       print(e);
//       Get.back();
//       // Fluttertoast.showToast(msg: e.message ?? e.toString());
//     }
//   }

  // // Method to pick a video from the gallery
  // Future<void> pickVideo() async {
  //   final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
  //   if (video != null) {
  //     // Do something with the picked video
  //     print("Picked Video: ${video.path}");
  //   }
  // }
}

class DropdownItem {
  final String avatarUrl;
  final String text;
  final bool verified;

  DropdownItem({
    required this.avatarUrl,
    required this.text,
    required this.verified,
  });
}

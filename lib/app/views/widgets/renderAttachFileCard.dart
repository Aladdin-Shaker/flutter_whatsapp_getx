import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/views/widgets/bottomSheetIcon.dart';

class RenderAttachDataCard extends StatelessWidget {
  const RenderAttachDataCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isDismissible: true,
            context: context,
            builder: (builder) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BottomSheetIcon(
                            color: Colors.indigo,
                            icon: Icon(
                              Icons.insert_drive_file,
                            ),
                            text: 'Document',
                          ),
                          SizedBox(width: 40),
                          BottomSheetIcon(
                            color: Colors.pink,
                            icon: Icon(
                              Icons.camera_alt,
                            ),
                            text: 'Camera',
                          ),
                          SizedBox(width: 40),
                          BottomSheetIcon(
                            color: Colors.purple,
                            icon: Icon(
                              Icons.insert_photo,
                            ),
                            text: 'Gallery',
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BottomSheetIcon(
                            color: Colors.orange,
                            icon: Icon(Icons.headset_rounded),
                            text: 'Audio',
                          ),
                          SizedBox(width: 40),
                          BottomSheetIcon(
                            color: Colors.green,
                            icon: Icon(
                              Icons.location_pin,
                            ),
                            text: 'Location',
                          ),
                          SizedBox(width: 40),
                          BottomSheetIcon(
                            color: Colors.blue,
                            icon: Icon(
                              Icons.person,
                            ),
                            text: 'Contact',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: Icon(Icons.attach_file_rounded),
      color: Color(0xFF128C7E),
    );
  }
}

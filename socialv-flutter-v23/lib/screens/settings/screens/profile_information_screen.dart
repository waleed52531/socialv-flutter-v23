import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/components/loading_widget.dart';
import 'package:socialv/main.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';
import 'package:socialv/screens/profile/model/profile_info_model.dart';


class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.personalInfo, style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.iconColor),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: StreamBuilder<List<UserInfo>>(
        stream: readUsers('${appStore.loginEmail}'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }

  Widget buildUser(UserInfo user) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 20.0,bottom: 5.0),
                child: CustomText(label: "Basic Information",fontweight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Name'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.name,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      //TODO check karny k liay comment kia ha
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Gender'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.gender,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Birthday'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.date,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      //TODO check karny k liay comment kia ha
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Location'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.location,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Biography'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.biography,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 20.0,bottom: 5.0),
                child: CustomText(label: "Personal Data",fontweight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(label: 'Phone'),
                          Spacer(),
                          Expanded(
                            child: CustomText(label: user.phone,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Email'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.email,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'address'),
                          SizedBox(width: 100),
                          Expanded(child: CustomText(label: user.address,
                              overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'martial status'),
                          SizedBox(width: 100),
                          Expanded(child: CustomText(label: user.martialstatus,
                              overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Emergency Contact'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.emergency_contact,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'CNIC'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.cnic,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Academic Qualification'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.academic_qualification,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Blood Group'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.blood_group,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Next of Kin'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.nik,
                              overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 20.0,bottom: 5.0),
                child: CustomText(label: "Professional Information",fontweight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Staff No'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.staffno,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Grading'),
                          SizedBox(width: 100),
                          Expanded(
                            child: CustomText(label: user.grading,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'License'),
                          SizedBox(width: 100),
                          Expanded(child: CustomText(label: user.license,
                              overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Apes'),
                          Expanded(
                            child: CustomText(label: user.apes,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Designation'),
                          Expanded(
                            child: CustomText(label: user.designation,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Date of Joining'),
                          Expanded(
                            child: CustomText(label: user.joining_date,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Date of Retirement'),
                          Expanded(
                            child: CustomText(label: user.retierment_date,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Date of Utilization'),
                          Expanded(
                            child: CustomText(label: user.utilization_date,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Station of posting'),
                          Expanded(
                            child: CustomText(label: user.posting_station,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Professional Qualification'),
                          Expanded(
                            child: CustomText(label: user.qualification,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Company'),
                          Expanded(
                            child: CustomText(label: user.company,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Department'),
                          Expanded(
                            child: CustomText(label: user.department,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Division'),
                          Expanded(
                            child: CustomText(label: user.division,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'section'),
                          Expanded(
                            child: CustomText(label: user.section,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

              ),

            ],
          ),
        ),
      );

  Stream<List<UserInfo>> readUsers(String id) => FirebaseFirestore.instance
      .collection('users')
      .where(FieldPath.documentId, isEqualTo: id)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => UserInfo.fromJson(doc.data())).toList());
}
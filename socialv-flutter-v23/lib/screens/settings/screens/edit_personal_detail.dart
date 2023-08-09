import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/main.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';
import 'package:socialv/screens/profile/components/custom_textfield.dart';
import 'package:socialv/screens/profile/model/profile_info_model.dart';
import 'package:socialv/utils/colors.dart';
import 'package:socialv/utils/common.dart';

import '../../profile/components/custom_dropdown.dart';

class EditPersonalDetail extends StatefulWidget {
  EditPersonalDetail({Key? key}) : super(key: key);
  var dropDownItemsMStatus = ["Single","Married"];
  var dropDownItemsGender = ["Male","Female"];
  var dropDownItemsBlood = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  var dropDownItemsCity = [ "Islamabad", "Ahmed Nager", "Ahmadpur East", "Ali Khan", "Alipur", "Arifwala",
    "Attock", "Bhera", "Bhalwal", "Bahawalnagar", "Bahawalpur", "Bhakkar", "Burewala", "Chillianwala",
    "Chakwal", "Chichawatni", "Chiniot", "Chishtian", "Daska", "Darya Khan", "Dera Ghazi", "Dhaular",
    "Dina", "Dinga", "Dipalpur", "Faisalabad", "Fateh Jhang", "Ghakhar Mandi", "Gojra", "Gujranwala",
    "Gujrat", "Gujar Khan", "Hafizabad", "Haroonabad", "Hasilpur", "Haveli", "Lakha", "Jalalpur",
    "Jattan", "Jampur", "Jaranwala", "Jhang", "Jhelum", "Kalabagh", "Karor Lal", "Kasur", "Kamalia",
    "Kamoke", "Khanewal", "Khanpur", "Kharian", "Khushab", "Kot Adu", "Jauharabad", "Lahore", "Lalamusa",
    "Layyah", "Liaquat Pur", "Lodhran", "Malakwal", "Mamoori", "Mailsi", "Mandi Bahauddin", "mian Channu",
    "Mianwali", "Multan", "Murree", "Muridke", "Mianwali Bangla", "Muzaffargarh", "Narowal", "Okara",
    "Renala Khurd", "Pakpattan", "Pattoki", "Pir Mahal", "Qaimpur", "Qila Didar", "Rabwah", "Raiwind",
    "Rajanpur", "Rahim Yar", "Rawalpindi", "Sadiqabad", "Safdarabad", "Sahiwal", "Sangla Hill",
    "Sarai Alamgir", "Sargodha", "Shakargarh", "Sheikhupura", "Sialkot", "Sohawa", "Soianwala",
    "Siranwali", "Talagang", "Taxila", "Toba Tek", "Vehari", "Wah Cantonment", "Wazirabad", "Badin",
    "Bhirkan", "Rajo Khanani", "Chak", "Dadu", "Digri", "Diplo", "Dokri", "Ghotki", "Haala", "Hyderabad",
    "Islamkot", "Jacobabad", "Jamshoro", "Jungshahi", "Kandhkot", "Kandiaro", "Karachi", "Kashmore",
    "Keti Bandar", "Khairpur", "Kotri", "Larkana", "Matiari", "Mehar", "Mirpur Khas", "Mithani", "Mithi",
    "Mehrabpur", "Moro", "Nagarparkar", "Naudero", "Naushahro Feroze", "Naushara", "Nawabshah",
    "Nazimabad", "Qambar", "Qasimabad", "Ranipur", "Ratodero", "Rohri", "Sakrand", "Sanghar",
    "Shahbandar", "Shahdadkot", "Shahdadpur", "Shahpur Chakar", "Shikarpaur", "Sukkur",
    "Tangwani", "Tando Adam", "Tando Allahyar", "Tando Muhammad", "Thatta", "Umerkot", "Warah",
    "Abbottabad", "Adezai", "Alpuri", "Akora Khattak", "Ayubia", "Banda Daud", "Bannu", "Batkhela",
    "Battagram", "Birote", "Chakdara", "Charsadda", "Chitral", "Daggar", "Dargai", "Darya Khan",
    "dera Ismail", "Doaba", "Dir", "Drosh", "Hangu", "Haripur", "Karak", "Kohat", "Kulachi",
    "Lakki Marwat", "Latamber", "Madyan", "Mansehra", "Mardan", "Mastuj", "Mingora", "Nowshera",
    "Paharpur", "Pabbi", "Peshawar", "Saidu Sharif", "Shorkot", "Shewa Adda", "Swabi", "Swat",
    "Tangi", "Tank", "Thall", "Timergara", "Tordher", "Awaran", "Barkhan", "Chagai", "Dera Bugti",
    "Gwadar", "Harnai", "Jafarabad", "Jhal Magsi", "Kacchi", "Kalat", "Kech", "Kharan", "Khuzdar",
    "Killa Abdullah", "Killa Saifullah", "Kohlu", "Lasbela", "Lehri", "Loralai", "Mastung", "Musakhel"
    , "Nasirabad", "Nushki", "Panjgur", "Pishin valley", "Quetta", "Sherani", "Sibi", "Sohbatpur", "Washuk", "Zhob", "Ziarat" ];
  var dropDownItemsDesignation = ['Aircraft Engineer ','Deputy Chief Engineer','Chief Engineer',
    'Chief Technical Officer','Instructor ','Senior Instructor','Chief Instructor'];
  var dropDownItemsStation = [ "Islamabad", "Karachi ", "Lahore ", "Multan ", "Sialkot", "Quetta ",
    "Faislabad ", "Peshawar ", "Sukkur ", "Skardu ", "Jeddah ", "Dammam ", "Riyadh ", "Dubai",
    "Abudhabi ", "Muscat", "Toronto", "Istanbul"];
  var dropDownItemsAEPS = ['AEPS A','AEPS B','AEPS C', 'AEPS D','AEPS E','AEPS F', 'AEPS G', 'AEPS SP'];

  @override
  State<EditPersonalDetail> createState() => _EditPersonalDetailState();
}

class _EditPersonalDetailState extends State<EditPersonalDetail> {
  String? selectedGender;
  String? selectedlocation;
  String? selectedstatus;
  String? selectedgroup;
  String? selecteddesignation;
  String? selectedstation;
  String? selectedaeps;


  String fullName = '';
  String emailAddress = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController biographyController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController nikController = TextEditingController();

  //professional info
  TextEditingController staffNoController = TextEditingController();
  TextEditingController gradingController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController apesController = TextEditingController();
  TextEditingController dojController = TextEditingController();
  TextEditingController dorController = TextEditingController();
  TextEditingController douController = TextEditingController();
  TextEditingController pqController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController divController = TextEditingController();
  TextEditingController secController = TextEditingController();

  /*@override
  void initState() {
    super.initState();
    nameController.text = appStore.loginFullName;
    emailController.text = appStore.loginEmail;
  }
*/





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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(label: 'Basic Information', fontweight: FontWeight.bold,),
            ),
            //name
            CustomTextFormField(
              enable: false,
              controller: nameController,
              textInputAction: TextInputAction.next,
              placeholder: appStore.loginFullName,
              prefixIcon: const Icon(
                Icons.person,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.name,
              onChanged: (text) {
                fullName = text;
              },
            ),
            SizedBox(height: 10),
            //Gender
            CustomDropDown(dropDownItems: widget.dropDownItemsGender,
              prefixIcon: Icon(Icons.perm_identity),
              labelText: "Gender",
              showSearch: true,
              title: "Gender",
              onChanged: (value){
                setState(() {
                  selectedGender = value;
                });
              },),
            //DD/MM/YYYY
            CustomTextFormField(
              enable: true,
              controller: dateController,
              textInputAction: TextInputAction.next,
              placeholder: "Date",
              prefixIcon: const Icon(
                Icons.date_range,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.green, // Change the primary color to your desired color
                        accentColor: Colors.green, // Change the accent color to your desired color
                        colorScheme: ColorScheme.light(primary: Colors.green), // Change the color scheme to your desired color
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formattedDate = formatter.format(picked);
                  setState(() {
                    dateController.text = formattedDate;
                  });
                }
              }, onChanged: (value){
              setState(() {
                dateController.text = value;
              });
            },
            ),
            SizedBox(height: 10),
            //location
            CustomDropDown(dropDownItems: widget.dropDownItemsCity,
              prefixIcon: Icon(Icons.location_on_outlined),
              labelText: "Location",
              showSearch: true, title: "Location",
              onChanged: (value){
                setState(() {
                  selectedlocation = value;
                });
              },),
            //Biography
            CustomTextFormField(
              enable: true,
              controller: biographyController,
              textInputAction: TextInputAction.next,
              placeholder: "Biography",
              prefixIcon: const Icon(
                Icons.person,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1, // thickness of the line
              color: Colors.black, // The color to use when painting the line.
              indent: 10, // empty space to the leading edge of divider.
              endIndent: 10, // empty space to the trailing edge of the divider.
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(label: 'Personal Data', fontweight: FontWeight.bold,),
            ),
            //Phone
            CustomTextFormField(
              enable: true,
              controller: phoneController,
              textInputAction: TextInputAction.next,
              placeholder: "Phone",
              maxlength: 11,
              prefixIcon: const Icon(
                Icons.phone,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.number,
              onChanged: () {},
            ),
            //email
            CustomTextFormField(
              enable: false,
              controller: emailController,
              textInputAction: TextInputAction.next,
              placeholder: appStore.loginEmail,
              prefixIcon: const Icon(
                Icons.email,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) {
                emailAddress = text;
              },
            ),

            //martialstatus
            CustomDropDown(dropDownItems: widget.dropDownItemsMStatus,
                prefixIcon: Icon(Icons.person_2_outlined),
                labelText: "MartialStatus",
                showSearch: true,
                onChanged: (value){
                  setState(() {
                    selectedstatus = value;
                  });
                },
                title: "Martial Status"),
            //address
            CustomTextFormField(
              enable: true,
              controller: addressController,
              textInputAction: TextInputAction.next,
              placeholder: "Address",
              prefixIcon: const Icon(
                Icons.add_home_work_outlined,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.streetAddress,
              onChanged: () {},
            ),
            //emergency contact
            CustomTextFormField(
              enable: true,
              controller: emergencyContactController,
              textInputAction: TextInputAction.next,
              placeholder: "Emergency Contact",
              prefixIcon: const Icon(
                Icons.contact_page_outlined,
                color: appColorPrimary,
              ),
              obscureText: false,
              maxlength: 11,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.number,
              onChanged: () {},
            ),
            //cnic
            CustomTextFormField(
              enable: true,
              controller: cnicController,
              textInputAction: TextInputAction.next,
              placeholder: "CNIC",
              maxlength: 13,
              prefixIcon: const Icon(
                Icons.perm_contact_calendar_outlined,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.number,
              onChanged: () {},
            ),
            //academic qualification
            CustomTextFormField(
              enable: true,
              controller: qualificationController,
              textInputAction: TextInputAction.next,
              placeholder: "Academic Qualification ",
              prefixIcon: const Icon(
                Icons.menu_book,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //Blood group
            SizedBox(height: 10),
            CustomDropDown(dropDownItems: widget.dropDownItemsBlood,
              prefixIcon: Icon(Icons.perm_identity),
              labelText: "BloodGroup",
              showSearch: true,
              title: "BloodGroup",
              onChanged: (value){
                setState(() {
                  selectedgroup = value;
                });
              },),
            //Next Of Kin
            CustomTextFormField(
              enable: true,
              controller: nikController,
              textInputAction: TextInputAction.next,
              placeholder: "Next Of Kin",
              prefixIcon: const Icon(
                Icons.abc,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1, // thickness of the line
              color: Colors.black, // The color to use when painting the line.
              indent: 10, // empty space to the leading edge of divider.
              endIndent: 10, // empty space to the trailing edge of the divider.
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(label: 'Professional Information', fontweight: FontWeight.bold,),
            ),
            //staff No
            CustomTextFormField(
              enable: true,
              controller: staffNoController,
              textInputAction: TextInputAction.next,
              placeholder: "Staff No.",
              prefixIcon: const Icon(
                Icons.numbers,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //grading
            CustomTextFormField(
              enable: true,
              controller: gradingController,
              textInputAction: TextInputAction.next,
              placeholder: "Grading",
              prefixIcon: const Icon(
                Icons.grade,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //License/Approval Number
            CustomTextFormField(
              enable: true,
              controller: licenseController,
              textInputAction: TextInputAction.next,
              placeholder: "License/Approval Number",
              prefixIcon: const Icon(
                Icons.credit_card,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //Date last change of Apes
            CustomDropDown(dropDownItems: widget.dropDownItemsAEPS,
                prefixIcon: Icon(Icons.design_services),
                labelText: "AEPS",
                showSearch: true,
                onChanged: (value){
                  setState(() {
                    selectedaeps = value;
                  });
                },
                title: "AEPS"),

            //Designation
            CustomDropDown(dropDownItems: widget.dropDownItemsDesignation,
                prefixIcon: Icon(Icons.design_services),
                labelText: "Designation",
                showSearch: true,
                onChanged: (value){
                  setState(() {
                    selecteddesignation = value;
                  });
                },
                title: "Designation"),
            //Date of joining
            CustomTextFormField(
              enable: true,
              controller: dojController,
              textInputAction: TextInputAction.next,
              placeholder: "Date of joining",
              prefixIcon: const Icon(
                Icons.date_range_sharp,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.green, // Change the primary color to your desired color
                        accentColor: Colors.green, // Change the accent color to your desired color
                        colorScheme: ColorScheme.light(primary: Colors.green), // Change the color scheme to your desired color
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formattedDate = formatter.format(picked);
                  setState(() {
                    dojController.text =formattedDate;
                  });
                }
              }, onChanged: (value){
              setState(() {
                dojController.text = value;
              });
            },
            ),
            //Date of Retirement
            CustomTextFormField(
              enable: true,
              controller: dorController,
              textInputAction: TextInputAction.next,
              placeholder: "Date of Retirement",
              prefixIcon: const Icon(
                Icons.date_range_sharp,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.green, // Change the primary color to your desired color
                        accentColor: Colors.green, // Change the accent color to your desired color
                        colorScheme: ColorScheme.light(primary: Colors.green), // Change the color scheme to your desired color
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formattedDate = formatter.format(picked);
                  setState(() {
                    dorController.text =formattedDate;
                  });
                }
              }, onChanged: (value){
              setState(() {
                dorController.text = value;
              });
            },
            ),
            //Date of Utilization
            CustomTextFormField(
              enable: true,
              controller: douController,
              textInputAction: TextInputAction.next,
              placeholder: "Date of Utilization",
              prefixIcon: const Icon(
                Icons.upcoming,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.green, // Change the primary color to your desired color
                        accentColor: Colors.green, // Change the accent color to your desired color
                        colorScheme: ColorScheme.light(primary: Colors.green), // Change the color scheme to your desired color
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formattedDate = formatter.format(picked);
                  setState(() {
                    douController.text =formattedDate;
                  });
                }              }, onChanged: (value){
              setState(() {
                douController.text = value;
              });
            },
            ),
            //Station of Posting
            CustomDropDown(dropDownItems: widget.dropDownItemsStation,
              prefixIcon: Icon(Icons.post_add),
              labelText: "Station of Posting",
              showSearch: true,
              title: "Gender",
              onChanged: (value){
                setState(() {
                  selectedstation = value;
                });
              },),
            //Professional Qualification
            CustomTextFormField(
              enable: true,
              controller: pqController,
              textInputAction: TextInputAction.next,
              placeholder: "Professional Qualification",
              prefixIcon: const Icon(
                Icons.question_answer,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //Company
            CustomTextFormField(
              enable: true,
              controller: companyController,
              textInputAction: TextInputAction.next,
              placeholder: "Company",
              prefixIcon: const Icon(
                Icons.home_repair_service,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //department
            CustomTextFormField(
              enable: true,
              controller: departmentController,
              textInputAction: TextInputAction.next,
              placeholder: "Department",
              prefixIcon: const Icon(
                Icons.home_max,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //Division
            CustomTextFormField(
              enable: true,
              controller: divController,
              textInputAction: TextInputAction.next,
              placeholder: "Division",
              prefixIcon: const Icon(
                Icons.person,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),
            //section
            CustomTextFormField(
              enable: true,
              controller: secController,
              textInputAction: TextInputAction.next,
              placeholder: "Section",
              prefixIcon: const Icon(
                Icons.play_lesson_outlined,
                color: appColorPrimary,
              ),
              obscureText: false,
              errorEnable: false,
              errorText: "",
              keyboardType: TextInputType.text,
              onChanged: () {},
            ),

            SizedBox(height: 10),

            appButton(
              onTap: () async {
                /*     SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('nameController', nameController.text);
                await prefs.setString('dateController', dateController.text);
                await prefs.setString('gender', selectedGender ?? '');
                await prefs.setString('biographyController', biographyController.text);
                await prefs.setString('location', selectedlocation ?? '');

                await prefs.setString('phoneController', phoneController.text);
                await prefs.setString('emailController', emailController.text);
                await prefs.setString(
                    'addressController', addressController.text);
                await prefs.setString('emergencyContactController',
                    emergencyContactController.text);
                await prefs.setString('cnicController', cnicController.text);
                await prefs.setString('martial_status', selectedstatus ?? '');
                await prefs.setString(
                    'qualificationController', qualificationController.text);
                await prefs.setString(
                    'bloodGroup', selectedgroup ?? '');
                await prefs.setString('nikController', nikController.text);

                await prefs.setString(
                    'staffNoController', staffNoController.text);
                await prefs.setString(
                    'gradingController', gradingController.text);
                await prefs.setString(
                    'licenseController', licenseController.text);
                await prefs.setString('apesController', apesController.text);
                await prefs.setString(
                    'designationController', designationController.text);
                await prefs.setString('dojController', dojController.text);
                await prefs.setString('dorController', dorController.text);
                await prefs.setString('douController', douController.text);
                await prefs.setString('sopController', sopController.text);
                await prefs.setString('pqController', pqController.text);
                await prefs.setString(
                    'companyController', companyController.text);
                await prefs.setString(
                    'departmentController', departmentController.text);
                await prefs.setString('divController', divController.text);
                await prefs.setString('secController', secController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data saved in shared preferences!'),
                  ),

                );*/
                final user = UserInfo(
                  name: appStore.loginFullName,
                  date: dateController.text,
                  gender: selectedGender ?? '',
                  biography: biographyController.text,
                  location: selectedlocation ?? '',

                  phone: phoneController.text,
                  email: appStore.loginEmail,
                  martialstatus: selectedstatus ?? '',
                  address: addressController.text,
                  emergency_contact: emergencyContactController.text,
                  cnic: cnicController.text,
                  academic_qualification: qualificationController.text,
                  blood_group: selectedgroup?? '',
                  nik: nikController.text,
                  staffno: staffNoController.text,
                  grading: gradingController.text,
                  license: licenseController.text,
                  apes: selectedaeps ?? '',
                  designation: selecteddesignation ?? '',
                  joining_date: dojController.text,
                  retierment_date: dorController.text,
                  utilization_date: douController.text,
                  posting_station: selectedstation ?? '',
                  qualification: pqController.text,
                  company: companyController.text,
                  department: departmentController.text,
                  division: divController.text,
                  section: secController.text,

                );

                createUser(user);


              },
              context: context,
              text: language.saveChanges.capitalizeFirstLetter(),
            ).paddingLeft(20),

            SizedBox(height: 10),
          ],
        ),

      ),


    );
  }

  // final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserInfo user) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc("${appStore.loginEmail}");

    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved!'),
          backgroundColor: appColorPrimary,
        ),
      ),
    ).catchError((onError){
      SnackBar(
        content: Text('Error $onError)'),
        backgroundColor: appColorPrimary ,
      );
    });
  }
}

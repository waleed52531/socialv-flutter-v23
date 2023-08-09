class UserInfo {
  String id;
  String name;
  String date;
  String biography;
  String location;
  String phone;
  String email;
  String martialstatus;
  String address;
  String emergency_contact;
  String cnic;
  String academic_qualification;
  String blood_group;
  String nik;
  String staffno;
  String grading;
  String license;
  String apes;
  String designation;
  String joining_date;
  String retierment_date;
  String utilization_date;
  String posting_station;
  String qualification;
  String company;
  String department;
  String division;
  String section;
  String gender;
  UserInfo({this.id = '',

    required this.name,
    required this.date,
    required this.biography,
    required this.location,
    required this.phone,
    required this.email,
    required this.martialstatus,
    required this.address,
    required this.emergency_contact,
    required this.cnic,
    required this.academic_qualification,
    required this.blood_group,
    required this.nik,
    required this.staffno,
    required this.grading,
    required this.license,
    required this.apes,
    required this.designation,
    required this.joining_date,
    required this.retierment_date,
    required this.utilization_date,
    required this.posting_station,
    required this.qualification,
    required this.company,
    required this.department,
    required this.division,
    required this.section,
    required this.gender,
    // required this.birthday
  });

  toJson(){
    return {
    'id': id,
    'name': name,
    'date': date,
    'biography': biography,
    'location' : location,
    'phone': phone,
    'email': email,
    'martialstatus': martialstatus,
    'address': address,
    'emergency_contact': emergency_contact,
    'cnic': cnic,
    'academic_qualification': academic_qualification,
    'blood_group': blood_group,
    'nik': nik,
    'staffno': staffno,
    'grading': grading,
    'license': license,
    'apes': apes,
    'designation': designation,
    'joining_date': joining_date,
    'retierment_date': retierment_date,
    'utilization_date': utilization_date,
    'posting_station': posting_station,
    'qualification': qualification,
    'company': company,
    'department': department,
    'division': division,
    'section': section,
    'gender': gender,
  };
}

  static UserInfo fromJson(Map<String, dynamic> json) =>
      UserInfo(
        id: json['id'],
        name: json['name'],
        date : json['date'],
        biography: json['biography'],
        location: json['location'],
        phone: json['phone'],
        email: json['email'],
        martialstatus : json['martialstatus'],
        address: json['address'],
        emergency_contact: json['emergency_contact'],
        cnic: json['cnic'],
        academic_qualification: json['academic_qualification'],
        blood_group: json['blood_group'],
        nik: json['nik'],
        staffno: json['staffno'],
        grading: json['grading'],
        license: json['license'],
        apes: json['apes'],
        designation: json['designation'],
        joining_date: json['joining_date'],
        retierment_date: json['retierment_date'],
        utilization_date: json['utilization_date'],
        posting_station: json['posting_station'],
        qualification: json['qualification'],
        company: json['company'],
        department: json['department'],
        division: json['division'],
        section: json['section'],
        gender: json['gender'],
        // birthday: (json['birthday'] as Timestamp).toDate(),
      );

}


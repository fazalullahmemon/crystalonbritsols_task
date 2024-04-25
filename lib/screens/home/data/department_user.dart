class DepartmentMember {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? expiryDate;
  String? activateDate;
  bool? isAntiPassbackUser;
  bool? isAlarmUser;
  bool? hasImage;
  List<CustomFields>? customFields;

  DepartmentMember(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.expiryDate,
      this.activateDate,
      this.isAntiPassbackUser,
      this.isAlarmUser,
      this.hasImage,
      this.customFields});

  DepartmentMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    expiryDate = json['expiryDate'];
    activateDate = json['activateDate'];
    isAntiPassbackUser = json['isAntiPassbackUser'];
    isAlarmUser = json['isAlarmUser'];
    hasImage = json['hasImage'];
    if (json['customFields'] != null) {
      customFields = <CustomFields>[];
      json['customFields'].forEach((v) {
        customFields!.add(CustomFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['expiryDate'] = expiryDate;
    data['activateDate'] = activateDate;
    data['isAntiPassbackUser'] = isAntiPassbackUser;
    data['isAlarmUser'] = isAlarmUser;
    data['hasImage'] = hasImage;
    if (customFields != null) {
      data['customFields'] = customFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomFields {
  int? id;
  String? value;

  CustomFields({this.id, this.value});

  CustomFields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}

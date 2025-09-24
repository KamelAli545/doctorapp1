import 'package:flutter/material.dart';

class Governorate {
  final int id;
  final String name;

  Governorate({required this.id, required this.name});

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// نموذج المدينة
class City {
  final int id;
  final String name;
  final Governorate? governrate;

  City({required this.id, required this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      governrate: json['governrate'] != null
          ? Governorate.fromJson(json['governrate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'governrate': governrate?.toJson(),
    };
  }
}

// نموذج التخصص الطبي
class Specialization {
  final int id;
  final String name;

  Specialization({required this.id, required this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// نموذج الطبيب
class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Specialization? specialization;
  final City? city;
  final int appointPrice;
  final String startTime;
  final String endTime;
  final double rating;
  final int reviewsCount;
  String? imagePath;// local asset path
  final String? appointmentTime;
  final String? appointmentEndTime;
  final String? status;
  final String? notes;


  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    this.specialization,
    this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.imagePath,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      degree: json['degree'] ?? '',
      specialization: json['specialization'] != null
          ? Specialization.fromJson(json['specialization'])
          : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      appointPrice: json['appoint_price'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewsCount: json['reviews_count'] ?? 0,
      imagePath: null, // will assign later
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
      status: json['status'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'gender': gender,
      'address': address,
      'description': description,
      'degree': degree,
      'specialization': specialization?.toJson(),
      'city': city?.toJson(),
      'appoint_price': appointPrice,
      'start_time': startTime,
      'end_time': endTime,
      'rate':rating,
      'reviews':reviewsCount,
      'appointment_time': appointmentTime,
      'appointment_end_time': appointmentEndTime,
      'status': status,
      'notes': notes,

    };
  }
}

class SpecializationWithDoctors {
  final int id;
  final String name;
  final List<DoctorModel> doctors;

  SpecializationWithDoctors({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory SpecializationWithDoctors.fromJson(Map<String, dynamic> json) {
    var list = (json['doctors'] as List?) ?? [];
    List<DoctorModel> doctorsList =
    list.map((doctor) => DoctorModel.fromJson(doctor)).toList();

    return SpecializationWithDoctors(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      doctors: doctorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'doctors': doctors.map((doctor) => doctor.toJson()).toList(),
    };
  }
}

class ApiResponse {
  final String message;
  final List<SpecializationWithDoctors> data;
  final bool status;
  final int code;

  ApiResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = (json['data'] as List?) ?? [];
    List<SpecializationWithDoctors> dataList =
    list.map((item) => SpecializationWithDoctors.fromJson(item)).toList();

    return ApiResponse(
      message: json['message'] ?? '',
      data: dataList,
      status: json['status'] ?? false,
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'status': status,
      'code': code,
    };
  }
}
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }
}

enum NotificationType { successed, cancelled, changed }
class NotificationsModel {
  final String iconPath;
  final NotificationType type;

  final String title;
  final String description;
  final String time;
  bool isRead;

  NotificationsModel({
    required this.iconPath,
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.isRead = false
  });

  Color get iconColor {
    switch (type) {
      case NotificationType.successed:
        return Colors.green;
      case NotificationType.cancelled:
        return Colors.blue;
      case NotificationType.changed:
        return Colors.red;
    }
  }
}

import 'dart:ffi';

class RegistrationModel {
  RegistrationModel({
    required this.saveFname, 
    required this.saveMname, 
    required this.saveLname,
    required this.saveParentName, 
    required this.saveEmail,
    required this.saveMobile,
    required this.saveDOB, 
    required this.saveAddress,
    required this.saveDept, 
    required this.saveCategory, 
    required this.saveLavel,
    required this.saveProject,
    required this.saveMentor,
    required this.saveAbstract,
    required this.saveIsModel,
    required this.marks, 
  });

  final String saveFname;
  final String saveMname;
  final String saveLname;
  final String saveParentName;
  final String saveEmail;
  final String saveMobile;
  final String saveDOB;
  final String saveAddress;
  final String saveDept;
  final String saveCategory;
  final String saveLavel;
  final String saveProject;
  final String saveMentor;
  final String saveAbstract;
  final String saveIsModel;
  final List<dynamic> marks;


  factory RegistrationModel.from({required Map<String, dynamic> json}) {
    return RegistrationModel(
      saveFname : json['first_name'],
      saveMname : json['middle_name'],
      saveLname : json['last_name'],
      saveParentName : json['parent_name'],
      saveEmail : json['email'],
      saveMobile : json['phone'],
      saveDOB : json['date_of_birth'],
      saveAddress : json['address'],
      saveDept : json['department'],
      saveCategory : json['category'],
      saveLavel : json['lavel'],
      saveProject : json['project_name'],
      saveMentor : json['mentor'],
      saveAbstract : json['project_abstrac'],
      saveIsModel : json['project is ready?'],
      marks: json['myArrayField'],
    );
  }
}
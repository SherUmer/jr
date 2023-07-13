// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jr/screens/home.dart';
import 'package:jr/screens/widgets/progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase with ChangeNotifier {
  bool isLoggedIn = false;

  bool islog = false;

  Future<bool> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getString('id');
    if (id == '' || id == '0' || id == 0 || id == null) {
      isLoggedIn = false;
    } else {
      print(id);
      print('it just got true!');
      isLoggedIn = true;
      _getAuth();
    }
    notifyListeners();
    return isLoggedIn;
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    removeUser();
    isLoggedIn = false;
    notifyListeners();
  }

  Map<String, dynamic> _mapUserDetail = {};
  bool _errorUserDetail = false;
  String _errorMessageUserDetail = '';

  Map<String, dynamic> get mapUserDetail => _mapUserDetail;

  bool get errorUserDetail => _errorUserDetail;

  String get errorMessageUserDetail => _errorMessageUserDetail;

  Future<void> UserDetail(user_id) async {
    final response = await http.get(
      Uri.parse('https://jansherjr.com/API/userDetail?user_id=' + user_id),
    );
    if (response.statusCode == 200) {
      try {
        _mapUserDetail = jsonDecode(response.body);
        print(_mapUserDetail);
        _errorUserDetail = false;
      } catch (e) {
        _errorUserDetail = true;
        _errorMessageUserDetail = e.toString();
        _mapUserDetail = {};
      }
    } else {
      _errorUserDetail = true;
      _errorMessageUserDetail = 'Error : It could be your Internet connection.';
      _mapUserDetail = {};
    }
    notifyListeners();
  }

  File? Profilepicture;

  Future setProfileImage(img) async {
    Profilepicture = img;

    print('Profile picture Updating');

    notifyListeners();
  }

  // Map<String, dynamic> _mapRegister = {};
  // bool _errorRegister = false;
  // String _errorMessageRegister = '';

  // Map<String, dynamic> get mapRegister => _mapRegister;

  // bool get errorRegister => _errorRegister;

  // String get errorMessageRegister => _errorMessageRegister;

  // Future<void> userRegister(String name, String email, String password,
  //     String phone, String image) async {
  //   String completeurl = 'https://jansherjr.com/api/registration.php?name=' +
  //       name +
  //       '&email=' +
  //       email +
  //       '&password=' +
  //       password +
  //       '&phone=' +
  //       phone +
  //       '&image=' +
  //       image;
  //   print(completeurl);
  //   final response;

  //   // var response = await http.get(
  //   //   Uri.parse(completeurl),
  //   // );
  //   if (Profilepicture != null) {
  //     String base64Image = base64Encode(Profilepicture!.readAsBytesSync());
  //     String fileName = Profilepicture!.path.split("/").last;
  //     print(Profilepicture.toString() + 'picture printing');

  //     response = await http.post(Uri.parse(completeurl), body: {
  //       "image": base64Image,
  //       "name": fileName,
  //     });
  //     if (response.statusCode == 200) {
  //       print(response.body.toString() + "  printing mapregister");

  //       try {
  //         _mapRegister = jsonDecode(response.body);
  //         print(_mapRegister.toString());
  //         _errorRegister = false;
  //         if (_mapRegister.isNotEmpty && _mapRegister['message'] == "True") {
  //           print(
  //               'yes its true from db and following is printing user object.');
  //           id = _mapRegister['user']['id'];
  //           name = _mapRegister['user']['name'].toString();
  //           email = _mapRegister['user']['email'].toString();
  //           phone = _mapRegister['user']['phone'].toString();
  //           image = _mapRegister['user']['image'].toString();
  //           print(_mapRegister.toString());
  //           addAuth(id, name, email, password, phone, image);
  //         }
  //       } catch (e) {
  //         _errorRegister = true;
  //         _errorMessageRegister = e.toString();
  //         _mapRegister = {};
  //       }
  //     } else {
  //       _errorRegister = true;
  //       _errorMessageRegister = 'Error : It could be your Internet connection.';
  //       _mapRegister = {};
  //     }
  //   }

  //   notifyListeners();
  // }

  Map<String, dynamic> _mapedit_user = {};
  Map<String, dynamic> _mapaddForum = {};
  bool _erroredit_user = false;
  String _errorMessageedit_user = '';

  Map<String, dynamic> get mapedit_user => _mapedit_user;
  Map<String, dynamic> get mapaddForum => _mapaddForum;

  bool get erroredit_user => _erroredit_user;

  String get errorMessageedit_user => _errorMessageedit_user;

  Future<void> edit_user(String name, String email, String phone, String city,
      String address, String password) async {
    // ignore: prefer_interpolation_to_compose_strings
    String completeurl = 'https://jansherjr.com/api/edit_user.php?user_id=' +
        id +
        '&name=' +
        name +
        '&email=' +
        email +
        '&password=' +
        password +
        '&phone=' +
        phone +
        '&city=' +
        city +
        '&address=' +
        address;
    print(completeurl);
    final response;

    // var response = await http.get(
    //   Uri.parse(completeurl),
    // );
    // if (Profilepicture != null) {
    // String base64Image = base64Encode(Profilepicture!.readAsBytesSync());
    //String fileName = Profilepicture!.path.split("/").last;
    // print(Profilepicture.toString() + 'picture printing');

    response = await http.post(Uri.parse(completeurl), body: {
      //"name": fileName,
    });
    if (response.statusCode == 200) {
      print(response.body.toString() + "  printing mapedit_user");

      try {
        _mapedit_user = jsonDecode(response.body);
        print(_mapedit_user.toString());
        _erroredit_user = false;
        if (_mapedit_user.isNotEmpty && _mapedit_user['message'] == "True") {
          print('yes its true from db and following is printing user object.');
          name = _mapedit_user['edit_user']['name'].toString();
          email = _mapedit_user['edit_user']['email'].toString();
          phone = _mapedit_user['edit_user']['phone'].toString();
          city = _mapedit_user['edit_user']['city'].toString();
          address = _mapedit_user['edit_user']['address'].toString();
          password = _mapedit_user['edit_user']['password'].toString();
          print(_mapedit_user.toString());
          addAuth(id, name, email, password, image, phone);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('address', address);
        }
      } catch (e) {
        _erroredit_user = true;
        _errorMessageedit_user = e.toString();
        _mapedit_user = {};
      }
    } else {
      _erroredit_user = true;
      _errorMessageedit_user = 'Error : It could be your Internet connection.';
      _mapedit_user = {};
    }
    // }

    notifyListeners();
  }

  var id;
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String image = '';

  void _getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? '';
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    email = prefs.getString('email') ?? '';
    id = prefs.getString('id') ?? '';
    phone = prefs.getString('phone') ?? '';
    image = prefs.getString('image') ?? '';

    notifyListeners();
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("password");
    prefs.remove("image");
    prefs.remove("phone");
    notifyListeners();
  }

  void addAuth(id, name, email, password, image, phone) async {
    print(id + ' id is being printed');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('phone', phone);
    prefs.setString('image', image);
    print('auth added ');
    notifyListeners();
  }

  // new login
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(context, email, password) async {
    _isLoading = true;
    notifyListeners();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: 12.0,
          ),
          Text('Loading...', style: GoogleFonts.montserrat())
        ]),
      ),
    );

    // Call your login API here
    String completeUrl =
        'https://jansherjr.com/api/login.php?email=$email&password=$password';

    final response = await http.post(
      Uri.parse(completeUrl),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['message'] == 'True') {
        id = jsonResponse['user'][0]['id'].toString();
        name = jsonResponse['user'][0]['name'].toString();
        image = jsonResponse['user'][0]['image'].toString();
        phone = jsonResponse['user'][0]['phone'].toString();
        // timestamp = jsonResponse['user'][0]['timestamp'].toString();
        addAuth(id, name, email, password, image, phone);
        print('its true');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ),
            (route) => false);
        notifyListeners();
      } else {
        _isLoading = false;
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(jsonResponse['message']),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        print('its false');
      }
      print(jsonResponse);

      _isLoading = false;
      notifyListeners();
    }
  }

// new login ends

//new register starts

  void register(context, name, email, password, phone) async {
    _isLoading = true;
    notifyListeners();

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 12.0,
            ),
            Text('Loading...')
          ],
        ),
      ),
    );
    // Call your regitser API here
    String completeUrl =
        'https://jansherjr.com/api/registration.php?email=$email';

    final response = await http.post(
      Uri.parse(completeUrl),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['message'] == 'True') {
        id = jsonResponse['user']['id'].toString();
        print('printing id ' + id.toString());
        name = jsonResponse['user']['name'].toString();
        image = jsonResponse['user']['image'].toString();
        phone = jsonResponse['user']['phone'].toString();
        // timestamp = jsonResponse['user'][0]['timestamp'].toString();
        addAuth(id, name, email, password, image, phone);
        print('its true');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (route) => false);
        notifyListeners();
      } else {
        _isLoading = false;
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'User Exists / Blocked User. Contact Admin Support.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        print('its false');
      }
      print(jsonResponse);

      _isLoading = false;
      notifyListeners();
    }
  }

//new register ends

  Future<String> getImage() async {
    _getAuth();

    return image;
  }

  Future<String> getName() async {
    _getAuth();
    return name;
  }

  Future<String> getEmail() async {
    _getAuth();
    // notifyListeners();
    return email;
  }

  List<dynamic> _forums = [];
  List<dynamic> get forums {
    return _forums;
  }

  void fetchForums() async {
    print('forums being fetched.');
    try {
      final response =
          await http.get(Uri.parse('https://jansherjr.com/api/forum.php'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['forum'];
        print(jsonList.length);
        _forums = jsonList;
        notifyListeners();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  // Map<String, dynamic> _mapForums = {};
  // bool _errorForums = false;
  // String _errorMessageForums = '';

  // Map<String, dynamic> get mapForums => _mapForums;

  // bool get errorForums => _errorForums;

  // String get errorMessageForums => _errorMessageForums;

  // Future<void> get fetchForums async {
  //   final response = await http.get(
  //     Uri.parse('https://jansherjr.com/api/forum.php'),
  //   );
  //   if (response.statusCode == 200) {
  //     try {
  //       _mapForums = jsonDecode(response.body);
  //       _errorForums = false;
  //     } catch (e) {
  //       _errorForums = true;
  //       _errorMessageForums = e.toString();
  //       _mapForums = {};
  //     }
  //   } else {
  //     _errorForums = true;
  //     _errorMessageForums = 'Error : It could be your Internet connection.';
  //     _mapForums = {};
  //   }
  //   notifyListeners();
  // }

  Map<String, dynamic> _mapDiet = {};
  bool _errorDiet = false;
  String _errorMessageDiet = '';

  Map<String, dynamic> get mapDiet => _mapDiet;

  bool get errorDiet => _errorDiet;

  String get errorMessageDiet => _errorMessageDiet;

  Future<void> fetchDiet(user_id) async {
    // final String url = 'https://jansherjr.com/api/diet.php?user_id=1';
    final String url = 'https://jansherjr.com/api/diet.php?user_id=' + user_id;
    print('' + url);
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      try {
        _mapDiet = jsonDecode(response.body);
        _errorDiet = false;
      } catch (e) {
        _errorDiet = true;
        _errorMessageDiet = e.toString();
        _mapDiet = {};
      }
    } else {
      _errorDiet = true;
      _errorMessageDiet = 'Error : It could be your Internet connection.';
      _mapDiet = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapStore = {};
  bool _errorStore = false;
  String _errorMessageStore = '';

  Map<String, dynamic> get mapStore => _mapStore;

  bool get errorStore => _errorStore;

  String get errorMessageStore => _errorMessageStore;

  Future<void> get fetchStore async {
    final response = await http.get(
      Uri.parse('https://jansherjr.com/api/store.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapStore = jsonDecode(response.body);
        _errorStore = false;
      } catch (e) {
        _errorStore = true;
        _errorMessageStore = e.toString();
        _mapStore = {};
      }
    } else {
      _errorStore = true;
      _errorMessageStore = 'Error : It could be your Internet connection.';
      _mapStore = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _mapStore = {};
    _errorStore = false;
    _errorMessageStore = '';
    _mapevents = {};
    _errorevents = false;
    _errorMessageevents = '';
    _mapDiet = {};
    _errorDiet = false;
    _errorMessageDiet = '';
    _mapAddForums = {};
    _errorAddForums = false;
    _errorMessageAddForums = '';
    notifyListeners();
  }

  //add furms

  Map<String, dynamic> _mapAddForums = {};
  bool _errorAddForums = false;
  String _errorMessageAddForums = '';

  Map<String, dynamic> get mapAddForums => _mapAddForums;

  bool get errorAddForums => _errorAddForums;

  String get errorMessageAddForums => _errorMessageAddForums;
  Future<void> addForum(
    String user_id,
    String topic,
    String description,
  ) async {
    String completeurl = 'https://jansherjr.com/api/add_forum.php?user_id=' +
        user_id +
        '&topic=' +
        topic +
        '&description=' +
        description;

    print(completeurl);
    final response;

    response = await http.post(Uri.parse(completeurl), body: {});
    if (response.statusCode == 200) {
      print(response.body.toString() + "  printing mapforum");

      try {
        _mapAddForums = jsonDecode(response.body);
        print(_mapAddForums.toString());
        _errorAddForums = false;
        if (_mapAddForums.isNotEmpty && _mapAddForums['message'] == "True") {
          print('yes its true from db and following is printing user object.');
          user_id = _mapAddForums['forum']['user_id'];
          topic = _mapAddForums['forum']['topic'].toString();
          description = _mapAddForums['forum']['description'].toString();
          print(_mapAddForums.toString());
          //addAuth(id, name, topic, description, date,user_id);
        }
      } catch (e) {
        _errorAddForums = true;
        _errorMessageAddForums = e.toString();
        _mapAddForums = {};
      }
    } else {
      _errorAddForums = true;
      _errorMessageAddForums = 'Error : It could be your Internet connection.';
      _mapAddForums = {};
    }

    notifyListeners();
  }

  Map<String, dynamic> _mapcomplain = {};
  bool _errorcomplain = false;
  String _errorMessagecomplain = '';

  Map<String, dynamic> get mapcomalain => _mapcomplain;

  bool get errorcomplain => _errorcomplain;

  String get errorMessagecomplain => _errorMessagecomplain;

  Future<void> complain(String email, String issue) async {
    String completeurl = 'https://jansherjr.com/api/complain.php?email=' +
        email +
        '&issue=' +
        issue;
    print(completeurl);
    final response;
    response = await http.post(Uri.parse(completeurl));
    if (response.statuscode == 200) {
      print(response.body.toString() + 'printing comlainmap');
      try {
        _mapcomplain = jsonDecode(response.body);
        print(_mapcomplain.toString());
        _errorcomplain = false;
        if (_mapcomplain.isNotEmpty && _mapcomplain['message'] == "True") {
          print('yes its true from db and following is printing user object.');

          email = _mapcomplain['complain']['email'].toString();
          issue = _mapcomplain['complain']['issue'].toString();
          print(_mapcomplain.toString());
          //addAuth(id, name, topic, description, date,user_id);
        }
      } catch (e) {
        _errorcomplain = true;
        _errorMessagecomplain = e.toString();
        _mapcomplain = {};
      }
    } else {
      _errorcomplain = true;
      _errorMessagecomplain = 'Error : It could be your Internet connection.';
      _mapcomplain = {};
    }
  }

  Map<String, dynamic> _mapevents = {};
  bool _errorevents = false;
  String _errorMessageevents = '';

  Map<String, dynamic> get mapevents => _mapevents;

  bool get errorevents => _errorevents;

  String get errorMessageevents => _errorMessageevents;

  Future<void> get fetchevents async {
    final response = await http.get(
      Uri.parse('https://jansherjr.com/api/events'),
    );
    if (response.statusCode == 200) {
      try {
        _mapevents = jsonDecode(response.body);
        _errorevents = false;
      } catch (e) {
        _errorevents = true;
        _errorMessageevents = e.toString();
        _mapevents = {};
      }
    } else {
      _errorevents = true;
      _errorMessageevents = 'Error : It could be your Internet connection.';
      _mapevents = {};
    }
    notifyListeners();
  }
}

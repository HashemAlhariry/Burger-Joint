import 'dart:convert';
import 'package:burgerjoint/Models/branch.dart';
import 'package:http/http.dart' as http;


class GetNearestBranchController {

  static Future<Branch> getNearestBranch(String url,double lat,double long) async {
    Uri uri = Uri.parse(url+"latitude="+lat.toString()+"&longitude="+long.toString());
    final response = await http.post(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    Map<String, dynamic> convertDataToJson = json.decode(response.body);
    print(convertDataToJson);
    Branch branch = Branch(convertDataToJson['branch']['id'], convertDataToJson['branch']['latitude'] ?? 0,  convertDataToJson['branch']['longitude'] ?? 0, convertDataToJson['branch']['name'], convertDataToJson['branch']['address']);
    return branch;
  }


}
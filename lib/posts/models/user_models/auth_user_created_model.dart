import 'package:mobile_app/posts/models/permission_models/permission_model.dart';
import 'package:mobile_app/posts/models/role_models/user_roles_model.dart';

class AuthUserModel {
  final String email;
  final String name;
  final String surname;
  final String externalAuthId;
  final String id;
  final List<UserRolesModel?> roles;
  final List<PermissionModel?> permissions;

  AuthUserModel(
    this.email,
    this.name,
    this.surname,
    this.externalAuthId,
    this.id,
    this.roles,
    this.permissions,
  );

  factory AuthUserModel.fromJson(dynamic data) {
    final _email = data['email'] as String;
    final _name = data['name'] as String;
    final _surname = data['surname'] as String;
    final _externalAuthId = data['externalAuthId'] as String;
    final _id = data['id'] as String;
    final _roles = data['roles']
        .map((i) => UserRolesModel.fromJson(i))
        .toList()
        .cast<UserRolesModel>();
    final _permissions = data['permissions']
        .map((i) => PermissionModel.fromJson(i))
        .toList()
        .cast<PermissionModel>();

    return AuthUserModel(
      _email,
      _name,
      _surname,
      _externalAuthId,
      _id,
      _roles,
      _permissions,
    );
  }
}

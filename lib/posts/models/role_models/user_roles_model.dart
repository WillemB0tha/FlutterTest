class UserRolesModel {
  final String id;
  final String name;
  final String description;
  final String externalAuthId;

  UserRolesModel(this.id, this.name, this.description, this.externalAuthId);

  factory UserRolesModel.fromJson(dynamic data) {
    final _id = data['id'] as String;
    final _name = data['name'] as String;
    final _description = data['description'] as String;
    final _externalAuthId = data['externalAuthId'] as String;

    return UserRolesModel(
      _id,
      _name,
      _description,
      _externalAuthId,
    );
  }
}

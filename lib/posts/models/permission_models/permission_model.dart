class PermissionModel {
  final String id;
  final String name;
  final String description;

  PermissionModel(this.id, this.name, this.description);

  factory PermissionModel.fromJson(dynamic data) {
    final _id = data['id'] as String;
    final _name = data['name'] as String;
    final _description = data['description'] as String;

    return PermissionModel(
      _id,
      _name,
      _description,
    );
  }
}

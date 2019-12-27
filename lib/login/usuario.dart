class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map)
      : this.login = map['login'],
        this.nome = map['nome'],
        this.email = map['email'],
        this.token = map['token'],
        this.roles = getRoles(map);

  @override
  String toString() {
    // TODO: implement toString
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }

  static List<String> getRoles(Map<String, dynamic> map) {
    List list = map["roles"];
    List<String> roles =
        map != null ? list.map<String>((x) => x.toString()).toList() : null;

    /*for (String role in list) {
      roles.add(role);
    }
    */
    return roles;
  }
}

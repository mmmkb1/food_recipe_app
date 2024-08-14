abstract class Environment {
  String get welcomeMessage;
}

class DevEnvironment implements Environment {
  @override
  String get welcomeMessage => 'Hello jega';
}

class ProdEnvironment implements Environment {
  @override
  String get welcomeMessage => '안녕 jega';
}

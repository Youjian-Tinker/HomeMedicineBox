import '../../domain/services/security_gate.dart';

class FakeSecurityGate implements SecurityGate {
  const FakeSecurityGate();

  @override
  Future<bool> isProtectionEnabled() async => true;

  @override
  Future<bool> unlock() async => true;
}


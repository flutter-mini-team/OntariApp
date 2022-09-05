import '../auth_credential/auth_credential.dart';
import '../auth_credential/gmail_auth_credential.dart';

class GmailAuthProvider {
  static AuthCredential getCredential({String? accessToken}) {
    return GmailAuthCredential(accessToken: accessToken);
  }
}

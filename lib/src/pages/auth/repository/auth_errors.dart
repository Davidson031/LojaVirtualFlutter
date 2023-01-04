String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail e/ou senha inválidos';
    case 'Invalid session token':
      return 'Token invalido';
    default:
      return 'Um erro indefinido ocorreu';
  }
}

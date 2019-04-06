import 'package:cpf_cnpj_validator/cpf_validator.dart';

abstract class DocumentHandler {
  final String documentName;

  const DocumentHandler(this.documentName);

  bool validate(String document);

  String format(String document);
}

enum DocumentType { cpf, cbpq }

class CpfHandler extends DocumentHandler {
  CpfHandler() : super('CPF');

  @override
  bool validate(String document) {
    return CPFValidator.isValid(document);
  }

  @override
  String format(String document) {
    return CPFValidator.format(document);
  }
}

class CbpqHandler extends DocumentHandler {
  CbpqHandler() : super('CBPQ');
  @override
  bool validate(String document) {
    return document.length > 0 && int.tryParse(document) != null;
  }

  @override
  String format(String document) {
    return document;
  }
}

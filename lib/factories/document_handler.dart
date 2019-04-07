import 'package:cbpq/cbpq.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:cbpq/api.dart';

abstract class DocumentHandler {
  final String documentName;
  final String hint;

  const DocumentHandler(
    this.documentName,
    this.hint,
  );

  bool validate(String document);

  bool sumitValidate(String documento);

  String format(String document);

  Future<CBPQ> consultar(String document);
}

enum DocumentType { cpf, cbpq }

class CpfHandler extends DocumentHandler {
  CpfHandler() : super('CPF', '');

  @override
  bool validate(String document) {
    return CPFValidator.isValid(document);
  }

  @override
  bool sumitValidate(String document) {
    return validate(document);
  }

  @override
  String format(String document) {
    return CPFValidator.format(document);
  }

  @override
  Future<CBPQ> consultar(String document) {
    return consultarCpf(document);
  }
}

class CbpqHandler extends DocumentHandler {
  CbpqHandler() : super('CBPQ', '');
  @override
  bool validate(String document) {
    return document.length > 0 && int.tryParse(document) != null;
  }

  @override
  bool sumitValidate(String document) {
    return validate(document);
  }

  @override
  String format(String document) {
    return document;
  }

  @override
  Future<CBPQ> consultar(String document) {
    return consultarCbpq(document);
  }
}

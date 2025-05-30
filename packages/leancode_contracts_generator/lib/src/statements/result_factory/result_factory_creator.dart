import 'package:code_builder/code_builder.dart';

import '../../types/type_creator.dart';
import 'result_factory_handler.dart';

class ResultFactoryCreator {
  const ResultFactoryCreator(this.handlers, this.typeCreator);

  final List<ResultFactoryHandler> handlers;
  final TypeCreator typeCreator;

  static const paramName = 'decodedJson';

  Method create(TypeRef typeRef) {
    return Method(
      (b) => b
        ..returns = typeCreator.create(typeRef)
        ..name = 'resultFactory'
        ..lambda = true
        ..requiredParameters.add(
          Parameter(
            (b) => b
              ..name = paramName
              ..type = refer('dynamic'),
          ),
        )
        ..body = createBody(typeRef, paramName),
    );
  }

  Code createBody(TypeRef typeRef, String paramName) {
    return Code(
      ResultFactoryHandler.buildFrom(
        typeRef,
        handlers,
        paramName,
      ),
    );
  }
}

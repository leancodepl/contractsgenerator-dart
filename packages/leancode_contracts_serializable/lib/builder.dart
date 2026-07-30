import 'package:build/build.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:source_gen/source_gen.dart';

import 'src/contracts_generic_type_helper.dart';

/// json_serializable extended with [ContractsGenericTypeHelper]. Use this as a
/// dev dependency *instead of* `json_serializable` — it auto-applies and stock
/// json_serializable does not run, so no `build.yaml` is needed.
Builder contractsJsonSerializable(BuilderOptions options) => SharedPartBuilder(
      [
        JsonSerializableGenerator.withDefaultHelpers(
          const [ContractsGenericTypeHelper()],
        ),
      ],
      'contracts',
    );

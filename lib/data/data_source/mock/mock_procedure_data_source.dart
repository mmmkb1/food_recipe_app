import 'package:food_recipe_app/data/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';

class MockProcedureDataSource implements ProcedureDataSource {
  final List<Procedure> _procedures = [
    const Procedure(
      step: 'Step 1',
      description: 'Step 1: Do this',
    ),
    const Procedure(
      step: 'Step 2',
      description: 'Step 2: Do that',
    ),
    const Procedure(
      step: 'Step 3',
      description: 'Step 3: Do this and that',
    ),
  ];

  @override
  Future<List<Procedure>> getProcedures() async {
    return _procedures;
  }
}

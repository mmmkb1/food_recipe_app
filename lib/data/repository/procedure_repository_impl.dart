import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  ProcedureRepositoryImpl({ProcedureDataSource? procedureDataSource})
      : _procedureDataSource = procedureDataSource ?? MockProcedureDataSource();

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      return Result.success(await _procedureDataSource.getProcedures());
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

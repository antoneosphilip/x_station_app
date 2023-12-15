import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/category_model/category_model.dart';
import '../../../model/technical_model/technical_model.dart';

abstract class TechnicalStates{}
class TechnicalInitialState extends TechnicalStates{}
class TechnicalLoadingState extends TechnicalStates{}
class TechnicalSuccessState extends TechnicalStates{
TechnicalListModel technicalModel;
TechnicalSuccessState(this.technicalModel);
}
class TechnicalErrorState extends TechnicalStates{
 final String err;

  TechnicalErrorState(this.err);

}

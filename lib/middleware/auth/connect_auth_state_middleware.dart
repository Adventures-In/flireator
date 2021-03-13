import 'package:flireator/actions/auth/connect_auth_state_to_store.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class ConnectAuthStateMiddleware
    extends TypedMiddleware<AppState, ConnectAuthStateToStore> {
  ConnectAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'ConnectAuthStateMiddleware');

          try {
            authService.connectAuthStateToStore();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
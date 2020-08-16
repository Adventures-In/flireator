import 'package:flireator/actions/app/plumb_services.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class PlumbServicesMiddleware extends TypedMiddleware<AppState, PlumbServices> {
  PlumbServicesMiddleware(AuthService authService,
      DatabaseService databaseService, NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'PlumbServicesMiddleware');

          try {
            // Connect the service streams to the store.
            // We don't manage the subscription as the streams are expected
            // to stay open for the whole lifetime of the app.
            databaseService.storeStream
                .listen(store.dispatch, onError: handleProblem);
            authService.storeStream
                .listen(store.dispatch, onError: handleProblem);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

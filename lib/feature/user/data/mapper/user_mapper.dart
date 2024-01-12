



import 'package:masterpie/feature/user/data/remote/model/subscription_plan_remote_model.dart';
import 'package:masterpie/feature/user/data/remote/model/user_plan_remote_model.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';
import 'package:masterpie/feature/user/domain/model/user_plan_model.dart';

import '../../domain/model/google_signin_response_model.dart';
import '../../domain/model/profile_model.dart';
import '../local/model/profile_local.dart';
import '../remote/model/google_signin_remote_model.dart';
import '../remote/model/profile_remote.dart';

abstract class UserMapper {

  GoogleSignInResponse fromGoogleSignInResponseRemote(GoogleSignInRemote googleSignInRemote);


  ProfileRemote toProfileRemote(Profile profile);

  ProfileLocal toProfileLocal(Profile profile);

  Profile fromProfileLocal(ProfileLocal profileLocal);

  Profile fromProfileRemote(ProfileRemote profileRemote);

  UserPlan fromUserPlanRemote(UserPlanRemote userPlanRemote);

  List<SubscriptionPlan> fromSubscriptionPlansRemote(List<SubscriptionPlanRemote> subscriptionPlansRemote);

  SubscriptionPlan fromSubscriptionPlanRemote(SubscriptionPlanRemote subscriptionRemote);


}
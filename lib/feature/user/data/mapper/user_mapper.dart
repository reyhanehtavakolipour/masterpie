



import '../../domain/model/google_signin_response_model.dart';
import '../../domain/model/profile_model.dart';
import '../../domain/model/user_subscription_plan_model.dart';
import '../local/model/profile_local.dart';
import '../remote/model/google_signin_remote_model.dart';
import '../remote/model/profile_remote.dart';
import '../remote/model/user_subscription_plan_remote_model.dart';

abstract class UserMapper {

  GoogleSignInResponse fromGoogleSignInResponseRemote(GoogleSignInRemote googleSignInRemote);


  ProfileRemote toProfileRemote(Profile profile);

  ProfileLocal toProfileLocal(Profile profile);

  Profile fromProfileLocal(ProfileLocal profileLocal);

  Profile fromProfileRemote(ProfileRemote profileRemote);

  UserSubscriptionPlan fromUserSubscriptionRemote(UserSubscriptionPlanRemote userSubscriptionPlanRemote);

}
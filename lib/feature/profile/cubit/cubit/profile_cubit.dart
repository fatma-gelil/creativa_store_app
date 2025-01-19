import 'package:bloc/bloc.dart';
import 'package:store/feature/profile/model/profile_data.dart';
import 'package:store/feature/profile/model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileData profileData = ProfileData();
  getProfileData() async {
    emit(ProfileLoad());
    var users = await profileData.getData();
    emit(ProfileSuccess(profileData: users));
  }
}

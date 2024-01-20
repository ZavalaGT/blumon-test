import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/business_logic/auth/getme/getme_cubit.dart';
import 'package:blumonpay_test/src/business_logic/auth/getme/getme_state.dart';
import 'package:blumonpay_test/src/presentation/widgets/loading.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Text(
          'Pefil',
          style: TitleStyle.secondary(),
        ),
        const Spacing02(),
        BlocBuilder<GetmeCubit, GetmeState>(builder: (context, state) {
          if (state.status == GetmeStatus.loading) {
            return const LoadingWidget(
              color: ProjectColors.primarymain,
            );
          }
          if (state.status == GetmeStatus.failure) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error al obtener products',
                  style: Body1Style.secondary(),
                ),
              ],
            );
          }
          if (state.status == GetmeStatus.success) {
            return SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            MediaQuery.of(context).size.width * 0.45),
                      ),
                      child: Image.network(
                        state.user.image ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/imagenofound.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  )),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'FullName:',
                            style: Body1Style.secondary(),
                          ),
                          Text(
                            '${state.user.firstName} ${state.user.lastName}',
                            style: Body1Style.styled(),
                          ),
                          Text(
                            'Email:',
                            style: Body1Style.secondary(),
                          ),
                          Text(
                            state.user.email ?? '',
                            style: Body1Style.styled(),
                          ),
                          Text(
                            'UserName:',
                            style: Body1Style.secondary(),
                          ),
                          Text(
                            state.user.username ?? '',
                            style: Body1Style.styled(),
                          )
                        ]),
                  ),
                ],
              ),
            );
          }
          return Container();
        })
      ],
    );
  }
}

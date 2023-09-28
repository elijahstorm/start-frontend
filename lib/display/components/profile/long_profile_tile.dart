import 'package:flutter/material.dart';
import 'package:start_frontend/display/components/profile/temp_profile_content.dart';
import 'package:start_frontend/display/components/widgets/avatars.dart';

import 'package:start_frontend/language/constants.dart';

class LongProfileTile extends StatelessWidget {
  final ProfileContent profile;

  const LongProfileTile({
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: Constants.defaultPadding,
          ),
          Stack(
            children: [
              CircleOverlappableAvatar(
                size: Constants.defaultPadding * 4,
                display: Container(
                  color: Constants.todoColorOptions[3],
                  child: Center(
                    child: Image.asset(
                      'assets/imports/avatar-1.png',
                      fit: BoxFit.fill,
                      errorBuilder: (context, _, __) => Image.asset(
                        Constants.placeholderUserIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => {},
                  child: SizedBox(
                    width: 19,
                    height: 19,
                    child: CircleAvatar(
                      backgroundColor: Colors.brown.shade700,
                      child: Icon(
                        Icons.edit,
                        size: 12,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: Constants.defaultPadding,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.userHandle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  profile.email,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      );
}

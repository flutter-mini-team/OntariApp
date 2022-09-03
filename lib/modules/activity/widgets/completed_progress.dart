import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stateless/common_button.dart';

class CompletedProgress extends StatelessWidget {
  const CompletedProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetPath.imgVector2),
        ),
        color: DarkTheme.primaryBlue600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 16),
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 24,
                lineWidth: 5,
                percent: 1,
                animation: true,
                animationDuration: 1000,
                progressColor: DarkTheme.white,
                backgroundColor: Colors.black.withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
                center: const Text(
                  '100%',
                  style: TxtStyle.currentPlan,
                ),
              ),
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Great work!',
                        style: TxtStyle.headline3SemiBoldWhite,
                      ),
                      Text(
                        'You finished all of your courses',
                        style: TxtStyle.textFinished,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircleButton(
                      widthIcon: 8.5,
                      heightIcon: 8.5,
                      assetPath: AssetPath.iconClose,
                      bgColor: DarkTheme.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

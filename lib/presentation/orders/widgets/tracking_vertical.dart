import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../models/track_record_model.dart';

class TrackignVertical extends StatelessWidget {
  final List<TrackRecordModel> trackRecords;
  const TrackignVertical({super.key, required this.trackRecords});

  @override
  Widget build(BuildContext context) {
    final sortedTrackRecords = trackRecords.toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedTrackRecords.length,
      itemBuilder: (BuildContext context, int index) => TrackingItem(
        trackRecord: sortedTrackRecords[index],
        isCurrent: index == 0,
        isLast: index == trackRecords.length - 1,
      ),
    );
  }
}

class TrackingItem extends StatelessWidget {
  final TrackRecordModel trackRecord;
  final bool isCurrent;
  final bool isLast;

  const TrackingItem({
    super.key,
    required this.trackRecord,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 65.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trackRecord.formattedDateShort,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                trackRecord.formattedTime,
                style: const TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        const SpaceWidth(10.0),
        SizedBox(
          width: 20.0,
          child: Column(
            children: [
              Icon(
                isCurrent ? Icons.radio_button_checked : Icons.circle,
                color: AppColors.primary,
                size: isCurrent ? 20.0 : 14.0,
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 90.0,
                  color: AppColors.primary,
                ),
            ],
          ),
        ),
        const SpaceWidth(10.0),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: '[${trackRecord.status.value}] ',
              children: [
                TextSpan(
                  text: trackRecord.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              style: TextStyle(
                color: isCurrent ? AppColors.primary : AppColors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

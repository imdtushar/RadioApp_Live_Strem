import 'package:flutter/material.dart';
import 'package:radio/constants/colors.dart';
import 'package:radio/model/radio.dart';

class CustomRadioListTile extends StatelessWidget {
  final RadioModel radio;
  final bool isPlaying;
  final Function() onTap;

  const CustomRadioListTile({
    super.key,
    required this.radio,
    required this.isPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: radio.image?.trim().isEmpty ?? true
          ? ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                height: 44,
                width: 44,
                fit: BoxFit.cover,
                errorBuilder: (context, obj, _) => const SizedBox(
                  width: 44,
                  height: 44,
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                radio.image ??
                    "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                height: 44,
                width: 44,
                fit: BoxFit.cover,
                errorBuilder: (context, obj, _) => const SizedBox(
                  width: 44,
                  height: 44,
                ),
              ),
            ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            radio.votes ?? "-",
            style: textTheme.bodyMedium
                ?.copyWith(color: isPlaying ? CustomColors.primary : null),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(radio.title ?? "No title Available"),
                Text(radio.subtitle ?? "No information available",
                    maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      ),
      trailing: Image.asset("assets/more.png"),
    );
  }
}

import 'package:assetwize/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String id;
  final String detail;
  final String company;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final String? buttonText;
  final VoidCallback? onPressed;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.id,
    required this.detail,
    required this.company,
    required this.isFavorite,
    this.onFavoriteToggle,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        //  Responsive conditions
        final bool isTablet = width > 600;
        final bool isLarge = width > 1000;

        // Image Height
        double imageHeight = 250;
        if (isTablet) imageHeight = 300;
        if (isLarge) imageHeight = 350;

        // Padding
        double contentPadding = isLarge
            ? 20
            : isTablet
            ? 16
            : 12;

        // Font Sizes
        double titleSize = isLarge
            ? 20
            : isTablet
            ? 18
            : 16;
        double detailSize = isLarge
            ? 16
            : isTablet
            ? 15
            : 13;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE + BUTTONS
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: imagePath.startsWith("http")
                        ? Image.network(
                            imagePath,
                            width: double.infinity,
                            height: imageHeight,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            imagePath,
                            width: double.infinity,
                            height: imageHeight,
                            fit: BoxFit.cover,
                          ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: onFavoriteToggle,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: isLarge ? 28 : 24,
                        ),
                      ),
                    ),
                  ),

                  // AI Button
                  if (buttonText != null && onPressed != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: ElevatedButton.icon(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: white,
                          foregroundColor: black,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 2,
                        ),
                        icon: Image.asset(
                          "assets/icons/ai.png",
                          width: isLarge ? 22 : 18,
                        ),
                        label: Text(
                          buttonText!,
                          style: TextStyle(fontSize: isLarge ? 14 : 12),
                        ),
                      ),
                    ),
                ],
              ),

              // CONTENT TEXT
              Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          company,
                          style: TextStyle(color: black, fontSize: detailSize),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    if (id.isNotEmpty)
                      Text(
                        id,
                        style: TextStyle(color: greyDark, fontSize: detailSize),
                      ),

                    const SizedBox(height: 4),

                    Text(
                      detail,
                      style: TextStyle(color: greyDark, fontSize: detailSize),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

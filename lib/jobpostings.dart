import 'package:flutter/material.dart';

class jobpostings {
  jobpostings({
    this.jobpostingInfo = '',
    this.jobpostingImage = '',
    this.category = '',
    this.startColor,
    this.endColor,
    this.currentIndex = 0,
  });

  String jobpostingInfo;
  String jobpostingImage;
  String category;
  Color? startColor;
  Color? endColor;
  int currentIndex;
}

var jobPostings = [
  jobpostings(
    jobpostingInfo:
        'Develops high-quality code, Solves complex problems, and Collaborates',
    jobpostingImage: 'digital-marketing.jpg',
    category: 'Software Engineers',
    currentIndex: 2,
    startColor: const Color(0xFFe18b41),
    endColor: const Color(0xFFc7c73d),
  ),
  jobpostings(
    jobpostingInfo:
        'Analyzes data, builds predictive models, and extracts insight',
    jobpostingImage: 'graphic-design.jpg',
    category: 'Data Scientists',
    currentIndex: 1,
    startColor: const Color(0xFF621e14),
    endColor: const Color(0xFFd13b10),
  ),
  jobpostings(
    jobpostingInfo:
        'Designs and develops mobile applications, ensuring functionality, user experience',
    jobpostingImage: 'writing-&-translation.jpg',
    category: 'App Developers',
    currentIndex: 3,
    startColor: const Color(0xFFaf781d),
    endColor: const Color(0xFFd6a651),
  ),
  jobpostings(
    jobpostingInfo:
        'Develops and implements machine learning models, optimizes algorithms, and leverages data ',
    jobpostingImage: 'video-&-Animation.jpg',
    category: 'Machine Learning Engineers',
    currentIndex: 4,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  jobpostings(
    jobpostingInfo:
        'Designs and implements artificial intelligence solutions, leveraging machine learning and deep learning',
    jobpostingImage: 'music-&-audio.jpg',
    category: 'AI Engineers',
    currentIndex: 5,
    startColor: const Color(0xFF2e0f07),
    endColor: const Color(0xFF653424),
  ),
  jobpostings(
    jobpostingInfo:
        'Designs and develops embedded systems, ensuring efficient hardware-software integration',
    jobpostingImage: 'programming.jpg',
    category: 'Embedded Systems Engineers',
    currentIndex: 6,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  jobpostings(
    jobpostingInfo:
        'Monitors and analyzes network security, implements protective measures,',
    jobpostingImage: 'business.jpg',
    category: 'Network Security Analyst',
    currentIndex: 7,
    startColor: const Color(0xFF212121),
    endColor: const Color(0xFF424242),
  ),
  jobpostings(
    jobpostingInfo:
        'Architects and develops decentralized applications (DApps) on blockchain platforms, utilizing smart contracts',
    jobpostingImage: 'lifestyle.jpg',
    category: 'Web3 Developers',
    currentIndex: 8,
    startColor: const Color(0xFF3e4824),
    endColor: const Color(0xFF5da6a6),
  ),
];

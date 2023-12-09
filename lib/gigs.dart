import 'package:flutter/material.dart';

class Gigs {
  Gigs({
    this.gigInfo = '',
    this.gigImage = '',
    this.category = '',
    this.startColor,
    this.endColor,
    this.currentIndex = 0,
  });

  String gigInfo;
  String gigImage;
  String category;
  Color? startColor;
  Color? endColor;
  int currentIndex;
}

var gigs = [
  Gigs(
    gigInfo: 'Develops high-quality code, Solves complex problems, and Collaborates',
    gigImage: 'digital-marketing.jpg',
    category: 'Software Engineers',
    currentIndex: 2,
    startColor: const Color(0xFFe18b41),
    endColor: const Color(0xFFc7c73d),
  ),
  Gigs(
    gigInfo: 'Analyzes data, builds predictive models, and extracts insight',
    gigImage: 'graphic-design.jpg',
    category: 'Data Scientists',
    currentIndex: 1,
    startColor: const Color(0xFF621e14),
    endColor: const Color(0xFFd13b10),
  ),
  
  Gigs(
    gigInfo: 'Designs and develops mobile applications, ensuring functionality, user experience',
    gigImage: 'writing-&-translation.jpg',
    category: 'App Developers',
    currentIndex: 3,
    startColor: const Color(0xFFaf781d),
    endColor: const Color(0xFFd6a651),
  ),
  Gigs(
    gigInfo: 'Develops and implements machine learning models, optimizes algorithms, and leverages data ',
    gigImage: 'video-&-Animation.jpg',
    category: 'Machine Learning Engineers',
    currentIndex: 4,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo: 'Designs and implements artificial intelligence solutions, leveraging machine learning and deep learning',
    gigImage: 'music-&-audio.jpg',
    category: 'AI Engineers',
    currentIndex: 5,
    startColor: const Color(0xFF2e0f07),
    endColor: const Color(0xFF653424),
  ),
  Gigs(
    gigInfo: 'Designs and develops embedded systems, ensuring efficient hardware-software integration',
    gigImage: 'programming.jpg',
    category: 'Embedded Systems Engineers',
    currentIndex: 6,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo: 'Monitors and analyzes network security, implements protective measures,',
    gigImage: 'business.jpg',
    category: 'Network Security Analyst',
    currentIndex: 7,
    startColor: const Color(0xFF212121),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo: 'Architects and develops decentralized applications (DApps) on blockchain platforms, utilizing smart contracts',
    gigImage: 'lifestyle.jpg',
    category: 'Web3 Developers',
    currentIndex: 8,
    startColor: const Color(0xFF3e4824),
    endColor: const Color(0xFF5da6a6),
  ),
];

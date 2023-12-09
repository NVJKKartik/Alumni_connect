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
    gigInfo: 'Wordpress, Game Development, Mobile Apps',
    gigImage: 'programming.jpg',
    category: 'Software Engineers',
    currentIndex: 6,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo: 'Logo & Brand Identity, Art & Illustration',
    gigImage: 'graphic-design.jpg',
    category: 'Data Scientists',
    currentIndex: 1,
    startColor: const Color(0xFF621e14),
    endColor: const Color(0xFFd13b10),
  ),
  Gigs(
    gigInfo: 'Marketing Strategy, Social Media Marketing, Local SEO',
    gigImage: 'digital-marketing.jpg',
    category: 'Network Security Engineers',
    currentIndex: 2,
    startColor: const Color(0xFFe18b41),
    endColor: const Color(0xFFc7c73d),
  ),
  Gigs(
    gigInfo: 'Content Writing, Editing, Career Writing, Storytelling',
    gigImage: 'writing-&-translation.jpg',
    category: 'App Developers',
    currentIndex: 3,
    startColor: const Color(0xFFaf781d),
    endColor: const Color(0xFFd6a651),
  ),
  Gigs(
    gigInfo: 'Editing, Post-Production, Animation, Social & Marketing Videos',
    gigImage: 'video-&-Animation.jpg',
    category: 'Machine Learning Engineers',
    currentIndex: 4,
    startColor: const Color(0xFF424242),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo: 'Music Production, Audio Engineering, Voice Over & Streaming',
    gigImage: 'music-&-audio.jpg',
    category: 'AI Engineers',
    currentIndex: 5,
    startColor: const Color(0xFF2e0f07),
    endColor: const Color(0xFF653424),
  ),
  Gigs(
    gigInfo: 'Accounting, Administrative, Sales & Customer Care',
    gigImage: 'business.jpg',
    category: 'Embedded Systems Engineers',
    currentIndex: 7,
    startColor: const Color(0xFF212121),
    endColor: const Color(0xFF424242),
  ),
  Gigs(
    gigInfo:
        'Fashion & Style, Life Coaching, Leisure & Hobbies, Wellness & Fitness',
    gigImage: 'lifestyle.jpg',
    category: 'Web3 Developers',
    currentIndex: 8,
    startColor: const Color(0xFF3e4824),
    endColor: const Color(0xFF5da6a6),
  ),
];

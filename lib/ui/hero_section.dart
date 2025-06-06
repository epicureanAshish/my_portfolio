import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 600 && width < 1024;
    final isDesktop = width >= 1024;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZoomIn(
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://sdmntprsouthcentralus.oaiusercontent.com/files/00000000-0480-61f7-98bf-f88fd7db75ae/raw?se=2025-05-31T11%3A41%3A56Z&sp=r&sv=2024-08-04&sr=b&scid=91d2bbd0-1eef-549a-96b2-89c3baf95f7d&skoid=864daabb-d06a-46b3-a747-d35075313a83&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-05-31T10%3A08%3A29Z&ske=2025-06-01T10%3A08%3A29Z&sks=b&skv=2024-08-04&sig=VaitSyq3OFZ6rvjtbWE84SaHKe1ZdsjIj6V4LIpK26M%3D',
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            child: Text(
              'Ashish Chauhan',
              style: TextStyle(
                fontSize: isDesktop ? 48 : isTablet ? 40 : 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: const Text(
              'Mobile App Developer with 4+ years of experience in Flutter and Android',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Download CV'),
            ),
          ),
        ],
      ),
    );
  }
}
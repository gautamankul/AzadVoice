import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// Enum for activity types
enum ActivityType { donation, event, volunteer, social }

// UserProfile class to hold user data
class UserProfile {
  final String name;
  final String email;
  final String phone;
  final DateTime memberSince;
  final String location;
  final String bio;
  final double totalDonations;
  final int eventsAttended;
  final int volunteeredHours;
  final String badgeLevel;
  final String? profileImage;
  final ProfilePreferences preferences;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.memberSince,
    required this.location,
    required this.bio,
    required this.totalDonations,
    required this.eventsAttended,
    required this.volunteeredHours,
    required this.badgeLevel,
    this.profileImage,
    required this.preferences,
  });
}

// ProfilePreferences class for user preferences
class ProfilePreferences {
  final bool emailNotifications;
  final bool pushNotifications;
  final bool smsNotifications;
  final bool eventReminders;
  final bool newsletterSubscription;
  final bool darkMode;

  ProfilePreferences({
    required this.emailNotifications,
    required this.pushNotifications,
    required this.smsNotifications,
    required this.eventReminders,
    required this.newsletterSubscription,
    required this.darkMode,
  });
}

// Activity class for recent activities
class Activity {
  final String title;
  final String description;
  final DateTime date;
  final ActivityType type;
  final IconData icon;
  final Color color;

  Activity({
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.icon,
    required this.color,
  });
}

// Achievement class for user achievements
class Achievement {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isUnlocked;
  final DateTime? dateUnlocked;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.isUnlocked,
    this.dateUnlocked,
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProfile userProfile = UserProfile(
    name: 'Sarah Johnson',
    email: 'sarah.johnson@email.com',
    phone: '+1 (555) 123-4567',
    memberSince: DateTime(2023, 3, 15),
    location: 'New York, NY',
    bio:
        'Passionate about healthcare reform and community development. Active volunteer and advocate for social justice.',
    totalDonations: 850.0,
    eventsAttended: 12,
    volunteeredHours: 48,
    badgeLevel: 'Gold Supporter',
    profileImage: null,
    preferences: ProfilePreferences(
      emailNotifications: true,
      pushNotifications: true,
      smsNotifications: false,
      eventReminders: true,
      newsletterSubscription: true,
      darkMode: false,
    ),
  );

  final List<Activity> recentActivities = [
    Activity(
      title: 'Donated \$50 to Healthcare Reform',
      description: 'Monthly donation processed',
      date: DateTime(2025, 8, 5),
      type: ActivityType.donation,
      icon: Icons.monetization_on,
      color: Colors.green,
    ),
    Activity(
      title: 'Attended Town Hall Meeting',
      description: 'City Hall Auditorium',
      date: DateTime(2025, 8, 1),
      type: ActivityType.event,
      icon: Icons.event,
      color: Colors.blue,
    ),
    Activity(
      title: 'Volunteered at Community Center',
      description: '4 hours of community service',
      date: DateTime(2025, 7, 28),
      type: ActivityType.volunteer,
      icon: Icons.volunteer_activism,
      color: Colors.orange,
    ),
    Activity(
      title: 'Shared Healthcare Rally Event',
      description: 'Invited 15 friends',
      date: DateTime(2025, 7, 25),
      type: ActivityType.social,
      icon: Icons.share,
      color: Colors.purple,
    ),
    Activity(
      title: 'Joined Climate Action Forum',
      description: 'Registered for upcoming event',
      date: DateTime(2025, 7, 20),
      type: ActivityType.event,
      icon: Icons.event_available,
      color: Colors.teal,
    ),
  ];

  final List<Achievement> achievements = [
    Achievement(
      title: 'Gold Supporter',
      description: 'Donated over \$500',
      icon: Icons.star,
      color: Colors.amber,
      isUnlocked: true,
      dateUnlocked: DateTime(2024, 12, 15),
    ),
    Achievement(
      title: 'Community Champion',
      description: 'Attended 10+ events',
      icon: Icons.emoji_events,
      color: Colors.blue,
      isUnlocked: true,
      dateUnlocked: DateTime(2024, 11, 20),
    ),
    Achievement(
      title: 'Volunteer Hero',
      description: 'Volunteered 40+ hours',
      icon: Icons.volunteer_activism,
      color: Colors.green,
      isUnlocked: true,
      dateUnlocked: DateTime(2025, 6, 10),
    ),
    Achievement(
      title: 'Social Activist',
      description: 'Share 5 events with friends',
      icon: Icons.share,
      color: Colors.purple,
      isUnlocked: false,
      dateUnlocked: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Color(0xFF1976D2)],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _showSettingsDialog(),
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Profile Picture and Info
                  Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.blue[100],
                              child: Text(
                                userProfile.name
                                    .split(' ')
                                    .map((e) => e[0])
                                    .join(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        userProfile.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          userProfile.badgeLevel,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userProfile.location,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Stats Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Impact',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          '\$${userProfile.totalDonations.toStringAsFixed(0)}',
                          'Total Donated',
                          Icons.monetization_on,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          '${userProfile.eventsAttended}',
                          'Events Attended',
                          Icons.event,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          '${userProfile.volunteeredHours}h',
                          'Volunteered',
                          Icons.volunteer_activism,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Achievements Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: achievements.length,
                    itemBuilder: (context, index) {
                      final achievement = achievements[index];
                      return _buildAchievementCard(achievement);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Recent Activity Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _showAllActivities(),
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ...recentActivities
                      .take(3)
                      .map((activity) => _buildActivityTile(activity)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Account Options Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildOptionTile(
                    Icons.edit,
                    'Edit Profile',
                    'Update your personal information',
                    () => _editProfile(),
                  ),
                  _buildOptionTile(
                    Icons.notifications,
                    'Notifications',
                    'Manage your notification preferences',
                    () => _showNotificationSettings(),
                  ),
                  _buildOptionTile(
                    Icons.security,
                    'Privacy & Security',
                    'Password and security settings',
                    () => _showPrivacySettings(),
                  ),
                  _buildOptionTile(
                    Icons.help,
                    'Help & Support',
                    'Get help and contact support',
                    () => _showHelpDialog(),
                  ),
                  _buildOptionTile(
                    Icons.logout,
                    'Sign Out',
                    'Sign out of your account',
                    () => _showSignOutDialog(),
                    isDestructive: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // UI helper widgets
  Widget _buildStatCard(
      String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(Achievement achievement) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: achievement.isUnlocked
            ? achievement.color.withOpacity(0.1)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: achievement.isUnlocked
              ? achievement.color.withOpacity(0.3)
              : Colors.grey[300]!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            achievement.icon,
            color: achievement.isUnlocked ? achievement.color : Colors.grey,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            achievement.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: achievement.isUnlocked ? Colors.black87 : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            achievement.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(Activity activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: activity.color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: activity.color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              activity.icon,
              color: activity.color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  activity.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatActivityDate(activity.date),
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, String subtitle,
      VoidCallback onTap,
      {bool isDestructive = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withOpacity(0.1)
              : Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : Colors.blue,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey[400],
      ),
      onTap: onTap,
    );
  }

  // Logic helpers
  String _formatActivityDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '${difference}d ago';
    } else {
      return '${(difference / 7).floor()}w ago';
    }
  }

  // Dialogs and Navigation
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool tempEmailNotifications = userProfile.preferences.emailNotifications;
        bool tempPushNotifications = userProfile.preferences.pushNotifications;
        bool tempSmsNotifications = userProfile.preferences.smsNotifications;
        bool tempEventReminders = userProfile.preferences.eventReminders;
        bool tempNewsletterSubscription =
            userProfile.preferences.newsletterSubscription;
        bool tempDarkMode = userProfile.preferences.darkMode;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: const Row(
                children: [
                  Icon(Icons.settings, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('Settings'),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SwitchListTile(
                      title: const Text('Email Notifications'),
                      value: tempEmailNotifications,
                      onChanged: (value) {
                        setState(() {
                          tempEmailNotifications = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Push Notifications'),
                      value: tempPushNotifications,
                      onChanged: (value) {
                        setState(() {
                          tempPushNotifications = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('SMS Notifications'),
                      value: tempSmsNotifications,
                      onChanged: (value) {
                        setState(() {
                          tempSmsNotifications = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Event Reminders'),
                      value: tempEventReminders,
                      onChanged: (value) {
                        setState(() {
                          tempEventReminders = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Newsletter Subscription'),
                      value: tempNewsletterSubscription,
                      onChanged: (value) {
                        setState(() {
                          tempNewsletterSubscription = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: tempDarkMode,
                      onChanged: (value) {
                        setState(() {
                          tempDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Update preferences (in a real app, save to backend or local storage)
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Settings saved')),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAllActivities() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllActivitiesScreen(activities: recentActivities),
      ),
    );
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(userProfile: userProfile),
      ),
    );
  }

  void _showNotificationSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            NotificationSettingsScreen(preferences: userProfile.preferences),
      ),
    );
  }

  void _showPrivacySettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrivacySettingsScreen(),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Row(
            children: [
              Icon(Icons.help, color: Colors.blue),
              SizedBox(width: 10),
              Text('Help & Support'),
            ],
          ),
          content: const Text(
            'Contact our support team at support@example.com or visit our help center at www.example.com/help.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Row(
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 10),
              Text('Sign Out'),
            ],
          ),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement sign-out logic here (e.g., clear auth token, navigate to login)
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signed out successfully')),
                );
              },
              child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

// Screen to display all activities
class AllActivitiesScreen extends StatelessWidget {
  final List<Activity> activities;

  const AllActivitiesScreen({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Activities'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: activity.color.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: activity.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    activity.icon,
                    color: activity.color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        activity.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatActivityDate(activity.date),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatActivityDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '${difference}d ago';
    } else {
      return '${(difference / 7).floor()}w ago';
    }
  }
}

// Screen to edit profile
class EditProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  const EditProfileScreen({super.key, required this.userProfile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.name);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _phoneController = TextEditingController(text: widget.userProfile.phone);
    _locationController = TextEditingController(text: widget.userProfile.location);
    _bioController = TextEditingController(text: widget.userProfile.bio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save profile changes (in a real app, update backend or local storage)
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated')),
                      );
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Screen for notification settings
class NotificationSettingsScreen extends StatefulWidget {
  final ProfilePreferences preferences;

  const NotificationSettingsScreen({super.key, required this.preferences});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  late bool emailNotifications;
  late bool pushNotifications;
  late bool smsNotifications;
  late bool eventReminders;
  late bool newsletterSubscription;

  @override
  void initState() {
    super.initState();
    emailNotifications = widget.preferences.emailNotifications;
    pushNotifications = widget.preferences.pushNotifications;
    smsNotifications = widget.preferences.smsNotifications;
    eventReminders = widget.preferences.eventReminders;
    newsletterSubscription = widget.preferences.newsletterSubscription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Email Notifications'),
              value: emailNotifications,
              onChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Push Notifications'),
              value: pushNotifications,
              onChanged: (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('SMS Notifications'),
              value: smsNotifications,
              onChanged: (value) {
                setState(() {
                  smsNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Event Reminders'),
              value: eventReminders,
              onChanged: (value) {
                setState(() {
                  eventReminders = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Newsletter Subscription'),
              value: newsletterSubscription,
              onChanged: (value) {
                setState(() {
                  newsletterSubscription = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save notification settings (in a real app, update backend or local storage)
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification settings saved')),
                );
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen for privacy settings
class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: const Text('Change Password'),
              subtitle: const Text('Update your account password'),
              leading: const Icon(Icons.lock),
              onTap: () {
                // Navigate to password change screen or show dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password change initiated')),
                );
              },
            ),
            ListTile(
              title: const Text('Two-Factor Authentication'),
              subtitle: const Text('Enable or disable 2FA'),
              leading: const Icon(Icons.security),
              onTap: () {
                // Navigate to 2FA settings or show dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('2FA settings opened')),
                );
              },
            ),
            ListTile(
              title: const Text('Data Privacy'),
              subtitle: const Text('Manage your data and privacy settings'),
              leading: const Icon(Icons.privacy_tip),
              onTap: () {
                // Navigate to data privacy settings or show dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data privacy settings opened')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
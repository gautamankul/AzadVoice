import 'package:flutter/material.dart';

// EventType enum
enum EventType { rally, meeting, workshop, forum, fundraiser, summit }

// AttendanceStatus enum
enum AttendanceStatus { none, attending, maybe }

// Event class
class Event {
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final String location;
  final int attendees;
  final int maxAttendees;
  final String category;
  AttendanceStatus attendanceStatus;
  final String? imageUrl;
  final String organizer;
  final List<String> tags;
  final EventType type;
  final bool isPast;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.attendees,
    required this.maxAttendees,
    required this.category,
    required this.attendanceStatus,
    required this.imageUrl,
    required this.organizer,
    required this.tags,
    required this.type,
    this.isPast = false,
  });
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Upcoming', 'This Week', 'This Month', 'Past'];

  final List<Event> events = [
    Event(
      title: 'Healthcare Reform Rally',
      description:
          'Join us this Saturday for our healthcare reform rally at Central Park. Together we can build a better future! Speakers include healthcare experts and community leaders.',
      date: DateTime(2025, 8, 10),
      time: '2:00 PM - 5:00 PM',
      location: 'Central Park, Main Stage',
      attendees: 487,
      maxAttendees: 1000,
      category: 'Rally',
      attendanceStatus: AttendanceStatus.attending,
      imageUrl: null,
      organizer: 'Party Official',
      tags: ['Healthcare', 'Policy', 'Community'],
      type: EventType.rally,
    ),
    Event(
      title: 'Town Hall Meeting',
      description:
          'Monthly town hall meeting to discuss local issues and upcoming policy changes. Your voice matters - come and share your concerns.',
      date: DateTime(2025, 8, 15),
      time: '7:00 PM - 9:00 PM',
      location: 'City Hall Auditorium',
      attendees: 156,
      maxAttendees: 300,
      category: 'Meeting',
      attendanceStatus: AttendanceStatus.none,
      imageUrl: null,
      organizer: 'City Council',
      tags: ['Local Politics', 'Community', 'Q&A'],
      type: EventType.meeting,
    ),
    Event(
      title: 'Volunteer Training Workshop',
      description:
          'Learn how to effectively volunteer for our campaigns. Training covers door-to-door canvassing, phone banking, and event organization.',
      date: DateTime(2025, 8, 12),
      time: '10:00 AM - 4:00 PM',
      location: 'Community Center Room A',
      attendees: 89,
      maxAttendees: 150,
      category: 'Workshop',
      attendanceStatus: AttendanceStatus.maybe,
      imageUrl: null,
      organizer: 'Campaign Team',
      tags: ['Training', 'Volunteers', 'Skills'],
      type: EventType.workshop,
    ),
    Event(
      title: 'Climate Action Forum',
      description:
          'Discussing environmental policies and climate action plans for our community. Join environmental scientists and policy makers.',
      date: DateTime(2025, 8, 20),
      time: '6:00 PM - 8:30 PM',
      location: 'University Lecture Hall',
      attendees: 234,
      maxAttendees: 400,
      category: 'Forum',
      attendanceStatus: AttendanceStatus.none,
      imageUrl: null,
      organizer: 'Environmental Committee',
      tags: ['Environment', 'Climate', 'Science'],
      type: EventType.forum,
    ),
    Event(
      title: 'Fundraising Gala Dinner',
      description:
          'Annual fundraising gala featuring keynote speakers, networking opportunities, and supporting our healthcare initiative.',
      date: DateTime(2025, 8, 25),
      time: '6:30 PM - 11:00 PM',
      location: 'Grand Hotel Ballroom',
      attendees: 267,
      maxAttendees: 500,
      category: 'Fundraiser',
      attendanceStatus: AttendanceStatus.none,
      imageUrl: null,
      organizer: 'Finance Committee',
      tags: ['Fundraising', 'Networking', 'Formal'],
      type: EventType.fundraiser,
    ),
    Event(
      title: 'Youth Leadership Summit',
      description:
          'Empowering young leaders with the skills and knowledge to make a difference in their communities.',
      date: DateTime(2025, 7, 30),
      time: '9:00 AM - 5:00 PM',
      location: 'Convention Center',
      attendees: 145,
      maxAttendees: 200,
      category: 'Summit',
      attendanceStatus: AttendanceStatus.attending,
      imageUrl: null,
      organizer: 'Youth Committee',
      tags: ['Youth', 'Leadership', 'Education'],
      type: EventType.summit,
      isPast: true,
    ),
  ];

  List<Event> get filteredEvents {
    final now = DateTime.now();
    switch (selectedFilter) {
      case 'Upcoming':
        return events.where((event) => event.date.isAfter(now)).toList();
      case 'This Week':
        final weekFromNow = now.add(const Duration(days: 7));
        return events.where((event) => event.date.isAfter(now) && event.date.isBefore(weekFromNow)).toList();
      case 'This Month':
        return events
            .where((event) => event.date.isAfter(now) && event.date.month == now.month && event.date.year == now.year)
            .toList();
      case 'Past':
        return events.where((event) => event.isPast || event.date.isBefore(now)).toList();
      default:
        return events;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Events',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Filter Chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                final isSelected = selectedFilter == filter;
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: Colors.blue.withOpacity(0.1),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.blue : Colors.black87,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                    side: BorderSide(color: isSelected ? Colors.blue : Colors.grey[300]!),
                  ),
                );
              },
            ),
          ),

          // Events List
          Expanded(
            child: _buildEventsList(filteredEvents),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(List<Event> events) {
    if (events.isEmpty) {
      return const Center(child: Text('No events found', style: TextStyle(fontSize: 18, color: Colors.grey)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return _buildEventCard(event);
      },
    );
  }

  Widget _buildEventCard(Event event) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400; // Threshold for small screens

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () => _showEventDetails(event),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(_formatDate(event.date), style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              Text(event.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(_getEventTypeIcon(event.type), color: _getEventTypeColor(event.type)),
                            const SizedBox(width: 5),
                            Text('${event.attendees}/${event.maxAttendees} Attendees'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        event.isPast
                            ? Text(
                                event.attendanceStatus == AttendanceStatus.attending ? 'Attended' : '',
                                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
                              )
                            : Wrap(
                                spacing: 8,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.attending),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.attending
                                          ? Colors.blue
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.attending
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Attending'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.maybe),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.maybe
                                          ? Colors.blue
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.maybe
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Maybe'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.none),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.none
                                          ? Colors.red
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.none
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Leave'),
                                  ),
                                ],
                              ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(_getEventTypeIcon(event.type), color: _getEventTypeColor(event.type)),
                            const SizedBox(width: 5),
                            Text('${event.attendees}/${event.maxAttendees} Attendees'),
                          ],
                        ),
                        event.isPast
                            ? Text(
                                event.attendanceStatus == AttendanceStatus.attending ? 'Attended' : '',
                                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.attending),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.attending
                                          ? Colors.blue
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.attending
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Attending'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.maybe),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.maybe
                                          ? Colors.blue
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.maybe
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Maybe'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () => _setAttendance(event, AttendanceStatus.none),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: event.attendanceStatus == AttendanceStatus.none
                                          ? Colors.red
                                          : Colors.grey[300],
                                      foregroundColor: event.attendanceStatus == AttendanceStatus.none
                                          ? Colors.white
                                          : Colors.black,
                                      minimumSize: const Size(90, 36),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    child: const Text('Leave'),
                                  ),
                                ],
                              ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getEventTypeColor(EventType type) {
    switch (type) {
      case EventType.rally:
        return Colors.orange;
      case EventType.meeting:
        return Colors.green;
      case EventType.workshop:
        return Colors.purple;
      case EventType.forum:
        return Colors.teal;
      case EventType.fundraiser:
        return Colors.pink;
      case EventType.summit:
        return Colors.indigo;
    }
  }

  IconData _getEventTypeIcon(EventType type) {
    switch (type) {
      case EventType.rally:
        return Icons.campaign;
      case EventType.meeting:
        return Icons.people;
      case EventType.workshop:
        return Icons.school;
      case EventType.forum:
        return Icons.forum;
      case EventType.fundraiser:
        return Icons.volunteer_activism;
      case EventType.summit:
        return Icons.emoji_events;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  void _setAttendance(Event event, AttendanceStatus status) {
    setState(() {
      event.attendanceStatus = status;
    });
  }

  void _showEventDetails(Event event) {
    showDialog(
      context: context,
      builder: (context) => EventDetailsScreen(event: event),
    );
  }
}

// Event details dialog
class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(event.title),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.description),
            const SizedBox(height: 10),
            Text("Date: ${event.date.day}/${event.date.month}/${event.date.year}"),
            Text("Time: ${event.time}"),
            Text("Location: ${event.location}"),
            Text("Organizer: ${event.organizer}"),
            Text("Attendees: ${event.attendees}/${event.maxAttendees}"),
            Wrap(
              spacing: 6,
              children: event.tags
                  .map((tag) => Chip(label: Text(tag)))
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SuperAdminPanel extends StatefulWidget {
  const SuperAdminPanel({Key? key}) : super(key: key);

  @override
  State<SuperAdminPanel> createState() => _SuperAdminPanelState();
}

class _SuperAdminPanelState extends State<SuperAdminPanel> {
  late DatabaseReference _pendingUsersRef;
  late DatabaseReference _usersRef;
  List<Map<String, dynamic>> _pendingUsers = [];

  @override
  void initState() {
    super.initState();
    _pendingUsersRef = FirebaseDatabase.instance.ref("pending_users");
    _usersRef = FirebaseDatabase.instance.ref("users");
    _fetchPendingUsers();

    // Real-time listener for pending users
    _pendingUsersRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        Map<dynamic, dynamic> usersMap = event.snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          _pendingUsers = usersMap.entries.map((entry) {
            return {
              'uid': entry.key,
              'email': entry.value['email'],
              'role': entry.value['role'],
              'status': entry.value['status'],
            };
          }).toList();
        });
      } else {
        setState(() {
          _pendingUsers = [];
        });
      }
    });
  }

  // Fetch pending users from Firebase Realtime Database
  void _fetchPendingUsers() async {
    DataSnapshot snapshot = await _pendingUsersRef.get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> usersMap = snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _pendingUsers = usersMap.entries.map((entry) {
          return {
            'uid': entry.key,
            'email': entry.value['email'],
            'role': entry.value['role'],
            'status': entry.value['status'],
          };
        }).toList();
      });
    }
  }

  // Approve a user by moving them from "pending_users" to "users"
  void _approveUser(String uid, String email, String role) async {
  DatabaseReference pendingUserRef = _pendingUsersRef.child(uid);
  DatabaseReference userRef = _usersRef.child(uid);

  try {
    // ✅ Move user from "pending_users" to "users"
    await userRef.set({
      'email': email,
      'role': role,
      'status': 'approved',
    });

    // ❌ Remove from pending_users
    await pendingUserRef.remove();

    setState(() {
      _pendingUsers.removeWhere((user) => user['uid'] == uid);
    });

    // ✅ Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User has been approved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error approving user: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Admin Panel'),
      ),
      body: _pendingUsers.isEmpty
          ? Center(child: Text('No users to approve.'))
          : ListView.builder(
              itemCount: _pendingUsers.length,
              itemBuilder: (context, index) {
                final user = _pendingUsers[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(user['email']),
                    subtitle: Text("Role: ${user['role']}"),
                    trailing: ElevatedButton(
                      onPressed: () => _approveUser(user['uid'], user['email'], user['role']),
                      child: Text('Approve'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

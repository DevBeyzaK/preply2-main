import 'package:flutter/material.dart';
import 'package:preply_clone/models/person.dart';
import 'package:preply_clone/widgets/profile_avatar_button.dart';

class Messages extends StatefulWidget {
  final VoidCallback openDrawer;
  const Messages({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late List<Person> persons;
  List<Person> archivedMessages = [];

  @override
  void initState() {
    super.initState();
    persons = Person.createPersonList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  ProfileAvatarButton(
                    onTap: widget.openDrawer,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.only(left: 0, right: 20),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              indicatorColor: const Color.fromRGBO(194, 95, 134, 1),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Archived'),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: TabBarView(
              children: [
                ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey.shade300),
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person = persons[index];
                    return Dismissible(
                      key: Key(person.name + person.day),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.grey.shade400,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.archive, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          archivedMessages.add(person);
                          persons.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${person.name} archived')),
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            person.imgUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          person.name,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          person.messageContent,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          person.day,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    );
                  },
                ),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey.shade300, height: 1),
                  itemCount: archivedMessages.length,
                  itemBuilder: (context, index) {
                    final person = archivedMessages[index];
                    return Dismissible(
                      key: Key('archived_${person.name}_${person.day}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.grey.shade400,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.unarchive, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          persons.add(person);
                          archivedMessages.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${person.name} unarchived')),
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            person.imgUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          person.name,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          person.messageContent,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          person.day,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 8,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

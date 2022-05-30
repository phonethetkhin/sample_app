import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/model/response/user_response_model.dart';
import 'package:sample_app/view/screens/posts_screen.dart';
import 'package:sample_app/view/widget/loading_widget.dart';
import 'package:sample_app/viewmodel/user_viewmodel.dart';

import '../../util/constants.dart';


class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _fetchUser(BuildContext context) async{
    logger.wtf("Hello from fetch user");

    try {
    await context.read<UserViewModel>().getUser();
    }catch(e){
      logger.wtf(e);
    }
  }
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _fetchUser(context),
      builder: (context, snapshot)=>

      Scaffold(
          appBar: AppBar(title: const Text('Sample')),
          body: snapshot.connectionState == ConnectionState.waiting ?  LoadingWidget()
              : Consumer<UserViewModel>(builder: (context,userViewModel, child)=> userListView(userViewModel.users, context))
      ),
    );

  Widget userListView(List<User> users, BuildContext context) {
    return ListView.builder(itemCount: users.length, itemBuilder: (context, index) {
          return userListItem(users[index], context);
        },
      );
  }
  Widget userListItem(User user, BuildContext context){
    return  Column(
      children: [
        GestureDetector(
          onTap:() => Navigator.of(context).pushNamed(PostsScreen.routeName),
          child: ListTile(leading:  const Icon(Icons.account_circle),
          title:  Text(user.name),
          ),
        ),
    const  Divider(color: Colors.black)
    ],
    );
  }
}

import 'package:new_rasp_app/pages/chat_page/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final User iruka = User(id: 0, name: 'Генадий А.В.', imageUrl: './lib/assets/images/sena.jpg');
final User yui = User(id: 1, name: 'Ирина Петровна', imageUrl: './lib/assets/images/hanabi.jpg');
final User ryuu = User(id: 2, name: 'Анатолий Сергеевич', imageUrl: './lib/assets/images/ryuu.jpg');
final User hanabi = User(id: 4, name: 'Hanabi', imageUrl: './lib/assets/images/hanabi.jpg');
final User currentUser = User(id: 4, name: 'Батыров Жаркынбек', imageUrl: './lib/assets/images/iruka.jpg');

//Favorite Contacts
List<User> favorites = [yui, iruka];

// Example chats on home screen
List<Message> chats = [
  Message(sender: yui, time: '5:30 PM', text: "Здравствуйте студенты , сегодня пара отменяется", isLiked: true, unread: false),
  Message(sender: ryuu, time: '7:30 PM', text: "Важное объявление сегодня в 13.00 будет", isLiked: false, unread: false),
  Message(sender: iruka, time: '7:30 PM', text: "Здравствуйте студенты , сегодня пара отменяется", isLiked: false, unread: true)
];

// Example chats in chat screen
List<Message> messages = [
  Message(sender: currentUser, time: '5:36 PM', text: "Aamiin", isLiked: false, unread: true),
  Message(sender: yui, time: '5:30 PM', text: "Semoga mamah cepet sadar :')", isLiked: false, unread: false),
  Message(sender: currentUser, time: '5:36 PM', text: "Mungkin nanti pada saatnya mamah pulang", isLiked: true, unread: true),
  Message(sender: yui, time: '5:30 PM', text: "Mamah kemana?", isLiked: false, unread: false),
  Message(sender: ryuu, time: '7:30 PM', text: "Mudah-mudahan mamah cepet pulang :')", isLiked: false, unread: true)
];

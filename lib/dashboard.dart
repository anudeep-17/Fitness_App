
class dashboard
{

  final String name, imagepath, description, extended;

  dashboard(
  {
    required this.name,
    required this.imagepath,
    required this.description,
    required this.extended,

  }
  );
}

final dashboard_content = [

  dashboard(
    name: "Workout Progress",
    imagepath: "assets/images/workout3.jpg",
    description: "When you hustle for muscle",
    extended: "we track your progress",
  ),
  dashboard(
    name: "Body Progress",
    imagepath: "assets/images/body3.jpg",
    description: "Track the change",
    extended: "to work even harder :)",
  ),
  dashboard(
    name: "Body Transition",
    imagepath: "assets/images/body2.jpg",
    description: "Want some motivation...",
    extended: "look at you transformation!",
  ),

  dashboard(
    name: "Exercise Guide",
    imagepath: "assets/images/workout2.jpg",
    description: "That magic link to pump !",
    extended: " ",
  ),

  dashboard(
    name: "Cardio",
    imagepath: "assets/images/cardio1.jpg",
    description: "How’d you like to go on a long",
    extended: "romantic walk on the treadmill?",
  ),

  dashboard(
    name: "Gyms Near Me",
    imagepath: "assets/images/gym1.jpg",
    description: "Worried where to go, we search",
    extended: "The nearest Iron Paradise for you",
  ),

  //credits Dwyane Jhonson for Iron paradise.


  dashboard(
    name: "Animal Motivation",
    imagepath: "assets/images/motivation2.jpg",
    description: "We believe...",
    extended: "We achieve",
  ),

];
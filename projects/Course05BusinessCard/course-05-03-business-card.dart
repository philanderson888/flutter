return Scaffold(
  appBar: AppBar(
    title: Text('Course Business Card'),
  ),
  backgroundColor: Colors.teal.shade600,
  body: SafeArea(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0,
        ),
        CircleAvatar(
          radius: 75,
          backgroundColor: Colors.black12,
          backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
        ),
        Text(
          'Phil Anderson',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w400,
            fontFamily: "Pacifico",
            color: Colors.white,
          ),
        ),
        Text(
          'FLUTTER DEVELOPER',
          style: TextStyle(
            fontSize: 35,
            fontFamily: "SourceSansPro",
            color: Colors.teal.shade100,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);




class CardsPrincipal {
  String imageUrl;
  String title;
  String description;
  String video;
  int length;
  String subtitle;
  final List<CardsPrincipal> temasRelacionadosList;

  CardsPrincipal({this.description, this.imageUrl, this.title, this.video, this.length, this.temasRelacionadosList, this.subtitle});

}




final List<CardsPrincipal> ejeTematicoList = [
  CardsPrincipal(
    imageUrl: "images/EJE TEMATICO/1.jpg",
    title: 'Historia Antigüa',
    description: 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
    video: "Video",
      subtitle: "Temas Relacionados",
    temasRelacionadosList: [
      CardsPrincipal(
          imageUrl: "images/EJE TEMATICO/1.jpg",
          title: 'Image 1',
          description: "Description 1",
          video: "Video"
      ),

    ]
  ),
  CardsPrincipal(
      imageUrl: "images/EJE TEMATICO/2.jpg",
      title: 'Afro en el mundo',
      description: 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
      video: "Video",
    subtitle: "Paises",
  ),
  CardsPrincipal(
      imageUrl: "images/EJE TEMATICO/3.jpg",
      title: 'África Imperial',
      description: 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
      video: "Video",
    subtitle: "Divisiones",
  ),
  CardsPrincipal(
      imageUrl: "images/EJE TEMATICO/4.jpg",
      title: 'Mujer',
      description: 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
      video: "Video",
    subtitle: "Mujeres",
  ),
];



final List<CardsPrincipal> temasInteresList = [
  CardsPrincipal(
      imageUrl: "images/TEMAS INTERES/1.jpg",
      title: 'Antigüo Egipto',
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      video: "Video",


  ),
  CardsPrincipal(
      imageUrl: "images/TEMAS INTERES/2.jpg",
      title: 'Image 1',
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      video: "Video"
  ),
  CardsPrincipal(
      imageUrl: "images/TEMAS INTERES/3.jpg",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
  CardsPrincipal(
      imageUrl: "images/TEMAS INTERES/4.jpg",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
];




final List<CardsPrincipal> aprendeJugandoList = [
  CardsPrincipal(
      imageUrl: "https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1040&q=80",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
  CardsPrincipal(
      imageUrl: "https://images.unsplash.com/photo-1587754572199-06c78e442f51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
  CardsPrincipal(
      imageUrl: "https://images.unsplash.com/photo-1542204625-ca960ca44635?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
  CardsPrincipal(
      imageUrl: "https://images.unsplash.com/photo-1461151304267-38535e780c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1490&q=80",
      title: 'Image 1',
      description: "Description 1",
      video: "Video"
  ),
];


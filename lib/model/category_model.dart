class Category {
  String name;
  String img;
  List<TypeCmn> type = [];
  Category({
    required this.name,
    required this.img,
    required this.type,
  });
}

class TypeCmn {
  String name;
  String img;
  TypeCmn({
    required this.name,
    required this.img,
  });
}

List<Category> category = [
  Category(
    name: "Nature",
    img: "https://wallpapercave.com/dwp1x/wp2599594.jpg",
    type: [
      TypeCmn(
          name: "Mountain",
          img:
              "https://images.unsplash.com/photo-1567739665094-c24f043b8407?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
      TypeCmn(
          name: "Sea",
          img:
              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3Vuc2V0JTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
      TypeCmn(
          name: "Beach",
          img: "https://t3.gstatic.com/images?q=tbn:ANd9GcSd9TC71gnMDrhBMsb1HMnzLuFA2klIY2UjXQZmX0f0TaiaSpLL"),
    ],
  ),
  Category(
    name: "Abstracts",
    img: "https://c4.wallpaperflare.com/wallpaper/837/798/370/mountains-wallpaper-preview.jpg",
    type: [],
  ),
  Category(
    name: "Lofi",
    img: "https://images5.alphacoders.com/110/1105097.jpg",
    type: [],
  ),
  Category(
    name: "Glitters",
    img:
        "https://thumbs.dreamstime.com/b/christmas-golden-light-shine-particles-bokeh-black-background-holiday-concept-84402793.jpg",
    type: [],
  ),
  Category(
    name: "Monsoon",
    img: "https://www.ethicare.in/wp-content/uploads/201402-orig-defeated-949x534.jpg",
    type: [],
  ),
  Category(
    name: "winter",
    img:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Oberlose_Schwarzenberg_Panorama_%28cropped%29.jpg/1200px-Oberlose_Schwarzenberg_Panorama_%28cropped%29.jpg",
    type: [],
  ),
  Category(
    name: "Summer",
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUW3Q1k_c4GPfMHpv8-8sORYKAwBSA5HxJdk4DaNhcozS6tdIt",
    type: [],
  ),
  Category(
    name: "Dark",
    img:
        "https://e0.pxfuel.com/wallpapers/396/780/desktop-wallpaper-epic-fantasy-dark-background-dark-landscape-fantasy.jpg",
    type: [],
  ),
  Category(
    name: "Light",
    img: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTkcg-v24Yo9Ao7bzmhGDSZnF3_lcc6L8bLbhv9OsNgVptMsV_U",
    type: [],
  ),
  Category(
    name: "Animals",
    img: "https://wallpapers.com/images/hd/tiger-animal-resting-3sv2d935yijne42n.jpg",
    type: [
      TypeCmn(name: "Cat", img: "https://cdn.wallpapersafari.com/67/3/NWidYm.jpg"),
      TypeCmn(
        name: "Dog",
        img:
            "https://c4.wallpaperflare.com/wallpaper/632/226/393/dog-backgrounds-for-desktop-hd-backgrounds-wallpaper-preview.jpg",
      ),
      TypeCmn(name: "Lion", img: "https://a-z-animals.com/media/2022/09/iStock-492611032.jpg"),
      TypeCmn(name: "Tiger", img: "https://wallpaperaccess.com/full/1129506.jpg"),
      TypeCmn(
          name: "Elephent",
          img: "https://t3.ftcdn.net/jpg/01/96/66/06/360_F_196660649_atWsgvxXtKsqofyE8CUPlxjAmpWm4EBV.jpg"),
    ],
  ),
  Category(
    name: "Sports",
    img:
        "https://c4.wallpaperflare.com/wallpaper/971/967/737/sports-images-for-desktop-background-wallpaper-preview.jpg",
    type: [
      TypeCmn(
          name: "Football",
          img:
              "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSNGLR7f34bD6tOTFZopDcSVI52PgwYKHUXYsv_qsGDUOP4PBAC"),
      TypeCmn(
          name: "Cricket",
          img:
              "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSDMJSkpHeAbZ0ZlmNlBiqQ7gOvyOaGWBYp-9tWu78vcbp66ykI"),
      TypeCmn(
          name: "Vollyball",
          img: "https://t3.gstatic.com/images?q=tbn:ANd9GcQj72TE7E-TXb8WK7_WO9xM8wDNulgJF9Zi0tOOlkb448kd_aaV"),
      TypeCmn(
          name: "BasketBall",
          img: "https://t1.gstatic.com/images?q=tbn:ANd9GcSLtzOzoTYh9x1TWWzDpS9yLGW_6xxSRk6sgmdAMyKMNR-mdm16"),
      // TypeCmn(name: "HandBall", img: "assets/images/HandBall.jpg"),
    ],
  ),
  Category(
    name: "Attitude",
    img: "https://wallpapercave.com/wp/wp3989323.jpg",
    type: [],
  ),
  Category(
    name: "Movies",
    img:
        "https://static.vecteezy.com/system/resources/previews/005/502/524/original/cinema-background-concept-movie-theater-object-on-red-curtain-background-and-movie-time-with-electric-bulbs-frame-illustration-free-vector.jpg",
    type: [],
  ),
  Category(
    name: "Camera",
    img: "https://png.pngtree.com/background/20230412/original/pngtree-camera-screen-picture-image_2396928.jpg",
    type: [],
  ),
  Category(
    name: "Space",
    img: "https://t3.ftcdn.net/jpg/05/63/56/46/360_F_563564657_BwBurbC7wl44zfcDYOdKIOtKUf85CI1Q.jpg",
    type: [],
  ),
  Category(
    name: "Cars",
    img:
        "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
    type: [],
  ),
  Category(
    name: "Bikes",
    img: "https://c4.wallpaperflare.com/wallpaper/173/288/1014/bikes-images-background-wallpaper-preview.jpg",
    type: [],
  ),
  Category(
    name: "Moon Light",
    img: "https://wallpapercave.com/wp/wp2858640.jpg",
    type: [],
  ),
  Category(
    name: "Celibrities",
    img: "https://images7.alphacoders.com/334/334908.jpg",
    type: [],
  ),
  Category(
    name: "Heroes",
    img:
        "https://e0.pxfuel.com/wallpapers/532/17/desktop-wallpaper-dc-vs-marvel-heroes-resolution-background-and-marvel-and-dc-comics.jpg",
    type: [
      TypeCmn(name: "Marvel", img: "https://wallpaperaccess.com/full/400576.jpg"),
      TypeCmn(name: "DC Comics", img: "https://wallpaperaccess.com/full/2529480.jpg"),
    ],
  ),
  Category(
    name: "Fitness",
    img: "https://wallpapers.com/images/featured/fitness-2e1dufzgv4p5mtk6.jpg",
    type: [
      TypeCmn(
          name: "Gym",
          img:
              "https://img.freepik.com/premium-photo/contemporary-spotless-fitness-gym-center-interiorgenerative-ai_391052-10889.jpg"),
      TypeCmn(
          name: "Yoga",
          img:
              "https://rukminim1.flixcart.com/image/850/1000/l0e6kcw0/poster/7/w/w/medium-yoga-background-hd-wall-poster-on-quality-paper-13x19-original-imagc6xwg78zd28f.jpeg?q=90"),
    ],
  ),
  Category(
    name: "Quotes",
    img: "https://skyprep.com/wp-content/uploads/2013/07/Alfred_Quotes1.jpg",
    type: [
      TypeCmn(
          name: "Quotes",
          img:
              "https://rare-gallery.com/thumbs/4581730-nature-landscape-birds-animals-eagle-quote-inspirational-mountains-digital-art.jpg"),
      TypeCmn(
          name: "Motivation",
          img: "https://t3.ftcdn.net/jpg/03/88/29/88/360_F_388298845_T1URO6DKys4Aj8abLDRua2ZH72FJ7pMQ.jpg"),
    ],
  ),
  Category(
    name: "Boys",
    img: "https://images.hdqwalls.com/download/urban-boy-sitting-on-car-4k-69-1680x1050.jpg",
    type: [],
  ),
  Category(
    name: "Girls",
    img: "https://images.hdqwalls.com/wallpapers/bthumb/girl-rain-bus-stand-4k-i5.jpg",
    type: [],
  ),
  Category(
    name: "Hacker",
    img: "https://images.hdqwalls.com/wallpapers/bthumb/anonymus-dark-life-4k-hh.jpg",
    type: [],
  ),
  Category(
    name: "Sigma",
    img:
        "https://png.pngtree.com/thumb_back/fh260/background/20230516/pngtree-builder-posing-in-photo-studio-3d-realistic-image_2562691.png",
    type: [],
  ),
  Category(
    name: "Army",
    img: "https://img.freepik.com/premium-vector/military-illustration-army-background_40382-217.jpg?w=1480",
    type: [],
  ),
  Category(
    name: "Country",
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDdpu74ZAUWE5EkHUysrfCo-O5JOvDKYcSK3U_dLKbEOo6PBgS",
    type: [
      TypeCmn(
          name: "India",
          img:
              "https://assets.traveltriangle.com/blog/wp-content/uploads/2015/07/Blue-waters-of-Andaman-and-Nicobar-Islands.jpg"),
      TypeCmn(
          name: "Usa",
          img:
              "https://img.freepik.com/free-vector/flat-design-grunge-american-flag_23-2149390093.jpg?w=1380&t=st=1688104339~exp=1688104939~hmac=37e87e3b3ec420fbf07489e69fe38cc7460c725faf6cbd6719299c3919bc0505"),
      TypeCmn(
          name: "China",
          img:
              "https://e0.pxfuel.com/wallpapers/253/724/desktop-wallpaper-ancient-chinese-background-design-ancient-chinese-architecture.jpg"),
      TypeCmn(
          name: "England",
          img:
              "https://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2012/9/14/1347627381043/Big-Ben-Houses-of-Parliam-010.jpg"),
      TypeCmn(
          name: "Russia",
          img: "https://www.planetware.com/wpimages/2019/10/russia-best-places-to-visit-st-petersburg.jpg"),
      TypeCmn(name: "France", img: "https://5.imimg.com/data5/OA/RD/MY-6452521/europe-tour-from-chennai-1000x1000.jpg"),
      TypeCmn(
          name: "Italy",
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8BbZ_8BnHyovRttjvbGsM-GWF2wSly5Mtmf9m-POmVC1Ok-2d"),
      TypeCmn(
          name: "Japan",
          img:
              "https://a.cdn-hotels.com/gdcs/production147/d1285/0745ceba-e251-44dd-900d-758bd7078d8a.jpg?impolicy=fcrop&w=800&h=533&q=medium"),
      TypeCmn(
          name: "New Zealand",
          img:
              "https://s2.best-wallpaper.net/wallpaper/1920x1200/1806/Canterbury-New-Zealand-Mount-Cook-river-ice-winter_1920x1200.jpg"),
      TypeCmn(
          name: "Australia",
          img:
              "https://s.yimg.com/os/zh-Hant-TW/homerun/tw-travel.tripass_news.com.tw/dd370981cb1881b20313ee816b8b62d4"),
      TypeCmn(
          name: "Switzerland", img: "https://img2.goodfon.com/wallpaper/nbig/4/80/shveycariya-sisikon-urner-gory.jpg"),
    ],
  ),
  Category(
    name: "Festivals",
    img:
        "https://img.freepik.com/premium-vector/vintage-chinese-blank-background-editablle-free-text_565554-152.jpg?w=1380",
    type: [],
  ),
  Category(
    name: "IT",
    img:
        "https://img.freepik.com/premium-vector/circuit-technology-background-with-hi-tech-digital-data-connection-system-computer-electronic-desing_29971-553.jpg?w=1060",
    type: [],
  ),
  Category(
    name: "Horror",
    img: "https://www.pcgamesn.com/wp-content/sites/pcgamesn/legacy/steam_spy_shut_down.jpeg",
    type: [],
  ),
  Category(
    name: "Cartoon",
    img: "https://i.pinimg.com/564x/26/f7/08/26f70838747689602481cc2dfd464b50.jpg",
    type: [],
  ),
  Category(
    name: "Dj",
    img:
        "https://rukminim1.flixcart.com/image/416/416/kpvivm80/poster/d/y/z/medium-dj-avicii-concert-music-poster-pp3086-original-imag4yphfq97yhgn.jpeg?q=70",
    type: [],
  ),
  Category(
    name: "Samsung",
    img:
        "https://st4.depositphotos.com/9515902/38166/i/450/depositphotos_381660550-stock-photo-liquid-lines-pattern-wave-shape.jpg",
    type: [],
  ),
];

/*

  
 */

import 'package:easy_eat/models/food_model.dart';

class Foodstall {
  final String id;
  final String name;
  final String image;
  final String description;
  final bool isOpen;
  final String category;
  final List<Food> availableFoods;
  final List<Food> topFoods;

  Foodstall({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.isOpen,
    required this.category,
    required this.availableFoods,
    required this.topFoods,
  });
}

List<Foodstall> foodstallList = [
  Foodstall(
    id: "001",
    name: "Nasi Goreng Kang Mak",
    image: "assets/images/stall.jpg",
    description: "Berbagai macam nasi goreng dengan bumbu spesial",
    isOpen: true,
    category: "Per-nasi-an",

    availableFoods: [
      Food(
        name: "Nasi Goreng Ayam Special",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Pedas", "Sedang", "Tidak Pedas"],
        addons: {
          "Kerupuk": 3000,
          "Telur Dadar": 5000,
          "Sosis": 7000,
        },
      ),
      Food(
        name: "Nasi Goreng Seafood",
        price: 30000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Nasi Goreng Vegetarian",
        price: 22000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
    topFoods: [
      Food(
        name: "Nasi Goreng Ayam Special",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Nasi Goreng Seafood",
        price: 30000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
  ),
  Foodstall(
    id: "002",
    name: "Mie Ayam Bakso Pak Jokodo widodo",
    image: "assets/images/stall.jpg",
    description: "Mie ayam dengan bakso homemade",
    isOpen: true,
    category: "Aneka mie",
    availableFoods: [
      Food(
        name: "Mie Ayam Bakso",
        price: 20000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Kuah Banyak", "Kuah Sedikit", "Tanpa Kuah"],
        addons: {
          "Pangsit": 5000,
          "Bakso Extra": 8000,
          "Jamur": 4000,
        },
      ),
      Food(
        name: "Mie Ayam Jamur",
        price: 22000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Bakso Super Jumbo",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
    topFoods: [
      Food(
        name: "Mie Ayam Bakso",
        price: 20000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Bakso Super Jumbo",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
  ),
  Foodstall(
    id: "003",
    name: "Sop Ibu Bahagia",
    image: "assets/images/stall.jpg",
    description: "Berbagai sop hangat untuk keluarga",
    isOpen: true,
    category: "Makanan kuah",
    availableFoods: [
      Food(
        name: "Sop Buntut",
        price: 35000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Pedas", "Tidak Pedas"],
        addons: {
          "Nasi": 5000,
          "Kerupuk": 3000,
          "Sambal Extra": 2000,
        },
      ),
      Food(
        name: "Sop Ayam Kampung",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Sop Konro",
        price: 30000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
    topFoods: [
      Food(
        name: "Sop Buntut",
        price: 35000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Sop Ayam Kampung",
        price: 25000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
  ),
  Foodstall(
    id: "004",
    name: "Es Teh Segar",
    image: "assets/images/stall.jpg",
    description: "Minuman segar berbagai varian",
    isOpen: true,
    category: "Minuman",

    availableFoods: [
      Food(
        name: "Es Teh Manis",
        price: 8000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Kurang Manis", "Manis", "Extra Manis"],
      ),
      Food(
        name: "Es Jeruk",
        price: 10000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Es Campur",
        price: 15000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
    topFoods: [
      Food(
        name: "Es Teh Manis",
        price: 8000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Es Campur",
        price: 15000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
  ),
  Foodstall(
    id: "005",
    name: "Snack Time",
    image: "assets/images/stall.jpg",
    description: "Camilan enak untuk teman ngobrol",
    isOpen: true,
    category: "Snack",
    availableFoods: [
      Food(
        name: "Kentang Goreng",
        price: 15000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Pedas", "BBQ", "Keju"],
      ),
      Food(
        name: "Roti Bakar",
        price: 12000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
        options: ["Coklat", "Keju", "Kombinasi"],
      ),
      Food(
        name: "Martabak Mini",
        price: 10000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
    topFoods: [
      Food(
        name: "Kentang Goreng",
        price: 15000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
      Food(
        name: "Roti Bakar",
        price: 12000,
        frontImage: "assets/images/f_nasi_goreng.jpg",
        backImage: "assets/images/b_nasi_goreng.png",
      ),
    ],
  ),
];
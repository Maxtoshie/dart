class Book {
  String name;
  String author;
  double price;

  Book(this.name, this.author, this.price);

  void display() {
    print('Name: $name');
    print('Author: $author');
    print('Price: \$${price.toStringAsFixed(2)}');
  }
}

class Distance {
  final double meter;

  Distance(this.meter);

  //named constructor
  Distance.km(double km) : this.meter = km * 1000;
  Distance.m(double m) : this.meter = m;
  Distance.cm(double cm) : this.meter = cm / 100;

  //overloading operator
  Distance operator +(Distance other) {
    return Distance(this.meter + other.meter);
  }

  //use getter to convert the final result after adding the obj together
  String get km => '${this.meter} / 1000} Km' ;
  String get m => '${this.meter} m' ;
  String get cm => '${this.meter * 100} cm' ;

  @override
  String toString() {
    return 'Meter = ${this.meter} ';
  }
}

void main() {
  Distance d1 = Distance.cm(10000);
  Distance d2 = Distance.m(1500);
  Distance total = d1 + d2;

  print(total.m);
}

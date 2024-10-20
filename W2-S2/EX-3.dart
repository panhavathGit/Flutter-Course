class MyDuration {
  final double _milliseconds; 

  MyDuration(this._milliseconds);

  // Named constructors
  MyDuration.fromHours(double hour) : _milliseconds = hour * 60 * 60 * 1000;
  MyDuration.fromMinutes(double minute) : _milliseconds = minute * 60 * 1000;
  MyDuration.fromSeconds(double second) : _milliseconds = second * 1000;

  // Operator Overloading for Addition
  MyDuration operator +(MyDuration other) {
    return MyDuration(this._milliseconds + other._milliseconds);
  }

  // Operator Overloading for Subtraction
  MyDuration operator -(MyDuration other) {
    if (this._milliseconds < other._milliseconds) {
      throw Exception('Cannot subtract a bigger duration.');
    }
    return MyDuration(this._milliseconds - other._milliseconds);
  }

  // Operator Overloading for Comparison
  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
 
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3.5); 
  MyDuration duration2 = MyDuration.fromMinutes(30); 

  print(duration1); 
  print(duration2);

  print(duration1 + duration2); 
  print(duration2 > duration1); 

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}

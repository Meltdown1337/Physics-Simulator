class field {
  String name = "field";
  PVector direction = new PVector(0, 0, 0);
  PVector a = new PVector(0, 0, 0);
  PVector f = new PVector(0, 0, 0);

  field(PVector accel, PVector force) {
    a = accel;
    f = force;
  }
}

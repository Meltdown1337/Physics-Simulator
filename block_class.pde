class block {
  String name = "block";
  float x = 0;
  float y = 0;
  float z = 0;
  PVector v = new PVector(0, 0, 0);
  PVector a = new PVector(0, 0, 0);
  float m = 0;

  block(float xpos, float ypos, float zpos, PVector accel, float mass) {
    x = xpos;
    y = ypos;
    z = zpos;
    a = accel;
    m = mass;
  }

  void applyV() {
    x += v.x;
    y += v.y;
    z += v.z;
  }

  void resetV(float[] prod) {
    v = new PVector(v.x*prod[0], v.y*prod[1], v.z*prod[2]);
  }

  void applyA() {
    v.add(a);
    a = new PVector(0, 0, 0);
  }

  void applyField(field F) {
    PVector accelTmp = new PVector(0, 0, 0);
    float[] f = F.f.array();
    for (int i = 0; i < 3; i++) {
      f[i] = f[i] / m;
    }
    accelTmp.add(new PVector(f[0], f[1], f[2]));
    accelTmp.add(F.a);
    a.add(accelTmp);
  }

  void update() {
    this.applyA();
    this.applyV();
    if (x < 0) {
      x = 0;
      this.resetV(new float[] {-1, 0, 0});
    } else if (x > w) {
      x = w;
      this.resetV(new float[] {-1, 0, 0});
    }
    if (y < 0) {
      y = 0;
      this.resetV(new float[] {0, -1, 0});
    } else if (y > h) {
      y = h;
      this.resetV(new float[] {0, -1, 0});
    }
    if (z < 0) {
      z = 0;
      this.resetV(new float[] {0, 0, -1});
    } else if (z > h) {
      z = h;
      this.resetV(new float[] {0, 0, -1});
    }
    translate(x, y, z);
    noFill();
    //stroke(random(255), random(255), random(255));
    stroke(0, 255, 0);
    box(30);
  }
}

ArrayList<block> objs = new ArrayList<block>();
ArrayList<field> fields = new ArrayList<field>();
int w = 500;
int h = 500;
int d = 500;

void setup() {
  size(500, 500, P3D);
  for (int i = 0; i < 1; i++) {
    objs.add(new block(w/2, h/2, d/2, new PVector(0, 0, 0), random(90, 150)));
  }
  fields.add(new field(new PVector(0, 0, 0), new PVector(0, 100, 0)));
}

void draw() {
  translate(0, 0, -500);
  background(0);

  for (int i = 0; i < objs.size(); i++) {
    //if (frameCount % 120 == 0) {
      //fields.get(0).f = new PVector(random(-100, 100), random(-100, 100), random(-100, 100));
    //}
    for (field j : fields) {
      objs.get(i).applyField(j);
    }
    pushMatrix();
    objs.get(i).update();
    popMatrix();
  }
}

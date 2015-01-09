class Cart {

  private float y, mass, mechEnergy; // m, m, kg, J
  
  // true if going forward, false if going backward
  private boolean forward;
  
  Cart() {
    y = height/2;
    mass = 10;
    mechEnergy = mass * 9.80665 * y + 100000; // all potential energy at first
  }
  
  float potentialEnergy() {
    return mass * 9.80665 * y;
  }
  
  float kineticEnergy() {
    return mechEnergy - potentialEnergy();
  }
  
  float speed() {
    return sqrt(2 * kineticEnergy() / mass);
  }
  
  PVector velocity() {
    // determine slope
    float slope = 0,
          hypotenuse = sqrt(1 + slope*slope),
          v = speed();
    return new PVector(v * 1/hypotenuse, v * slope/hypotenuse);
  }
  
  void go() {
    draw();
    PVector increment = velocity();
    if (forward) {
      xOffset += increment.x;
    } else {
      xOffset -= increment.x;
    }
  }
  
  void draw() {
    noStroke();
    fill(#FF0000);
    ellipse(width/2 + xOffset, height - y, 10, 10);
  }
}

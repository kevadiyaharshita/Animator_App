class PlanetModal {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;
  String size;
  String satellites;
  String orbitalSpeed;
  String surfaceArea;
  String rotationPeriod;
  String temperature;
  String distancefromEarth;

  PlanetModal(
      this.position,
      this.name,
      this.image,
      this.velocity,
      this.distance,
      this.description,
      this.size,
      this.satellites,
      this.orbitalSpeed,
      this.surfaceArea,
      this.rotationPeriod,
      this.temperature,
      this.distancefromEarth);

  factory PlanetModal.fromMap({required Map planet}) {
    return PlanetModal(
      planet['position'],
      planet['name'],
      planet['image'],
      planet['velocity'],
      planet['distance'],
      planet['description'],
      planet['size'],
      planet['satellites'],
      planet['orbitalSpeed'],
      planet['surfaceArea'],
      planet['rotationPeriod'],
      planet['temperature'],
      planet['distancefromEarth'],
    );
  }
}

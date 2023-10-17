class PlanetModal {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;

  PlanetModal(this.position, this.name, this.image, this.velocity,
      this.distance, this.description);

  factory PlanetModal.fromMap({required Map planet}) {
    return PlanetModal(planet['position'], planet['name'], planet['image'],
        planet['velocity'], planet['distance'], planet['description']);
  }
}

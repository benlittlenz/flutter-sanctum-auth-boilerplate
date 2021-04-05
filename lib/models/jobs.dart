class Job {
  String id;
  String ref;
  String description;
  String address;
  String suburb;
  String city;
  String status;
  String active;

  Job(
      {this.id,
      this.ref,
      this.description,
      this.address,
      this.suburb,
      this.city,
      this.status,
      this.active});

  factory Job.fromJson(Map<String, dynamic> item) {
    return Job(
      id: item['id'].toString(),
      ref: item['job_ref'],
      description: item['job_description'],
      address: item['address'],
      suburb: item['suburb'],
      city: item['city'],
      status: item['status'],
      active: item['active'],
    );
  }
}

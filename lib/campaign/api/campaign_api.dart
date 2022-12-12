void addCampaign(request, judul, deskripsi) async {
  await request.post(
      'http://127.0.0.1:8000/campaign/createajax/',
      // 'http://$port/flutter_notes/',
      {"title": judul, "description": deskripsi});
}
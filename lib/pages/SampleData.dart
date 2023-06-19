class SampleData {
  String name;
  String imageAddress;
  String schoolName;
  int id;

  SampleData(
      {required this.id,
      required this.name,
      required this.imageAddress,
      required this.schoolName}) {
    assert(id >= 0, 'index가 0보다 커야함');
  }
  static List<SampleData> samples = [
    SampleData(
      id: 0,
      name: '박다금',
      imageAddress: 'assets/images/profile.png',
      schoolName: '진주여자중학교',
    ),
    SampleData(
      id: 1,
      name: '박다은',
      imageAddress: 'assets/images/profile.png',
      schoolName: '진주여자중학교',
    ),
    SampleData(
      id: 2,
      name: '박다동',
      imageAddress: 'assets/images/profile.png',
      schoolName: '진주여자중학교',
    ),
  ];
}

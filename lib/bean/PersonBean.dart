class PersonBean{
  final int mValue;
  PersonBean(this.mValue);
  @override
  bool operator ==(other) {
    return other is PersonBean&&other.mValue==mValue;
  }
  @override
  int get hashCode => super.hashCode;

}
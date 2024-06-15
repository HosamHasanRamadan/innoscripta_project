typedef LimitAndOffset = ({
  int limit,
  int offset,
});

LimitAndOffset getLimitAndOffsetFrom(int pageSize, int pageNumber) {
  return (
    limit: pageSize,
    offset: (pageNumber - 1) * pageSize,
  );
}

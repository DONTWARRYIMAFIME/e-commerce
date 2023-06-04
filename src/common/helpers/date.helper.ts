import * as moment from "moment";

export function compare(dateTimeA, dateTimeB) {
  const momentA = moment(dateTimeA, "DD/MM/YYYY");
  const momentB = moment(dateTimeB, "DD/MM/YYYY");
  if (momentA > momentB) return 1;
  else if (momentA < momentB) return -1;
  else return 0;
}

export interface FilterItem {
  objectType: number;
  name: string;
  key: string;
  combos: {
    items: Object[];
    keyName: string;
    valueName: string;
  }
}

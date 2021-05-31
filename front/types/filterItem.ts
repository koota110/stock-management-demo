export interface FilterItem {
  objectType: number;
  name: string;
  combos:{
    items: Object[];
    keyName: string;
    valueName: string;
  }
}

export interface Stock {
  id: string;
  name: string;
  amount: number;
  unit: string;
  purchaseDate: Date;
  expirationDate: Date;
  remarks: string;
}

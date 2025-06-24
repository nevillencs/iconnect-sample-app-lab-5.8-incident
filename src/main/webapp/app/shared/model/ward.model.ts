export interface IWard {
  id?: number;
  wardReferenceId?: string;
  wardName?: string;
  wardClassType?: string;
  wardLocation?: string;
}

export class Ward implements IWard {
  constructor(
    public id?: number,
    public wardReferenceId?: string,
    public wardName?: string,
    public wardClassType?: string,
    public wardLocation?: string
  ) {}
}

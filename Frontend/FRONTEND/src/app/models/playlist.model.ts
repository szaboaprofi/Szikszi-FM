export interface Playlist {
    id:number;
    nev:string;
    dal_id:number;
    sorrend_szam:number;
    musor_id:number;
    dal?: import('./music.model').Music;
}
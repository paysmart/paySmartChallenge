class GenresHelper {
  static getIdToGenreName(int id) {
    const map = {
      12: 'Aventura',
      14: 'Fantasia',
      16: 'Animação',
      18: 'Drama',
      27: 'Terror',
      28: 'Ação',
      35: 'Comédia',
      36: 'História',
      37: 'Velho Oeste',
      53: 'Suspense',
      80: 'Crime',
      99: 'Documentário',
      878: 'Ficção Científica',
      9648: 'Mistério',
      10402: 'Musica',
      10770: 'Filme de TV',
      10749: 'Romance',
      10751: 'Família',
      10752: 'Guerra'
    };
    return map[id] ?? '';
  }
}

class Sticker
  def initialize
    @stickers = [
      { stkid: 1, stkpkgid: 1, stkver: 100 },
      { stkid: 2, stkpkgid: 1, stkver: 100 },
      { stkid: 3, stkpkgid: 1, stkver: 100 },
      { stkid: 4, stkpkgid: 1, stkver: 100 },
      { stkid: 5, stkpkgid: 1, stkver: 100 },
      { stkid: 6, stkpkgid: 1, stkver: 100 },
      { stkid: 7, stkpkgid: 1, stkver: 100 },
      { stkid: 8, stkpkgid: 1, stkver: 100 },
      { stkid: 9, stkpkgid: 1, stkver: 100 },
      { stkid: 10, stkpkgid: 1, stkver: 100 },
      { stkid: 11, stkpkgid: 1, stkver: 100 },
      { stkid: 12, stkpkgid: 1, stkver: 100 },
      { stkid: 13, stkpkgid: 1, stkver: 100 },
      { stkid: 14, stkpkgid: 1, stkver: 100 },
      { stkid: 15, stkpkgid: 1, stkver: 100 },
      { stkid: 16, stkpkgid: 1, stkver: 100 },
      { stkid: 17, stkpkgid: 1, stkver: 100 },
      { stkid: 21, stkpkgid: 1, stkver: 100 },
      { stkid: 100, stkpkgid: 1, stkver: 100 },
      { stkid: 101, stkpkgid: 1, stkver: 100 },
      { stkid: 102, stkpkgid: 1, stkver: 100 },
      { stkid: 103, stkpkgid: 1, stkver: 100 },
      { stkid: 104, stkpkgid: 1, stkver: 100 },
      { stkid: 105, stkpkgid: 1, stkver: 100 },
      { stkid: 106, stkpkgid: 1, stkver: 100 },
      { stkid: 107, stkpkgid: 1, stkver: 100 },
      { stkid: 108, stkpkgid: 1, stkver: 100 },
      { stkid: 109, stkpkgid: 1, stkver: 100 },
      { stkid: 110, stkpkgid: 1, stkver: 100 },
      { stkid: 111, stkpkgid: 1, stkver: 100 }
    ]
  end

  def lottery
    @stickers.sample
  end
end

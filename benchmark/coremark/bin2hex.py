from pathlib import Path


ROM_WORDS = 8192
DATA_WORDS = 3072
NOP = 0x00000013


def words_from_binary(path: Path) -> list[int]:
    data = path.read_bytes()
    return [
        int.from_bytes(data[i:i + 4].ljust(4, b"\x00"), "little")
        for i in range(0, len(data), 4)
    ]


def write_image(path: Path, words: list[int], total_words: int, fill: int) -> None:
    if len(words) > total_words:
        raise ValueError(f"{path.name}: {len(words)} words exceeds {total_words}")
    words.extend([fill] * (total_words - len(words)))
    path.write_text("".join(f"{word:08x}\n" for word in words), encoding="ascii")


def main() -> None:
    root = Path(__file__).resolve().parent
    build = root / "build"
    write_image(
        build / "coremark_text.hex",
        words_from_binary(build / "coremark_text.bin"),
        ROM_WORDS,
        NOP,
    )
    (build / "coremark_text.mi").write_text(
        (build / "coremark_text.hex").read_text(encoding="ascii"),
        encoding="ascii",
    )
    write_image(
        build / "coremark_data.hex",
        words_from_binary(build / "coremark_data.bin"),
        DATA_WORDS,
        0,
    )


if __name__ == "__main__":
    main()

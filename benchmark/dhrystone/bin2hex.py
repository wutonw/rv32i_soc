from pathlib import Path


ROM_WORDS = 8192
DATA_WORDS = 5120
NOP = 0x00000013


def read_words(path: Path) -> list[int]:
    data = path.read_bytes()
    return [
        int.from_bytes(data[i:i + 4].ljust(4, b"\x00"), "little")
        for i in range(0, len(data), 4)
    ]


def write_image(path: Path, words: list[int], count: int, fill: int) -> None:
    if len(words) > count:
        raise ValueError(f"{len(words)} words exceeds image capacity {count}")
    words.extend([fill] * (count - len(words)))
    path.write_text("".join(f"{word:08x}\n" for word in words), encoding="ascii")


def main() -> None:
    build = Path(__file__).resolve().parent / "build"
    write_image(
        build / "dhrystone_text.hex",
        read_words(build / "dhrystone_text.bin"),
        ROM_WORDS,
        NOP,
    )
    (build / "dhrystone_text.mi").write_text(
        (build / "dhrystone_text.hex").read_text(encoding="ascii"),
        encoding="ascii",
    )
    write_image(
        build / "dhrystone_data.hex",
        read_words(build / "dhrystone_data.bin"),
        DATA_WORDS,
        0,
    )


if __name__ == "__main__":
    main()

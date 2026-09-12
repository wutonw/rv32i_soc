import argparse
from pathlib import Path


NOP = 0x00000013


def read_words(path: Path) -> list[int]:
    data = path.read_bytes()
    return [
        int.from_bytes(data[i:i + 4].ljust(4, b"\x00"), "little")
        for i in range(0, len(data), 4)
    ]


def write_image(path: Path, words: list[int], count: int, fill: int) -> None:
    if len(words) > count:
        raise ValueError(f"{path.name}: {len(words)} words exceeds {count}")
    words.extend([fill] * (count - len(words)))
    path.write_text("".join(f"{word:08x}\n" for word in words), encoding="ascii")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("build_dir", type=Path)
    parser.add_argument("--rom-words", type=int, default=8192)
    parser.add_argument("--data-words", type=int, default=7168)
    args = parser.parse_args()
    build = args.build_dir.resolve()

    write_image(build / "text.hex", read_words(build / "text.bin"),
                args.rom_words, NOP)
    write_image(build / "data.hex", read_words(build / "data.bin"),
                args.data_words, 0)


if __name__ == "__main__":
    main()

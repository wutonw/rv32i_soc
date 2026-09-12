from pathlib import Path


ROM_WORDS = 1024
NOP = 0x00000013


def main() -> None:
    build = Path(__file__).resolve().parent / "build"
    data = (build / "benchmark.bin").read_bytes()
    capacity = ROM_WORDS * 4

    if len(data) > capacity:
        raise ValueError(
            f"benchmark is {len(data)} bytes, larger than the {capacity}-byte pROM"
        )

    words = [
        int.from_bytes(data[offset:offset + 4].ljust(4, b"\x00"), "little")
        for offset in range(0, len(data), 4)
    ]
    words.extend([NOP] * (ROM_WORDS - len(words)))

    image = "".join(f"{word:08x}\n" for word in words)
    (build / "benchmark.hex").write_text(image, encoding="ascii")
    (build / "benchmark.mi").write_text(image, encoding="ascii")


if __name__ == "__main__":
    main()

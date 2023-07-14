#let version = "v2023-07-15-0"

#set page(
    paper: "a4",
    margin: (x: 0.4cm, y: 1.5cm),
    header: text(
        fill: gray,
        size: 24pt,
        font: "DejaVu Sans",
        [#h(1fr) ASCII TABLE #h(1fr)]
    ),
    footer: text(
        fill: rgb("#777"),
        [Source code for this document is available on Github: https://github.com/andriamanitra/cheats
         #h(1fr) #version]
    )
)

#set text(
    size: 7pt,
    font: ("DejaVu Sans Mono")
)

#show link: underline

#text(
    fill: rgb("#888"),
    [Note that the vast majority of modern computers systems use #link("https://en.wikipedia.org/wiki/UTF-8")[UTF-8]
    instead of ASCII, but these 128 characters have the same representation in both encodings.]
)

#v(0.5cm)

#grid(
    columns: 4,
    column-gutter: 10pt,
    rows: (12pt, 1fr),
    
    [*Control characters* (#link("https://en.wikipedia.org/wiki/C0_and_C1_control_codes#Basic_ASCII_control_codes")[read more on Wikipedia])],
    [*Printable characters*],
    [],
    [],

    table(
        columns: 5,
        align: (x, y) => (center, center, center, right, left).at(x),
        [*dec*], [*hex*], [*char*], [*binary*], [*notes*],
        [*0*],  [0x00], "'\\0'",     [0], link("https://en.wikipedia.org/wiki/Null_character")[null terminator],
        [*1*],  [0x01],      [],     [1], link("https://en.wikipedia.org/wiki/C0_and_C1_control_codes#SOH")[start of heading],
        [*2*],  [0x02],      [],    [10], link("https://en.wikipedia.org/wiki/C0_and_C1_control_codes#STX")[start of text],
        [*3*],  [0x03],      [],    [11], link("https://en.wikipedia.org/wiki/")[end of text],
        [*4*],  [0x04],      [],   [100], link("https://en.wikipedia.org/wiki/End-of-transmission_character")[end of transmission],
        [*5*],  [0x05],      [],   [101], link("https://en.wikipedia.org/wiki/Enquiry_character")[enquiry],
        [*6*],  [0x06],      [],   [110], link("https://en.wikipedia.org/wiki/Acknowledge_character")[acknowledge],
        [*7*],  [0x07], "'\\a'",   [111], link("https://en.wikipedia.org/wiki/Bell_character")[alert (BEL)],
        [*8*],  [0x08], "'\\b'",  [1000], [BACKSPACE],
        [*9*],  [0x09], "'\\t'",  [1001], link("https://en.wikipedia.org/wiki/Tab_key#Tab_characters")[HORIZONTAL TAB],
        [*10*], [0x0a], "'\\n'",  [1010], [#link("https://en.wikipedia.org/wiki/Line_feed")[LINE FEED] (new~line)],
        [*11*], [0x0b], "'\\v'",  [1011], link("https://en.wikipedia.org/wiki/Horizontal_Tab")[VERTICAL TAB],
        [*12*], [0x0c], "'\\f'",  [1100], link("https://en.wikipedia.org/wiki/Form_feed")[form feed],
        [*13*], [0x0d], "'\\r'",  [1101], link("https://en.wikipedia.org/wiki/Carriage_return")[CARRIAGE RETURN],
        [*14*], [0x0e],      [],  [1110], link("https://en.wikipedia.org/wiki/Shift_Out_and_Shift_In_characters")[shift out],
        [*15*], [0x0f],      [],  [1111], link("https://en.wikipedia.org/wiki/Shift_Out_and_Shift_In_characters")[shift in],
        [*16*], [0x10],      [], [10000], [data link escape],
        [*17*], [0x11],      [], [10001], [device control 1],
        [*18*], [0x12],      [], [10010], [device control 2],
        [*19*], [0x13],      [], [10011], [device control 3],
        [*20*], [0x14],      [], [10100], [device control 4],
        [*21*], [0x15],      [], [10101], link("https://en.wikipedia.org/wiki/Acknowledge_character")[negative ack],
        [*22*], [0x16],      [], [10110], link("https://en.wikipedia.org/wiki/Synchronous_idle")[synchronous idle],
        [*23*], [0x17],      [], [10111], link("https://en.wikipedia.org/wiki/End_Transmission_Block_character")[end-of-transmission-block],
        [*24*], [0x18],      [], [11000], link("https://en.wikipedia.org/wiki/Cancel_character")[cancel],
        [*25*], [0x19],      [], [11001], [end of medium],
        [*26*], [0x1a],      [], [11010], link("https://en.wikipedia.org/wiki/Substitute_character")[substitute],
        [*27*], [0x1b], "'\\e'", [11011], link("https://en.wikipedia.org/wiki/Escape_character")[ESCAPE],
        [*28*], [0x1c],      [], [11100], [file separator],
        [*29*], [0x1d],      [], [11101], [group separator],
        [*30*], [0x1e],      [], [11110], [record separator],
        [*31*], [0x1f],      [], [11111], [unit separator],
        [...],   [...],      [],   [...], [],
        [*127*], [0x7f], [], [1111111], link("https://en.wikipedia.org/wiki/Delete_character")[DEL],
    ),
    ..(
        range(32, 64),
        range(64, 96),
        range(96, 127),
    ).map(charRange => 
    table(
        columns: 4,
        align: (x, y) => (center, center, center, right).at(x),
        [*dec*], [*hex*], [*char*], [*binary*],
        ..charRange.map(n => (
            text(weight: "bold", str(n)),
            "0x" + str(n, base: 16),
            "'" + str.from-unicode(n) + "'",
            str(n, base: 2)
        )).flatten(),
    ))
)


#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Sergey Isaev"
#let locale-catalog-page-numbering-style = context { "Sergey Isaev - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Feb 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "New Computer Modern"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  set text(fill: design-colors-connections)
  set par(leading: design-text-leading*1.7, justify: false)
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Sergey Isaev

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Vienna, Austria],
  [#box(original-link("mailto:s@isaev.cc")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)s\@isaev.cc])],
  [#box(original-link("tel:+43-660-9614136")[#fa-icon("phone", size: 0.9em) #h(0.05cm)+43 660 9614136])],
  [#box(original-link("https://linkedin.com/in/sergisaev")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)sergisaev])],
  [#box(original-link("https://github.com/serjisa")[#fa-icon("github", size: 0.9em) #h(0.05cm)serjisa])],
  [#box(original-link("https://t.me/sergisa")[#fa-icon("telegram", size: 0.9em) #h(0.05cm)sergisa])],
)
#connections(connections-list)



== About Me

#one-col-entry(
  content: [I'm doing a PhD in neuroscience at Igor Adameyko's lab at the Medical University of Vienna. Mostly I'm focused on developing approaches for the analysis and interpretation of multimodal single-cell omics and lineage tracing experiments. Previously worked \(and still am interested\) in cancer immunology and evolutionary zoology.]
)


== Education

// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Medical University of Vienna]

#emph[PhD in Neuroscience]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[July 2022 – present]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\(supervision by Igor Adameyko and Peter Kharchenko\)])], column-gutter: 0cm)

  #v(design-highlights-top-margin);#highlights([Development of methods for lineage tracing analysis based on scRNA-Seq],[Managing of lab's computational servers and research services],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Moscow State University]

#emph[Specialist in Bioengineering and Bioinformatics]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Sept 2015 – June 2021]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Combined BSc and MSc program for both computational and experimental expertise in biology],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Professional Experience

#two-col-entry(
  left-content: [
    #strong[Research Fellow]

#emph[Endocrinology Research Center]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Sept 2021 – June 2022]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\(supervision by Peter Kharchenko\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developing diffusion-based methods for comparison of different single-cell embeddings],[Single-cell analysis in immunological studies],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Bioinformatics Scientist]

#emph[BostonGene]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Nov 2019 – Dec 2021]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\(supervision by Katerina Nuzhdina\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Bulk and single-cell RNA-Seq pipelines creation and curation for tumor microenvironment research],[Managing of corporate educational courses helping to introduce best practices of NGS analysis to new employees],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Undergraduate Research Fellow]

#emph[Institute for Information Transmission Problems of Russian Academy of Sciences]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Nov 2017 – Aug 2021]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [\(supervision by Yuri Panchin\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Comparative and functional genomics of non-model animals \(Dicyemids, Orthonectids\)],)
  ],
)



== Packages

#two-col-entry(
  left-content: [
    #link("https://github.com/kharchenkolab/scLiTr")[#strong[scLiTr]]
  ],
  right-content: [
    #emph[2022 – present]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Python package for single-cell Lineage Tracing analysis])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Development and curation of the package],[Development and application of #emph[clone2vec] algorithm],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://github.com/potulabe/symphonypy")[#strong[symphonypy]]
  ],
  right-content: [
    #emph[2022]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Port of Symphony algorithm of single-cell reference atlas mapping to Python])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Supervision of develoment \(and co-development\) of the package],[Curation of the package],)
  ],
)



== Publications

#one-col-entry(content:[
  #strong[Positioning of sperm tail longitudinal columns depends on NSUN7, an RNA-binding protein destabilizing elongated spermatid transcripts]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Ekaterina A Guseva, Olga A Averina, #strong[#emph[Sergey V Isaev]], et al.

#v(design-highlights-top-margin - design-text-leading)#emph[RNA 31 \(5\), 709-723, 2025]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Unbiased profiling of multipotency landscapes reveals spatial modulators of clonal fate biases]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Alek G Erickson#sym.ast.basic#h(0pt, weak: true) , #strong[#emph[Sergey Isaev]]#sym.ast.basic#h(0pt, weak: true) , Jingyan He, et al. #emph[\(#sym.ast.basic#h(0pt, weak: true) equal contribution\)]

#v(design-highlights-top-margin - design-text-leading)#emph[bioRxiv, 2024.11. 15.623687, 2024]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Multi-omic profiling of follicular lymphoma reveals changes in tissue architecture and enhanced stromal remodeling in high-risk patients]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Andrea J Radtke#sym.ast.basic#h(0pt, weak: true) , Ekaterina Postovalova#sym.ast.basic#h(0pt, weak: true) , Arina Varlamova, ..., #strong[#emph[Sergey Isaev]], et al. #emph[\(#sym.ast.basic#h(0pt, weak: true) equal contribution\)]

#v(design-highlights-top-margin - design-text-leading)#emph[Cancer cell 42 \(3\), 444-463. e10, 2024]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Complex analysis of single-cell RNA sequencing data]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Anna A Khozyainova, Anna A Valyaeva, Mikhail S Arbatsky, #strong[#emph[Sergey V Isaev]], et al.

#v(design-highlights-top-margin - design-text-leading)#emph[Biochemistry \(Moscow\) 88 \(2\), 231-252, 2023]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Thymic mesenchymal niche cells drive T cell immune regeneration]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Karin Gustafsson, #strong[#emph[Sergey Isaev]], Kameron A Kooshesh, et al.

#v(design-highlights-top-margin - design-text-leading)#emph[bioRxiv, 2022.10. 12.511184, 2022]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Follicular lymphoma microenvironment characteristics associated with tumor cell mutations and MHC class II expression]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Guangchun Han, Qing Deng, Mario L Marques-Piubelli, ..., #strong[#emph[Sergey Isaev]], et al.

#v(design-highlights-top-margin - design-text-leading)#emph[Blood cancer discovery 3 \(5\), 428-443, 2022]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Multiregional single-cell proteogenomic analysis of ccRCC reveals cytokine drivers of intratumor spatial heterogeneity]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Natalia Miheecheva, Ekaterina Postovalova, Yang Lyu, ..., #strong[#emph[Sergey Isaev]], et al.

#v(design-highlights-top-margin - design-text-leading)#emph[Cell Reports 40 \(7\), 2022]])

#v(design-entries-vertical-space-between-entries)
#one-col-entry(content:[
  #strong[Dicyemida and Orthonectida: two stories of body plan simplification]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Oleg A Zverkov, Kirill V Mikhailov, #strong[#emph[Sergey V Isaev]], et al.

#v(design-highlights-top-margin - design-text-leading)#emph[Frontiers in Genetics 10, 443, 2019]])



== Conferences

#two-col-entry(
  left-content: [
    #strong[Oral presentation \"Clonal embeddings\"]

#emph[19th YSA PhD Symposium 2024]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[May 2024]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Oral presentation \"How to deal with single-cell multi-omics? Comparison of single-cell multimodal data vertical integration methods\"]

#emph[Computational biology and artificial intelligence for personalized medicine-2022]
  ],
  right-content: [
    #emph[Moscow, Russia \(remote\)]

#emph[Aug 2022]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Poster \"Metagenomic study of eukaryotic microbiota of meromictic lakes on the coast of Kandalaksha Bay of the White Sea\"]

#emph[VII International conference \"Marine Research and Education\"]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Nov 2019]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Poster \"Circular DNA in #emph[Dicyema sp.] genome\"]

#emph[Information Technologies and Systems 2018]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Sept 2018]
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Teaching Experience

#two-col-entry(
  left-content: [
    #link("https://github.com/serjisa/transcriptomics.msu")[#strong[Transcriptomics Data Analysis]]

#emph[Moscow State University]
  ],
  right-content: [
    #emph[Moscow, Russia \(remote\)]

#emph[Sept 2022 – present]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Development and teaching of both theoretical and practical parts of the course at the Faculty of Bioengineering and Bioinformatics])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[NGS data analysis #emph[\(RNA-Seq part\)]]

#emph[Higher School of Economics]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[2021 – 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Teaching of RNA-Seq analysis part of the course for bachelor's and master's students])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Single cell profiling and analysis in neuroscience]

#emph[Bordeaux School of Neuroscience]
  ],
  right-content: [
    #emph[Bordeaux, France]

#emph[June 2022]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Assisting on practical workshops dedicated to scRNA-Seq analysis in neuroscience])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Introduction to NGS analysis #emph[\(RNA-Seq part\)]]

#emph[Moscow Institute of Physics and Technology]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[2020]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Development and teaching of RNA-Seq analysis part of the BostonGene's course for bachelor's students])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Introduction to Bioinformatics]

#emph[Letovo]
  ],
  right-content: [
    #emph[Moscow, Russia]

#emph[Sept 2018 – May 2021]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Development and teaching of the introductory course for high school students])], column-gutter: 0cm)
  ],
)



== Skills

#one-col-entry(
  content: [#strong[Programming:] proficient with Python; comfortable with R, bash, PyTorch, and Nextflow; familiar with C++, Docker, Git, nginx, and a basic server management]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Mathematics and computer science:] good understanding of probability theory, statistics, and linear algebra, and their applications to data analysis]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(fluent\), Russian \(native\)]
)


== Extracurricular Activities

#one-col-entry(
  content: [- In 2017–2020 I co-organized department's #strong[cinema club] where we watched and discussed modern arthouse movies],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- As much as I can I'm trying to participate in #strong[popular science events] as a speaker \(#link("https://www.youtube.com/watch?v=u0ZtPvwEcTM")[example]\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- I'm an active member of the #strong[#link("http://fbb-alumni.ru")[FBB Alumni Club]]],
)



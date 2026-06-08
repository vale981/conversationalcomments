;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "conversationalcomments"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ltxdoc" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("conversationalcomments" "") ("hypdoc" "") ("expl3" "") ("xcolor" "") ("geometry" "") ("marginnote" "") ("tikz" "") ("zref-savepos" "") ("zref-abspage" "") ("zref-user" "") ("datetime2" "calc" "showseconds=false") ("xparse" "")))
   (TeX-run-style-hooks
    "latex2e"
    "ltxdoc"
    "ltxdoc10"
    "xcolor"
    "hypdoc"
    "expl3"
    "geometry"
    "marginnote"
    "tikz"
    "zref-savepos"
    "zref-abspage"
    "zref-user"
    "datetime2"
    "xparse")
   (TeX-add-symbols
    '("printconversations" ["Text"])
    '("conversation+")
    '("conversation*")
    '("conversation")
    '("commreportentry" "Text" "Text" "Text" "Text" "Text" "Text" "Text" "Text")
    '("newcommentator" "Text" "Text" "Text" ["Text"])
    '("commreply" "Text" "Text")
    '("commrecord" "Text" "Text" "Text" "Text")
    '("setcommenttimestamp" "Text" "Text")
    '("setreviewmarginwidth" "Text")
    '("hyperlink" 2)
    '("hypertarget" 2)
    '("pgfsyspdfmark" 3)
    "__comm_set_review_margin_width:n"
    "__comm_parse_tz_hour:w"
    "__comm_parse_tz_hour_tz:w"
    "__comm_parse_tz_hh_hour:w"
    "__comm_parse_tz_minute:w"
    "__comm_parse_tz_minute_tz:w"
    "__comm_parse_tz_mm_minute:w"
    "__comm_format_tz:nn"
    "__comm_current_iso_timestamp:"
    "__comm_format_datetime:"
    "__comm_pad_two:n"
    "__comm_render_local_datetime:n"
    "__comm_parse_and_store_timestamp:nn"
    "__comm_record:nnnn"
    "__comm_solve_elasticity:"
    "__comm_draw_box:nnn"
    "__comm_render_note:n"
    "__comm_process:nn"
    "__comm_register_commentator:nnnn"
    "__comm_format_reply:nnnn"
    "__comm_add_report_entry:nnnnnnnn"
    "__comm_render_report_entry:nnnnnnnnn"
    "__comm_write_timestamp:nn"
    "__comm_write_timestamps_file:")
   (LaTeX-add-lengths
    "reviewmarginwidth")
   (LaTeX-add-xcolor-definecolors
    "pastelblue"
    "pastelred"
    "pastelgreen"))
 :latex)


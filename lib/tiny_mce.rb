module TinyMce
  DEFAULT_TINY_MCE_CONFIGURATION = {
    :mode => "textareas",
    :theme => "advanced",
    :plugins => %w(style layer table save advhr advimage advlink emotions iespell insertdatetime preview media
                   searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking
                   xhtmlxtras),
    :languages => 'en',
    :disk_cache => true,
    :debug => false,
    :buttons => [%w(save newdocument | bold italic underline strikethrough | justifyleft justifycenter justifyright
                     justifyfull | styleselect formatselect fontselect fontsizeselect),
                 %w(cut copy paste pastetext pasteword | search replace | bullist numlist | outdent indent blockquote |
                     undo redo | link unlink anchor image cleanup help code | insertdate inserttime preview | forecolor
                     backcolor),
                 %w(tablecontrols | hr removeformat visualaid | sub sup | charmap emotions iespell media advhr | print
                     | ltr rtl | fullscreen),
                 %w(insertlayer moveforward movebackward absolute | styleprops | cite abbr acronym del ins attribs |
                    visualchars nonbreaking template pagebreak)],
    :theme_advanced_toolbar_location => 'top',
    :theme_advanced_toolbar_align => 'left',
    :theme_advanced_statusbar_location => 'bottom',
    :theme_advanced_resizing => true,
  }

  def self.configuration(&block)
    @configuration ||= HashWithIndifferentAccess.new(DEFAULT_TINY_MCE_CONFIGURATION)
    yield @configuration if block_given?
    @configuration
  end
end

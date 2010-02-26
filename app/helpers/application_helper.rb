module ApplicationHelper
  def tiny_mce(options = {})
    r = (@tiny_mce_included ? '' : javascript_include_tag("tiny_mce/tiny_mce")) + "\n" +
            #javascript_tag("tinyMCE_GZ.init(#{gz.to_json})") + "\n" + # compressor for performance
            javascript_tag(tiny_mce_init(options))
    @tiny_mce_included ||= true
    r
  end

  def tiny_mce_init(options = {})
    config = TinyMce.configuration.merge(options)
#    gz = {
#      :themes => config[:theme],
#      :languages => config[:languages],
#      :disk_cache => true,
#      :debug => false,
#      :plugins => config[:plugins].join(',')
#    }

    mce = config.dup
    mce[:plugins] = mce[:plugins].join(',') if mce[:plugins].kind_of?(Array)
    buttons = mce.delete(:buttons)
    buttons.length.times do |i|
      mce["theme_advanced_buttons#{i+1}"] = buttons[i].join(',') unless mce["theme_advanced_buttons#{i+1}"]
    end if buttons

    "tinyMCE.init(#{mce.to_json});"
  end
end

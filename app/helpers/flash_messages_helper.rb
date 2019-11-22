module FlashMessagesHelper

  def flash_messages(options={})
    flash_names = [:success, :warning, :error, :information, :tip]
    html = ''
    flash_names.each do |flash_type|
      html += flash_message_for( flash[flash_type], options ) if flash[flash_type]
    end
    raw html
  end

  def flash_message_for(message, options={})
    
    options = {
      :type      => :tip,
      :closeable => true,
      :timeout   => 4000
    }.merge( options );
    
    id = 'flash_' + rand(Time.now.to_i).to_s
    
    html  = "<div id='#{ id }' style='transition: opacity 0.6s ease-out' class='message #{ options[:closeable] ? 'closeable' : '' } #{ options[:type].to_s }'>"
    html += "<p>#{ message }</p>"
    html += "<div class='close'>x</div>" if options[:closeable]
    html += "</div>"
    
    if options[:closeable]
      html += "<script type='text/javascript'>"
      html += "setTimeout( function(){ document.getElementById('#{id}').style.opacity = 0; }, #{ options[:timeout] } )"
      html += "</script>"
    end

    raw html
  end
end
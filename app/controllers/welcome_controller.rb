class WelcomeController < ApplicationController
  include AdminSettings
  def index
    render component: 'pages/welcome/Welcome', props: {
      albums: Album.visible.limit(4).order(:priority),
      contacts: Contact.of_all(%w[instagram phone email]),
      main_text: Text.find_by(key: 'Main about'),
      slides: Album.slides,
      logo: Logo.load,
      user: current_user
    }
  end
end

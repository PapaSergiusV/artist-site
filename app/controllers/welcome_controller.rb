class WelcomeController < ApplicationController
  def index
    render component: 'pages/welcome/Welcome', props: {
      albums: Album.limit(4).order(:priority),
      contacts: Contact.of_all(%w[instagram phone email]),
      main_text: Text.find_by(key: 'Main about'),
      slides: Album.slides,
      user: current_user
    }
  end
end

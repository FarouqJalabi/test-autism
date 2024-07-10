class HomesController < ApplicationController
  def index
    @blog_posts = BlogPost.all.sort_by(&:updated_at).reverse
    @languages = {
      "flags/us.svg": "You can take autism test in english",
      "flags/es.svg": "Puedes tomar el test de autismo en español",
      "flags/fr.svg": "Vous pouvez passer le test de l'autisme en français",
      "flags/no.svg": "Du kan ta autisme test på norsk",
      "flags/tt.svg": "Du kan ta autisme test på norsk",
      "flags/tv.svg": "Du kan ta autisme test på norsk",
      "flags/tw.svg": "Du kan ta autisme test på norsk",
      "flags/tz.svg": "Du kan ta autisme test på norsk",
      "flags/ua.svg": "Du kan ta autisme test på norsk",
      "flags/ug.svg": "Du kan ta autisme test på norsk",
      "flags/uk.svg": "Du kan ta autisme test på norsk",
      "flags/um.svg": "Du kan ta autisme test på norsk",
      "flags/un.svg": "Du kan ta autisme test på norsk",
      "flags/sn.svg": "Du kan ta autisme test på norsk",
      "flags/sm.svg": "Du kan ta autisme test på norsk",
      "flags/so.svg": "Du kan ta autisme test på norsk",
      "flags/sr.svg": "Du kan ta autisme test på norsk",
      "flags/ss.svg": "Du kan ta autisme test på norsk",
    }
  end
end

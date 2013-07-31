class ProcController < ApplicationController


  def sample
    @sample = Sampleslide.all.first
  end


  def refresh

    if File.exists?( "public/impress/impress.js" )
      system("rm -rf public/impress/impress.js")
      unless system('git clone https://github.com/bartaz/impress.js.git public/impress/impress.js ')
        hoge2
      end
    end
    render 'sample'

  end

  def load_mark_down
    s = Sampleslide.all.first.content
    render json: {hoge: s}
  end

  def refresh_slide

    mark = Sampleslide.all.first
    mark.content = params[:text]
    mark.save

    system('rm public/markdown/README.md')
    foo = File.open("public/markdown/README.md",'w')
    foo.puts mark.content
    foo.close

    system(' mkdir public/markdown/real')
    if system('markdown2impress.pl public/markdown/README.md --outputdir=public/markdown/real')
      result = "ok"
    else
      result = "ng"
    end

    render json: {status: result }
  end
end

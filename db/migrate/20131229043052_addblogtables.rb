class Addblogtables < ActiveRecord::Migration
  def change
    execute('CREATE TABLE blog_rolls
      (
        id serial NOT NULL,
        title text NOT NULL,
        author text NOT NULL,
        blog_uri text NOT NULL,
        feed_uri text NOT NULL,
        feed_type text NOT NULL,
        active_flag boolean NOT NULL DEFAULT true,
        CONSTRAINT blogroll_pkey PRIMARY KEY (id)
      );')
      
      execute('CREATE TABLE blog_entries
      (
        id serial NOT NULL,
        blog_roll_id integer NOT NULL,
        title text NOT NULL,
        entry_uri text NOT NULL,
        posted_date date NOT NULL,
        CONSTRAINT blogentries_pkey PRIMARY KEY (id),
        CONSTRAINT unique_entry_uri UNIQUE (entry_uri),
        FOREIGN KEY (blog_roll_id) REFERENCES public.blog_rolls(id)        
      );')
  end
end

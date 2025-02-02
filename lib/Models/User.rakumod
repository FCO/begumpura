use v6.d;
use Red:api<2>;
use Models::Post;

model User is export is table<users> {
  also is rw;

  has Int $.id    is serial;
  has Str $.name  is column;
  has     @.posts is relationship( *.author-id, :model<Post> );

  method active-posts { @!posts.grep: not *.deleted }

}


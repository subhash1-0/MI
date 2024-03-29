<?php echo $header; ?>
<div class="container">
<?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
<?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>

<div class="row"><?php if( $SPAN[0] ): ?>
<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
    <?php echo $column_left; ?>
</aside>
<?php endif; ?>

<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">

<div id="content">
    <?php echo $content_top; ?>
    <section id="blog-info" class="pav-blog wrapper clearfix clearfix blog-wrapper clearfix clearfix">
        <?php if( $blog['thumb_large'] ) { ?>
        <figure class="image">
            <img src="<?php echo $blog['thumb_large'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
        </figure>
        <?php } ?>

        <header><h1 class="blog-title"><?php echo $heading_title; ?></h1></header>

        <section class="content">
            <section class="blog-meta">
                <?php if( $config->get('blog_show_author') ) { ?>
						<span class="author">
							<span><i class="fa fa-pencil"></i><?php echo $objlang->get("text_write_by");?></span>
							<span class="t-color"><?php echo $blog['author'];?></span>
						</span>
                <?php } ?>
                <?php if( $config->get('blog_show_category') ) { ?>
						<span class="publishin">
							<span><i class="fa fa-thumb-tack"></i><?php echo $objlang->get("text_published_in");?></span>
							<a href="<?php echo $blog['category_link'];?>" class="t-color" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
						</span>
                <?php } ?>
                <?php if( $config->get('blog_show_created') ) { ?>
                <span class="created"><span><i class="fa fa-calendar"></i><?php echo $objlang->get("text_created_date");?> <?php echo $blog['created'];?></span></span>
                <?php } ?>
                <?php if( $config->get('blog_show_hits') ) { ?>
						<span class="hits">
							<span><i class="fa fa-insert-template"></i><?php echo $objlang->get("text_hits");?></span>
							<span class="t-color"><?php echo $blog['hits'];?></span>
						</span>
                <?php } ?>
                <?php if( $config->get('blog_show_comment_counter') ) { ?>
						<span class="comment_count">
							<span><i class="fa fa-comment"></i><?php echo $objlang->get("text_comment_count");?></span>
							<span class="t-color"><?php echo $blog['comment_count'];?></span>
						</span>
                <?php } ?>
            </section>

            <section class="description"><?php echo $description;?></section>

            <section class="blog-content">
                <div class="content-wrap clearfix">
                    <?php echo $content;?>
                </div>
                <?php if( $blog['video_code'] ) { ?>
                <div class="pav-video clearfix"><?php echo html_entity_decode($blog['video_code'], ENT_QUOTES, 'UTF-8');?></div>
                <?php } ?>
            </section>
        </section>

        <footer>
            <?php if( !empty($tags) ) { ?>
            <section class="blog-tags">
                <i class="fa fa-tags"></i>
                <?php echo $objlang->get('text_tags');?>
                <?php foreach( $tags as $tag => $tagLink ) { ?>
                <a href="<?php echo $tagLink; ?>" title="<?php echo $tag; ?>"><?php echo $tag; ?></a>
                <?php } ?>
            </section>
            <?php } ?>

            <section class="blog-social clearfix">
                <div class="social-wrap">
                    <div class="social-heading"><b><?php echo $objlang->get('text_like_this');?></b></div>
                    <!-- Twitter Button -->
                    <div class="itemTwitterButton">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-count="horizontal"><?php echo $objlang->get('text_twitter_share'); ?></a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                    </div>
                    <!-- Facebook Button -->
                    <div class="itemFacebookButton">
                        <div id="fb-root"></div>
                        <script type="text/javascript">
                            (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) {return;}
                                    js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/en_US/all.js#appId=177111755694317&xfbml=1";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));
                        </script>
                        <div class="fb-like" data-send="false" data-width="200" data-show-faces="true"></div>
                    </div>
                    <!-- Google +1 Button -->
                    <div class="itemGooglePlusOneButton">
                        <g:plusone annotation="inline" width="120"></g:plusone>
                        <script type="text/javascript">
                            (function() {
                                window.___gcfg = {lang: 'en'}; // Define button default language here
                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                po.src = 'https://apis.google.com/js/plusone.js';
                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                            })();
                        </script>
                    </div>
                </div>
            </section>
            <section class="blog-bottom row">
                <?php if( !empty($samecategory) ) { ?>
                <div class="col-lg-6 col-sm-6 col-xs-12">
                    <h4><?php echo $objlang->get('text_in_same_category');?></h4>
                    <ul class="sample-blog-category">
                        <?php foreach( $samecategory as $item ) { ?>
                        <li><a href="<?php echo $objurl->link('pavblog/blog',"id=".$item['blog_id']);?>"><?php echo $item['title'];?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
                <?php if( !empty($related) ) { ?>
                <div class="col-lg-6 col-sm-6 col-xs-12">
                    <h4><?php echo $objlang->get('text_in_related_by_tag');?></h4>
                    <ul class="sample-blog-category">
                        <?php foreach( $related as $item ) { ?>
                        <li><a href="<?php echo $objurl->link('pavblog/blog',"id=".$item['blog_id']);?>"><?php echo $item['title'];?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
            </section>

            <div class="pav-comment">
                <?php if( $config->get('blog_show_comment_form') ) { ?>
                <?php if( $config->get('comment_engine') == 'diquis' ) { ?>
                <div id="disqus_thread"></div>
                <script type="text/javascript">
                    //CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE
                    var disqus_shortname = '<?php echo $config->get('diquis_account');?>'; // required: replace example with your forum shortname

                    //DON'T EDIT BELOW THIS LINE
                    (function() {
                        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                    })();
                </script>
                <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

                <?php } elseif( $config->get('comment_engine') == 'facebook' ) { ?>
                <div id="fb-root"></div>
                <script>(function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) {return;}
                            js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=<?php echo $config->get("facebook_appid");?>";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                <div class="fb-comments" data-href="<?php echo $link; ?>"
                     data-num-posts="<?php echo $config->get("comment_limit");?>" data-width="<?php echo $config->get("facebook_width")?>">
            </div>
            <?php }else { ?>
            <?php if( count($comments) ) { ?>
            <h4><?php echo $objlang->get('text_list_comments'); ?></h4>
            <div class="pave-listcomments media-list clearfix">
                <?php foreach( $comments as $comment ) {  $default='';?>
                <div class="comment-item media" id="comment<?php echo $comment['comment_id'];?>">
                    <img class="pull-left" src="<?php echo "http://www.gravatar.com/avatar/" . md5( strtolower( trim( $comment['email'] ) ) ) . "?d=" . urlencode( $default ) . "&s=60" ?>" align="left"/>
                    <div class="comment-wrap media-body">
                        <div class="comment-meta">
                            <span class="comment-created"><b><?php echo $objlang->get('text_created');?></b><?php echo $comment['created'];?></span>
                            <span class="comment-postedby"><b><?php echo $objlang->get('text_postedby');?>:</b><?php echo $comment['user'];?></span>
                            <span class="comment-link"><a href="<?php echo $link;?>#comment<?php echo $comment['comment_id'];?>"><?php echo $objlang->get('text_comment_link');?></a></span>
                        </div>
                        <p><?php echo $comment['comment'];?></p>
                    </div>
                </div>
                <?php } ?>
                <div class="pagination clearfix">
                    <?php echo $pagination;?>
                </div>
            </div>
            <?php } ?>
            <h4><?php echo $objlang->get("text_leave_a_comment");?></h4>
            <form action="<?php echo $comment_action;?>" method="post" id="comment-form" class="form-horizontal">
                <fieldset>

                    <div class="message" style="display:none"></div>
                    <div class="form-group required">
                        <label class=" control-label" for="comment-user"><?php echo $objlang->get('entry_name');?></label>
                        <div class="">
                            <input class="form-control" type="text" name="comment[user]" value="" id="comment-user"/>
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class=" control-label" for="comment-email"><?php echo $objlang->get('entry_email');?></label>
                        <div class="">
                            <input class="form-control" type="text" name="comment[email]" value="" id="comment-email"/>
                        </div>
                    </div>

                    <div class="form-group required">
                        <label class=" control-label" for="comment-comment"><?php echo $objlang->get('entry_comment');?></label>
                        <div class="">
                            <textarea class="form-control" name="comment[comment]"  id="comment-comment"></textarea>
                        </div>
                    </div>

                    <?php if( $config->get('enable_recaptcha') ) { ?>
                    <div class="recaptcha">
                        <label class="control-label"><?php echo $entry_captcha; ?></label>
                        <p><img src="index.php?route=tool/captcha" alt="" aligh="left"/></p>
                        <input class="form-control" type="text" name="captcha" value="<?php echo $captcha; ?>" size="10" />
                    </div>
                    <?php } ?>



                    <input type="hidden" name="comment[blog_id]" value="<?php echo $blog['blog_id']; ?>" />
                    <br/>
                    <div class="buttons-wrap">
                        <button class="btn btn-outline" type="submit">
                            <span><?php echo $objlang->get('text_submit');?></span>
                        </button>
                    </div>
                </fieldset>
            </form>
            <script type="text/javascript">
                $( "#comment-form .message" ).hide();
                $("#comment-form").submit( function(){
                    $.ajax( {type: "POST",url:$("#comment-form").attr("action"),data:$("#comment-form").serialize(), dataType: "json",}).done( function( data ){
                        if( data.hasError ){
                            $( "#comment-form .message" ).html( data.message ).show();
                        }else {
                            location.href='<?php echo str_replace("&amp;","&",$link);?>';
                        }
                    } );
                    return false;
                } );

            </script>
            <?php } ?>
            <?php } ?>
</div>

</footer>
</section>
<?php echo $content_bottom; ?>
</div>

		<!-- End Div Content -->
		<?php echo $content_bottom; ?></div>
</section>
<?php if( $SPAN[2] ): ?>
<aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">
    <?php echo $column_right; ?>
</aside>
<?php endif; ?></div>
</div>
<?php echo $footer; ?>
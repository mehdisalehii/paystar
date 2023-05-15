Skip to content
Search or jump to…
Pull requests
Issues
Codespaces
Marketplace
Explore

@mehdisalehii
mehdisalehii
/
flexor-shabahangrent-
Private
Cannot fork because you own this repository and are not a member of any organizations.
Code
Issues
Pull requests
Actions
Projects
Security
Insights
Settings
Beta Try the new code view
flexor-shabahangrent-/category.php /
@mehdisalehii
mehdisalehii first commit and completed wp theme
Latest commit 9b70038 last month
History
1 contributor
176 lines (163 sloc)  8.7 KB

<?php get_header(); ?>

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <?php
            if (function_exists('yoast_breadcrumb')) {
                yoast_breadcrumb('<ol class="breadcrumb"><li class="breadcrumb-item">', '</li></ol>');
            }
            ?>
        </div>
    </section>
    <!-- End Breadcrumbs -->
    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
        <div class="container justify-content-sm-center flex-wrap flex-sm-nowrap  text-sm-right text-center" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-8 entries">
                    <article class="entry entry-single">
                        <h1 class="entry-title">
                            <?php
                            $cat = get_the_category();
                            echo 'دسته بندی: ' . $cat[0]->cat_name;
                            ?>
                        </h1>

                        <div class="entry-content">
                            <?php if (have_posts()):
                            while (have_posts()) : the_post(); ?>
                            <article class="entry d-flex justify-content-start align-items-center">
                                <div class="w-25 m-3">
                                        <?php if (has_post_thumbnail()) {
                                        $image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID, array(300, 300)));
                                        ?>
                                    <img src="<?php echo $image[0]; ?>" alt="<?php the_title(); ?>"
                                         class="img-fluid" width="100%" height="100%">
                                    <?php } else { ?>
                                    <span class="no-photo">
                                                    <i class="far fa-image"></i>
                                                    بدون تصویر
                                                </span>
                                    <?php } ?>
                                </div>
                                <div class="w-75">
                                    <h2 class="entry-title">
                                        <a href="<?php the_permalink() ?>"><?php the_title(); ?></a>
                                    </h2>
                                    <div class="entry-meta">
                                        <ul>
                                            <li class="d-flex align-items-center"><i class="bi bi-clock"></i>
                                                <time datetime="<?php echo get_the_date(); ?>"><?php echo get_the_date(); ?></time>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="entry-content">
                                        <p>
                                                <?php wpe_excerpt('wpe_excerptlength_index', 'wpe_excerptmore'); ?>
                                        </p>
                                        <div class="read-more">
                                            <a href="<?php the_permalink() ?>">بیشتر بدانید</a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                            <?php endwhile; endif; ?>
                        </div>

                    </article>
                    <!-- End blog entry -->

                    <!--                    to include comments in this line comment-->

                    <!-- End blog comments -->

                </div>
                <!-- End blog entries list -->
                <div class="col-lg-4">
                    <a class="aside-link" href="/shop">
                        <div class="right">
                            <img width="60px" height="60px"
                                 src="<?php echo get_template_directory_uri(); ?>/assets/img/blog/car-icon.png">
                        </div>
                        <div class="left">
                            <h4>خودرو های اجاره</h4>
                            <span>مشاهده خودرو های اجاره ای</span>
                        </div>
                    </a>
                    <a class="aside-link" href="#contact">
                        <div class="right">
                            <img width="60px" height="60px"
                                 src="<?php echo get_template_directory_uri(); ?>/assets/img/blog/contact-us.png">
                        </div>
                        <div class="left">
                            <h4>مشاوره و رزو خودرو</h4>
                            <span>مشاوره با کارشناسان و رزرو خودرو</span>
                        </div>
                    </a>
                    <div class="sidebar">
                        <h3 class="sidebar-title">جست و جو</h3>
                        <div class="sidebar-item search-form">
                            <form action="">
                                <input placeholder="جست و جو کنید ..." type="text" action="<?php bloginfo('home'); ?>"
                                       method="get">
                                <button type="submit"><i class="bi bi-search"></i></button>
                            </form>
                        </div>
                        <!-- End sidebar search formn-->

                        <h3 class="sidebar-title">دسته بندی ها</h3>
                        <div class="sidebar-item categories">
                            <ul>
                                <?php
                                //$cat=get_categories();
                                $cats = get_categories_aside();
                                print_r($cats);
                                ?>
                            </ul>
                        </div>
                        <!-- End sidebar categories-->

                        <h3 class="sidebar-title">آخرین نوشته ها</h3>
                        <div class="sidebar-item recent-posts">
                            <?php
                            $show_posts = 4;
                            $latest_news = 4;
                            query_posts('&showposts=' . $show_posts);
                            while (have_posts()) :
                                the_post(); ?>

                            <div class="post-item clearfix">
                                    <?php if (!has_post_thumbnail()) {
                                    ?>
                                <span class="no-photo">
                               <i class="bi-image"></i>
                                            بدون تصویر
                            </span>
                                    <?php
                                } else {
                                    the_post_thumbnail();
                                }
                                    ?>
                                <h4><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h4>
                                <time datetime="<?php echo get_the_date(); ?>"><?php echo get_the_date(); ?></time>
                            </div>
                            <?php
                            endwhile;
                            wp_reset_query();
                            ?>

                        </div>
                        <!-- End sidebar recent posts-->

                        <h3 class="sidebar-title">برچسب ها</h3>
                        <div class="sidebar-item tags">
                            <ul>
                                <?php
                                get_tags_aside();
                                ?>
                            </ul>
                        </div>
                        <!-- End sidebar tags-->
                    </div>
                    <!-- End sidebar -->
                </div>
                <!-- End blog sidebar -->
            </div>
        </div>
    </section>
    <!-- End Blog Single Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<?php get_footer(); ?>
Footer
© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
flexor-shabahangrent-/category.php at main · mehdisalehii/flexor-shabahangrent-

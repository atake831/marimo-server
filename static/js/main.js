if (typeof(window.console) == "undefined") { console = {}; console.log = console.warn = console.error = function(a) {}; }

$(function () {
    $("#tag-input").tagit({
        tagLimit: 10, 
        fieldName: "tags",
        allowSpaces: true, 
    });

    $(".submit").click(function () {
        this.disabled = true;
        $(".form").submit();
    });

    $(".kininaru").click(function () {
        $('#message').html("");
        var button = $(this).children("button");
        var csrf_token = $(this).find('input[name=csrf_token]').val();
        var short_recipe_id = $(this).find('input.short_recipe_id').val();
        if ( $(button).hasClass('clicked') ) {
            // 気になる解除
            $.post('/short_recipe/kininaru/decrement',
                {csrf_token: csrf_token, short_recipe_id:short_recipe_id}, 
                function ( json, status, xhr ) {
                    if ( status == 'success' && json.status == 'success' ) {
                        $(button).removeClass('clicked');
                        $(button).addClass('not_clicked');
                        $('p#' + json.id).html(json.point);
                    } else if ( json.status == 'ignore' ) {
                        $(button).removeClass('clicked');
                        $(button).addClass('not_clicked');
                    } else {
                        $('#message').html("エラーが発生しました。気になる！出来ませんでした。");
                    }
                }
            );
        } else {
            // 気になる
            $.post('/short_recipe/kininaru/increment',
                {csrf_token: csrf_token, short_recipe_id:short_recipe_id}, 
                function ( json, status, xhr ) {
                    if ( status == 'success' && json.status == 'success' ) {
                        $(button).removeClass('not_clicked');
                        $(button).addClass('clicked');
                        $('p#' + json.id).html(json.point);
                    } else if ( json.status == 'over' ) {
                        $('#message').html("気になる！は1人100件までです。");
                    } else if ( json.status == 'ignore' ) {
                        $(button).removeClass('not_clicked');
                        $(button).addClass('clicked');
                    } else {
                        $('#message').html("エラーが発生しました。気になる！出来ませんでした。");
                    }
                }
            );
        }
    });

    $("#rakuuma").click(function () {
        $('#message').html("");
        var csrf_token = $('input[name="csrf_token"]').val();
        var recipe_id = $('input[name="recipe_id"]').val();
        if ( $("#rakuuma").hasClass('clicked') ) {
            // らくうま解除
            $.post('/recipe/rakuuma/decrement',{csrf_token: csrf_token, recipe_id:recipe_id}, 
                function ( json, status, xhr ) {
                    if ( status == 'success' && json.status == 'success' ) {
                        $("#rakuuma").removeClass('clicked');
                        $("#rakuuma").addClass('not_clicked');
                        $('p').html(json.point);
                    } else if ( json.status == 'ignore' ) {
                        $("#rakuuma").removeClass('clicked');
                        $("#rakuuma").addClass('not_clicked');
                    } else {
                        $('#message').html("エラーが発生しました。気になる！出来ませんでした。");
                    }
                }
            );
        } else {
            // らくうま
            $.post('/recipe/rakuuma/increment',{csrf_token: csrf_token, recipe_id:recipe_id}, 
                function ( json, status, xhr ) {
                    if ( status == 'success' && json.status == 'success' ) {
                        $("#rakuuma").removeClass('not_clicked');
                        $("#rakuuma").addClass('clicked');
                        $('p').html(json.point);
                    } else if ( json.status == 'ignore' ) {
                        $("#rakuuma").removeClass('not_clicked');
                        $("#rakuuma").addClass('clicked');
                    } else {
                        $('#message').html("エラーが発生しました。気になる！出来ませんでした。");
                    }
                }
            );
        }
    });

});

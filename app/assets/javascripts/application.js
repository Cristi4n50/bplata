// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery/jquery.tablesorter.min
//= require twitter/bootstrap
//= require jquery.pnotify.min
//= require jquery.tablesorter.pager
//= require jquery-ui-1.10.4.custom.min

// Drop-down menu
$(document).ready(function () {

    /*

     $("body").bind("click", function (e) {
     $('.dropdown-toggle, .menu').parent("li").removeClass("open");
     });
     $(".dropdown-toggle, .menu").click(function (e) {
     var $li = $(this).parent("li").toggleClass('open');
     return false;
     });



     $('a').each(function () {
     $(this).twipsy({
     delayOut: 0,
     position: $(this).attr('twipsy-position') || 'above'
     });
     });


     $('input').each(function () {
     $(this).twipsy({
     delayOut: 0,
     position: $(this).attr('twipsy-position') || 'above'
     });
     });

     */

	$('div.account:first a.signup:first').on('click', function() {
		$('div#signup-modal:first').foundation('reveal','open');
	});
	$('div.account:first a.login:first').on('click', function() {
		$('div#login-modal:first').foundation('reveal','open');
	});

    //$('.jstohide').show();
    if ($("#buy_price").length != 0) {
        showHideBuyPrice();
    }
    if ($("#sell_price").length != 0) {
        showHideSellPrice();
    }
    if ($("#orderstable").length != 0) {
        sort_orders();
    }
    if ($("#positionloans").length != 0) {
        update_positionloans(2);
    }
    if ($("#asks").length != 0) {
        update_asks();
    }
    if ($("#bids").length != 0) {
        update_bids();
    }
    if ($("#loans").length != 0) {
        update_loans(2);
    }
    if ($("#credits").length != 0) {
        update_credits();
    }
    if ($("#choice").length != 0) {
        toggleSelectClass('creditchoice', 'choice');
    }
    if ($("#account_overview").length != 0) {
        update_wallets();
    }
    if ($("#routingSet").length != 0) {
        toggleObjectDisplay('routingSet', 'RoutingToHide', 'routing');
    }
    if ($('#lendoffers').length != 0) {
        update_lendoffers();
    }
    if ($('#loanoffers').length != 0) {
        update_loanoffers();
    }
    if ($('#lastprices').length != 0) {
        setInterval("update_lastprices()", 30000);
    }
    if ($('#overview_balance').length != 0) {
        setInterval("update_balance_overview()", 240000);
    }
    if ($('#templatechoice').length != 0) {
        select_wire_template();
    }
    if ($('#adminorders').length != 0) {
        setInterval("update_adminorders()", 5000);
    }
    if ($('#lag_status').length != 0) {
        setInterval("update_lag_status()", 10000);
    }

	// Simple calculator for input values
	$('input#buy_price,input#amount,input#sell_price').bind('keydown', function(evt) {
		var e = $(this);
		var ev = e.val();
		if(evt.keyCode == 9 && !/^[\d\.]+$/.test(ev) && /^[0-9+\-()*/ .]+$/.test(ev)) {
			// If the input field value is a calculation, eval() the value and replace with the result
			var result;
			try {
				var val = eval(ev);
				e.val((Math.round(val * 100000) / 100000)).focus().select();
			} catch(ex) {
				// Flash text red temporarily on error
				e.css('color', 'red').focus();
				var i = setInterval(function() {
					e.css('color', 'black');
					clearInterval(i);
				}, 500);
			}
			evt.preventDefault();
			evt.stopPropagation();
			return false;
		}
		return true;
	});

	// Setup initial values to enable population of order details by clickong on wallet balances 
	$('input#buy_price,input#sell_price').bind('focus', function(evt) {
		lastFocussedInput = $(this); // Global
	});
	lastFocussedInput = $('input#buy_price');
	$('input#amount').focus();

	// Enable clicking on wallet overview balances to populate order
	var pane = $('ul#sub-menu li a.active').text();
	if(pane == 'BTCUSD') {
		$('#overview_balance tr td.currency_BTC,#overview_balance tr td.currency_USD').addClass('injectable').data('inject_into', 'amount');
	} else if(pane == 'LTCBTC') {
		$('#overview_balance tr td.currency_LTC,#overview_balance tr td.currency_BTC').addClass('injectable').data('inject_into', 'amount');
	} else if(pane == 'LTCUSD') {
		$('#overview_balance tr td.currency_USD,#overview_balance tr td.currency_LTC').addClass('injectable').data('inject_into', 'amount');
	}

	// Enable clicking on ticker value above buy/sell buttons to populate order
	$('span#selling-btcusd').addClass('injectable').data('inject_into', 'buy_price');
	$('span#buying-btcusd').addClass('injectable').data('inject_into', 'sell_price');

	// Bind order population function to above marked elements
	$('.injectable').on('click', injectValue);

    // Enable cursor up/down to alter currency values in input fields, optionally with ctrl for faster changes
	$('input[type="text"]').keydown(function(e) {
		if(this.value.match(/^[\d\.]+$/)) {
			var val = Number(this.value);
			switch(e.which) {
				case 38: // up
					val += e.ctrlKey ? 10.0 : 1.0;
					this.value = val;
					e.preventDefault(); // prevent the default action (scroll / move caret)
					break;
				case 40: // down
					val -= e.ctrlKey ? 10.0 : 1.0;
					this.value = val;
					e.preventDefault(); // prevent the default action (scroll / move caret)
					break;
				default: return; // exit this handler for other keys
			}
		}
	});

    //autoLend();

    $(function () {
        $('form.order, form.new_order').bind("keypress", function (e) {
            if (e.keyCode == 13) return false;
        });
    });

});

Number.prototype.toMoney = function(decimals, thousands_sep, decimal_sep) { 
	// Format monetary values with thousand seperators
	var n = this,
	c = isNaN(decimals) ? 2 : Math.abs(decimals),
	d = decimal_sep || '.',
	t = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	sign = (n < 0) ? '-' : '',
	i = parseInt(n = Math.abs(n).toFixed(c)) + '', 
	j = ((j = i.length) > 3) ? j % 3 : 0; 
	return sign + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : ''); 
};

function injectValue(evt) {
		evt.preventDefault();
		evt.stopPropagation();
		var dsttxt = $(this).data('inject_into');
		var dst = $('input#' + dsttxt);
		var val;

		if($(this).find('span:hidden').length > 0) {
			var spanel = $(this).find('span:first');
			val = Number(spanel.text());
			if(spanel.attr('id').match(/USD/)) {
				if(lastFocussedInput)
					val = val / lastFocussedInput.val();
				else
					val = undefined;
			}
		} else {
			val = Number($(this).text().replace(/[^\\d.]/, ""));
		}
		if(val) {
			val = Math.round(val * 100000) / 100000;
			dst.val(val).focus().select();
		}
}

function autoLend(currency) {
    $.get("/credit/_autolend/" + currency, function (autolend) {
        $('div#autolend').html(autolend);
    });
}

function addOffer(offerid) {
    if (document.getElementById("check" + offerid).checked == true) {
        document.getElementById("lendrate_lend").value = Number(document.getElementById("rate" + offerid).value)
        document.getElementById("loanrate").value = Number(document.getElementById("rate" + offerid).value)
        document.getElementById("amount").value = Number(document.getElementById("amount").value) + Number(document.getElementById("amount" + offerid).value)
    } else {
        document.getElementById("amount").value = Number(document.getElementById("amount").value) - Number(document.getElementById("amount" + offerid).value)
    }
}

function checkAll(field, fieldname) {
    for (i = 0; i < field.length; i++)
        if (field[i].name == fieldname) {
            field[i].checked = true;
        }
};

//field[i].checked = true ;

function uncheckAll(field, fieldname) {

    for (i = 0; i < field.length; i++)
        if (field[i].name == fieldname) {
            field[i].checked = false;
        }
}

function fullBalance(amount, price, direction) {
    if (price == 0) {
        return amount
    }
    else {
        var typeoption = document.getElementById(direction + "_type").value
        var setprice = Number(document.getElementById(direction + "_price").innerHTML)
        if (setprice == 0 && direction == "sell") {
            if (typeoption == "EXCHANGE MARKET") {
                setprice = Number(document.getElementById("bid-btcusd").innerHTML)
            } else {
                setprice = Number(document.getElementById("sell_price").value)
            }
        } else if (setprice == 0 && direction == "buy") {
            if (typeoption == "EXCHANGE MARKET") {
                setprice = Number(document.getElementById("ask-btcusd").innerHTML)
            } else {
                setprice = Number(document.getElementById("buy_price").value)
            }
        }
        var givenamount = Math.floor(amount / setprice * 10000)
        return (givenamount / 10000)
    }
}

function sort_loans() {
    if ($("#loanstable").length != 0) {
        $("#loanstable").tablesorter({
            // pass the headers argument and assing a object
            headers: {
                4: {
                    // disable it by setting the property sorter to false
                    sorter: false
                }
            },
            sortList: [
                [2, 0]
            ]
        });
    }
}

function sort_orders() {
    if ($("#orderstable").length != 0) {
        $("#orderstable").tablesorter({
            // pass the headers argument and assing a object
            headers: {
                // assign the secound column (we start counting zero)
                0: {
                    // disable it by setting the property sorter to false
                    sorter: false
                },
                9: {
                    // disable it by setting the property sorter to false
                    sorter: false
                }
            },
            sortList: [
                [2, 5]
            ]
        });
    }
}

function sort_positions() {

    // Positions Table

    $("table#positions").tablesorter({sortList: [
        [3, 1]
    ]});
}

function sort_positionloans() {
    if ($("#positionloanstable").length != 0) {
        $("#positionloanstable").tablesorter({
            // pass the headers argument and assing a object
            headers: {
                5: {
                    // disable it by setting the property sorter to false
                    sorter: false
                }
            },
            sortList: [
                [3, 0]
            ]
        });
    }
}

function update_balance_overview() {
	if ($('#overview_balance').length != 0) {
		$.get("/account/balance_overview", function (over) {
			$('div#overview_balance').html(over);
		});
	}
}

function update_candles(period) {
    if (period == null) {
        period = document.getElementById("chartperiod").value;
        period = Number(period)
    }
    $.get("/trading/_charts/" + period, function (candles) {
        $('div#candles').html(candles);
        drawVisualization();
    });

}

function update_rates() {
    var elpair = document.getElementsByName("pair")[0]
    if (elpair != null) {
        pair = elpair.value
    } else {
        pair = "BTCUSD"
    }
    $.getJSON("/data/quotes/" + pair + ".json", function (data) {
        var new_buying = data['buying'].toString().trim();
        var new_selling = data['selling'].toString().trim();
        var old_buying = $('#buying-btcusd').text().substring(1).trim();
        var old_selling = $('#selling-btcusd').text().substring(1).trim();
        var last_trades = data['last'].toString().trim();
        if (new_buying > old_buying) {
            $('#buying-btcusd').html('&#9650;' + new_buying.substring(0, new_buying.length - 3) + '<span class="gray">' + new_buying.substring(new_buying.length - 3, new_buying.length - 1) + '<span class="superscript">' + new_buying.substring(new_buying.length - 1, new_buying.length) + '</span></span>');
            $('#bid-btcusd').html(new_buying);
        }
        if (new_buying < old_buying) {
            $('#buying-btcusd').html('&#9660;' + new_buying.substring(0, new_buying.length - 3) + '<span class="gray">' + new_buying.substring(new_buying.length - 3, new_buying.length - 1) + '<span class="superscript">' + new_buying.substring(new_buying.length - 1, new_buying.length) + '</span></span>');
            $('#bid-btcusd').html(new_buying);
        }
        if (new_selling > old_selling) {
            $('#selling-btcusd').html('&#9650;' + new_selling.substring(0, new_selling.length - 3) + '<span class="gray">' + new_selling.substring(new_selling.length - 3, new_selling.length - 1) + '<span class="superscript">' + new_selling.substring(new_selling.length - 1, new_selling.length) + '</span></span>');
            $('#ask-btcusd').html(new_selling);
        }
        if (new_selling < old_selling) {
            $('#selling-btcusd').html('&#9660;' + new_selling.substring(0, new_selling.length - 3) + '<span class="gray">' + new_selling.substring(new_selling.length - 3, new_selling.length - 1) + '<span class="superscript">' + new_selling.substring(new_selling.length - 1, new_selling.length) + '</span></span>');
            $('#ask-btcusd').html(new_selling);
        }
        if ($('input#buy_follow').length != 0) {
            if ($('input#buy_follow')[0].checked) {
                $('input#buy_price').val((parseFloat(new_selling) + 0.01).toString().substring(0, new_selling.length - 3));
            }
        }
        if ($('input#sell_follow').length != 0) {
            if ($('input#sell_follow')[0].checked) {
                $('input#sell_price').val((parseFloat(new_buying) - 0.01).toString().substring(0, new_buying.length - 3));
            }
        }
        if (document.title.indexOf('Bitfinex') == 0) {
            document.title = '(' + last_trades + ') ' + document.title;
        } else {
            document.title = document.title.replace(/\(.*\)/g, '(' + last_trades + ')');
        }
        curr_unit = pair.substr(3,3);
	    if(document.getElementById("buy_type").value.match(/.*MARKET/))
			updateOrderPriceEquiv('buy',curr_unit);

	    if(document.getElementById("sell_type").value.match(/.*MARKET/))
			updateOrderPriceEquiv('sell',curr_unit);
    });
}

function update_adminorders() {
    $.get("/power/active_orders", function (orders) {
        $('div#adminorders').html(orders);
    });

}

function update_orders() {
    $.get("/trading/_interior_orders", function (orders) {
        $('div#orders').html(orders);
        sort_orders();
    });

}

function update_lag_status() {
    $('.ajax-loader#lag_status').show();

    $.get("/power/lag_status", function (lag_status) {
        $('div#lag_status').html(lag_status);
        $('.ajax-loader#lag_status').hide();
    });

}

function update_offers() {
    $('.ajax-loader#offers').show();

    $.get("/credit/_offers", function (offers) {
        $('div#offers').html(offers);
        $('.ajax-loader#offers').hide();
    });

}

function update_credits() {
    $('.ajax-loader#credits').show();

    $.get("/credit/_credits", function (offers) {
        $('div#credits').html(offers);
        $('.ajax-loader#credits').hide();
    });

}

function update_loans(force) {
    force = force || 1
    var namelist = "";
    var list = 'loans[]';
    with (document.loans_form) {
        for (var i = 0; i < document.loans_form.length; i++) {
            if (document.loans_form[i].name == list) {
                if (document.loans_form[i].checked) {
                    namelist += document.loans_form[i].value + "\n";
                    break;
                }
            }
        }
    }
    if (namelist == '' || force == 1) {
        $('.ajax-loader#loans').show();

        $.get("/credit/_loans", function (loans) {
            $('div#loans').html(loans);
            $('.ajax-loader#loans').hide();
            sort_loans();
        });
    }
}

function update_positionloans(force) {
    force = force || 1
    var namelist = "";
    var list = 'loans[]';
    with (document.positionloans_form) {
        for (var i = 0; i < document.positionloans_form.length; i++) {
            if (document.positionloans_form[i].name == list) {
                if (document.positionloans_form[i].checked) {
                    namelist += document.positionloans_form[i].value + "\n";
                    break;
                }
            }
        }
    }
    if (namelist == '' || force == 1) {
        $('.ajax-loader#positionloans').show();

        $.get("/credit/_positionloans", function (positionloans) {
            $('div#positionloans').html(positionloans);
            $('.ajax-loader#positionloans').hide();
            sort_positionloans();
        });
    }
}

function update_positions() {
    $('.ajax-loader#positions').show();
    $.get("/trading/_interior_positions", function (positions) {
        $('div#positions').html(positions);
        sort_positions();
        $('.ajax-loader#positions').hide();
    });


}

function update_bids() {
    var elpair = document.getElementsByName("pair")[0]
    if (elpair != null) {
        pair = elpair.value
    } else {
        pair = "btcusd"
    }
    $.get("/trading/_bids/" + pair, function (bids) {
        $('div#bids').html(bids);
		//$('div#bids table tbody tr').on('click', inject_order_from_book);
    });
}

function update_asks() {
    var elpair = document.getElementsByName("pair")[0]
    if (elpair != null) {
        pair = elpair.value
    } else {
        pair = "btcusd"
    }
    $.get("/trading/_asks/" + pair, function (asks) {
        $('div#asks').html(asks);
		//$('div#asks table tbody tr').on('click', inject_order_from_book);
    });
}

function inject_order_from_book() {
	var row = $(this);
	var cols = row.find('td');
	var type = row.parents('div#asks,div#bids').attr('id');
	type = type == 'asks' ? 'sell' : 'buy';
	var pricecol, tacol;
	if(type == 'sell') {
		pricecol = 2;
		tacol = 0;
	} else if(type == 'buy') {
		pricecol = 2;
		tacol = 4;
	}
	$('input#amount').val(cols[tacol].innerText);
	$('input#' + type + '_price').val(cols[pricecol].innerText.replace('$', ''));
}

function update_lendoffers() {
    var elcurr = document.getElementById("currency")
    if (elcurr != null) {
        curr = elcurr.value
    } else {
        curr = "usd"
    }
    $('.ajax-loader#lendoffers').show();
    $.get("/credit/_lendoffers/" + curr, function (lendoffers) {
        $('div#lendoffers').html(lendoffers);
        $('.ajax-loader#offers').hide();
    });
}

function update_loanoffers() {
    var elcurr = document.getElementById("currency")
    if (elcurr != null) {
        curr = elcurr.value
    } else {
        curr = "usd"
    }
    $('.ajax-loader#loanoffers').show();
    $.get("/credit/_loanoffers/" + curr, function (loanoffers) {
        $('div#loanoffers').html(loanoffers);
        $('.ajax-loader#loanoffers').hide();
    });
}

function update_account_overview() {
    $('.ajax-loader#account_overview').show();
    $.get("/account/_account_overview", function (account_overview) {
        $('div#account_overview').html(account_overview);
        $('.ajax-loader#account_overview').hide();
    });

}

function update_creditbook(indicamount) {
    var elpair = document.getElementsByName("pair")[0]
    if (elpair != null) {
        pair = elpair.value
    } else {
        pair = "btcusd"
    }
    var elvir = document.getElementById("variableRate")
    var includevir = 0
    if (elvir != null) {
        if (elvir.checked == false) {
            includevir = 0
        } else {
            includevir = 1
        }
    }
    if (includevir == 1) {
        $.get("/trading/_credit_book/?vir=1&pair=" + pair, function (creditbook) {
            $('table#creditbook').html(creditbook);
        });
    }
    else {
        $.get("/trading/_credit_book?vir=0&pair=" + pair, function (creditbook) {
            $('table#creditbook').html(creditbook);
        });
    }
}

function update_lastprices() {
    $.get("/account/last_prices", function (last) {
        $('div#lastprices').html(last);
    });
}

function update_wallets() {
    var walletname = document.getElementById('wallet');
    if (walletname != null) {
        $.get("/account/_" + walletname.value + "_wallet", function (wallet) {
            $('div#walletrender').html(wallet);
			update_balance_overview();
        });
    }
}

function update_wallet_balance() {
    $('.ajax-loader#balance').show();
    var el = $("wallet_name").selected.valueof()
    $.get("/account/_balance_usd_" + el, function (wallet_balance) {
        $('div#balancewalletusd').html(wallet_balance);
        $('.ajax-loader#balance').hide();
    });

}

function toggleObjectDisplay(obj, objtohide, objtoreset) {
    var el = document.getElementById(obj);
    var elhide = document.getElementById(objtohide);
    var elreset = document.getElementById(objtoreset);
    if (el.checked == false) {
        elhide.style.display = 'none';
        if (elreset != null) {
            elreset.value = '';
        }
    }
    else {
        elhide.style.display = '';
    }
}

function unset(obj) {
    var el = document.getElementById(obj);
    el.value = "";
}

function updateOrderPriceEquiv(type,curr_unit) {
    var bt = document.getElementById(type + "_type"),
	    bs = Number(document.getElementById("amount").value),
		bpe = document.getElementById(type + "_price_equiv"),
		equiv;
	if(bt.value.match(/.*MARKET/)) {
		var price = type == 'buy' ? Number(document.getElementById('ask-btcusd').innerHTML) : Number(document.getElementById('bid-btcusd').innerHTML);
		equiv = bs * price;
	} else {
	    var bp = document.getElementById(type + "_price");
		equiv = bs * Number(bp.value);
	}
	bpe.textContent = equiv == 0 || isNaN(equiv) ? '' : '= ~' + (equiv).toMoney(2, ',', '.') + ' ' + curr_unit + ' (*)';
}

function showHideBuyPrice() {
    var el = document.getElementById("buy_price");
    var toHide = document.getElementById("buy_type");
    var trailHide = document.getElementById('buyall');
    if (el != null) {
        if (toHide != null) {
            if (toHide.value.match(/.*MARKET/)) {
                if (trailHide != null) {
                    trailHide.style.display = '';
                }
                el.style.display = 'none';
                el.placeholder = 'Price';
            }
            else if (toHide.value.match(/.*TRAILING/)) {
                if (trailHide != null) {
                    trailHide.style.display = 'none';
                }
                el.style.display = '';
                el.placeholder = 'Price Distance';
            }
            else {
                if (trailHide != null) {
                    trailHide.style.display = '';
                }
                el.style.display = '';
                el.placeholder = 'Price';
            }
        }
    }
}

function showHideSellPrice() {
    var el = document.getElementById("sell_price")
    var toHide = document.getElementById("sell_type")
    var trailHide = document.getElementById('sellall')
    if (el != null) {
        if (toHide != null) {
            if (toHide.value.match(/.*MARKET/)) {
                if (trailHide != null) {
                    trailHide.style.display = '';
                }
                el.style.display = 'none';
            }
            else if (toHide.value.match(/.*TRAILING/)) {
                if (trailHide != null) {
                    trailHide.style.display = 'none';
                }
                el.style.display = '';
                el.placeholder = 'Price Distance';
            }
            else {
                if (trailHide != null) {
                    trailHide.style.display = '';
                }
                el.style.display = '';
                el.placeholder = 'Price';
            }
        }
    }
}

function showHideLendRate() {
    var el = document.getElementById("control-sell")
    var toHide = document.getElementById("sell_type")
    if (el != null) {
        if (toHide != null) {
            if (toHide.value.match(/.*MARKET/)) {
                el.style.display = 'none';
            }
            else {
                el.style.display = '';
            }
        }
    }
}

function sumAffialiates() {
    var summy = 0;
    $(".revenue7").each(function () {
        summy += Number($(this).text());
    });
    $("#sum7").text("$" + summy);
    var summy = 0;
    $(".revenue30").each(function () {
        summy += Number($(this).text());
    });
    $("#sum30").text("$" + summy);
}

function toggleSelect(classtohide, idselector) {
    var selectedId = $('#' + idselector).find(':selected').text().replace(/\s/g, "").toLowerCase();
    $('.' + classtohide).hide().filter('#' + selectedId).show();
}

function toggleSelectClass(classtohide, idselector) {
    var selectedId = $('#' + idselector).find(':selected').text().replace(/\s/g, "").toLowerCase();
    $('.' + classtohide).hide().filter('.' + selectedId).show();
}

function validateEgopay(directionorder, minamount) {
    var amount = document.getElementById("egopay_amount")
    var daamount = Number(amount.value)
    var limit = Number(document.getElementById("limit_egopay").innerHTML)
    if (limit < daamount) {
        window.alert("You can not deposit this amount!")
        return false
    }
    return true
}

function select_wire_template() {
    var choice = document.getElementById("templatechoice")
    if (choice.length != null) {
        var template_choice = choice.value
        var temp_name_choice = document.getElementById("template_name_choice")
        var save_temp_choice = document.getElementById('save_template')
        if (save_temp_choice.checked == true) {
            temp_name_choice.style.display = '';
        } else {
            temp_name_choice.style.display = 'none';
        }
    }
}

function choose_wire_template(templates) {
    var choice = document.getElementById("templatechoice")
    templates_list = $.parseJSON(templates);
    if (choice.length != null) {
        var template_choice = choice.value
        document.getElementsByName("account_number").value = benef_acc_num
        document.getElementsByName("bank_name").value = benef_bank_name
        document.getElementsByName("bank_address").value = benef_bank_add
        document.getElementsByName("bank_city").value = benef_bank_city
        document.getElementsByName("bank_country").value = benef_bank_country
        document.getElementsByName("swift").value = benef_bank_swift
        document.getElementsByName("interm_bank_name").value = inter_bank_name
        document.getElementsByName("interm_bank_address").value = inter_bank_add
        document.getElementsByName("interm_bank_city").value = inter_bank_city
        document.getElementsByName("interm_bank_country").value = inter_bank_country
        document.getElementsByName("interm_bank_account").value = inter_bank_account
        document.getElementsByName("interm_bank_swift").value = inter_bank_swift
    }
}

function validateOptions(directionorder, minamount) {
    var amount = document.getElementById("amount")
    var typeoption = document.getElementById(directionorder.toLowerCase() + "_type")
    var askprice = document.getElementById("ask-btcusd")
    var bidprice = document.getElementById("bid-btcusd")
    var maxrateinc = document.getElementById("incmaxrate")
    var maxrate = document.getElementById("maxrate")
    var buytype = document.getElementById("buy_type")
    if (maxrateinc != null) {
        if (maxrateinc.checked == false) {
            maxrate.value = 0;
        }
    }
    if (directionorder == "BUY" && typeoption.value != "MARKET" && typeoption.value != "EXCHANGE MARKET") {
        var optionprice = document.getElementById("buy_price")
        if (Number(optionprice.value) == 0) {
            window.alert("No price set, please review your order");
            return false
        }
    }
    if (directionorder == "SELL" && typeoption.value != "MARKET" && typeoption.value != "EXCHANGE MARKET") {
        var optionprice = document.getElementById("sell_price")
        if (Number(optionprice.value) == 0) {
            window.alert("No price set, please review your order");
            return false
        }
    }
    if (typeoption != null) {
        if (directionorder == "SELL" && (typeoption.value == "LIMIT" || typeoption.value == "EXCHANGE LIMIT")) {
            var optionprice = document.getElementById("sell_price")
            if (Number(optionprice.value) < Number(bidprice.innerHTML) - 0.1) {
                return confirm("Are you sure to put a LIMIT SELL order below the ticker price?")
            }
        } else if (directionorder == "SELL" && (typeoption.value == "STOP" || typeoption.value == "EXCHANGE STOP")) {
            var optionprice = document.getElementById("sell_price")
            if (Number(optionprice.value) > Number(bidprice.innerHTML) + 0.1) {
                return confirm("Are you sure to put a STOP SELL order above the ticker price?")
            }
        } else if (directionorder == "BUY" && (typeoption.value == "LIMIT" || typeoption.value == "EXCHANGE LIMIT")) {
            var optionprice = document.getElementById("buy_price")
            if (Number(optionprice.value) > Number(askprice.innerHTML) + 0.1) {
                return confirm("Are you sure to put a LIMIT BUY order above the ticker price?")
            }
        } else if (directionorder == "BUY" && (typeoption.value == "STOP" || typeoption.value == "EXCHANGE STOP")) {
            var optionprice = document.getElementById("buy_price")
            if (Number(optionprice.value) < Number(askprice.innerHTML) - 0.1) {
                return confirm("Are you sure to put a STOP BUY order below the ticker price?")
            }
        } else if (document.getElementById("amount").value > 500 && (typeoption.value == "MARKET" || typeoption.value == "EXCHANGE MARKET")) {
            return confirm("Are you sure to put a MARKET order?")
        }
    }
    return true
}

function virCredit(ratecur) {
    var controlEl = document.getElementById("vircontrol")
    var choiceEl = document.getElementById("choice")
    var choice = choiceEl.value
    if (controlEl.checked == true) {
        $('.' + ratecur).filter('.' + choice).hide();
    }
    else {
        $('.' + ratecur).filter('.' + choice).show();
    }
}



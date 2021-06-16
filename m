Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2863AA4AE
	for <lists+samba-technical@lfdr.de>; Wed, 16 Jun 2021 21:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Av0KI7RkFaesTFugEQZT+ddBjEelLrx3vSG1Yx/YO8E=; b=Ttbr0goooG+ds9iPBhbiAuUJ7b
	/upYuqtnUcBH8fTQpfAPPLhl5dq0J0ILZxZwjUhBPgnlc7dGrHX9jV/3JZpkzuISXWOwCE9o3jwYc
	pUNbwCqnvxZzD6Tv5EO1FoEfgmJi1lU2MG3n5L6ySZkuNtheyqqwLS4/7W3GpdUO5QPUSCDIlXfHH
	zcaDbVZtJM16NLRIhCExAuKv+9vdeUfFA33l/t1q/7m6+3AOvTCLeXn2D8LxSoGamcHvy13Mnf1uE
	1rDQaAOjrGSdR7kTGu73OYEO0LmCehJs2KnG0QkTTmbvVIU3+oHyXvhGwFoOhbfknvhzB1w/AL5Zm
	H0CQX2nA==;
Received: from ip6-localhost ([::1]:56016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ltbZb-006Nuw-7P; Wed, 16 Jun 2021 19:51:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltbZW-006Nun-D7
 for samba-technical@lists.samba.org; Wed, 16 Jun 2021 19:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Av0KI7RkFaesTFugEQZT+ddBjEelLrx3vSG1Yx/YO8E=; b=LCMxJjv91NOBVjqQkDO7CN1uyG
 kXDSE+YusI8gxb8i8eIeShCPUFvYZVoMCLKOvrv009CCQsJABR/YIZplIlcKGs9L364PIzNjpVsdc
 7vCvIREy7xq2DgMvDXcnaPGA+iCxh1NfUqcH/Q5HqIeZX8lcfneI5OIe79fAEh6H83XSEN6MDviXP
 wc+hRsBs52CIJogV30mC/odZA11Ofc1JkOn2nZ7SWAtcDcxr9aUf3Yj72ARGOIYPIMBYiwMhE0vKx
 O/vi0JHRJCugMkABr9Vqe/Nw6ldr4mVsJnDQtozfFP/nboioHEVpod21PNHOf6ChUsqjTw6NmGfYn
 It2rQXH/jDdtPLwGPcQFmooY/NxNXHsgSI/0/CiRZ9DB64Y6/yxUvq8uDo2s91Syl03ckw0afRIXG
 2Igv0sI8CIeiWudM1XNOdidQzumPQcD+5E3jUPLSkOtFLGSDrOme86t0bWHkVodFKvdsUqbnCiZPL
 Q44X8PHKCcS5VuyPZwZnilsB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltbZU-000263-8t; Wed, 16 Jun 2021 19:51:32 +0000
Date: Wed, 16 Jun 2021 12:51:29 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: duplicit LDAP calls
Message-ID: <20210616195129.GA669059@jeremy-acer>
References: <CAEcb10vV+557J6mTRRw+tjTh8x34b0tud-7V2GYkzCTOMgquxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEcb10vV+557J6mTRRw+tjTh8x34b0tud-7V2GYkzCTOMgquxw@mail.gmail.com>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 16, 2021 at 10:49:18AM +0200, Pavel Filipensky via samba-technical wrote:
>Hi,
>
>during my my learning/observation of how machine account password is
>changed via net ads changetrsutpw I have noticed that two same LDAP calls
>are done in ads_keytab_add_entry() in source3/libads/kerberos_keytab.c  :
>
>391 »·······my_fqdn = ads_get_dnshostname(ads, tmpctx, lp_netbios_name());
>
>...
>400 »·······if (!ads_has_samaccountname(ads, tmpctx, lp_netbios_name())) {
>
>
>Both ads_get_dnshostname() and ads_has_samaccountname() call
>ads_find_machine_acct() and trigger exactly same LDAP search and get the
>same response. I guess there are more places where an unnecessary network
>call is done, but at least for this case it is easy to refactor the code to
>avoid it. Does  it makes sense to gain performance for possibly less
>structured code?

Depends on the code changes, but yes, that does seem
a useful fix !

Thanks !


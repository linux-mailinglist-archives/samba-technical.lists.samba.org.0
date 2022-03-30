Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE14ECDF4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 22:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4odri8B4R6AI76pgtTzTS+h8p/C5WgPrFxKSrbOvp5A=; b=Rv3HXpFygCYllOPL9rhgJDuYsu
	wfP8w7SVKW6ENozTI1XEPSOvKzu/qdH+E+QpjmZmtdiDFvR9tOrUeCMZifqmsU+SIWrIkRG3l/14C
	AM14JKSJktjGNfM1jztQ09YnvVk2w1aWb14eu/NForsnBPwsEb8aIIjNbpyis7D4lBZOlulc0Ma0O
	lyFhVhGY72IYf2kyCjtRK7Cc7M6I2LcTk1YFX19IKdNRSUGcM+S/A4keuuJUugpOHaqWrgpoJSl3h
	cbpSIZCyMHbp7fzs3OTQXcrEu+K4XgkSQVqBv+IkLxTusV3QbOkOK/cAnNyYmj+xqL7LDb2VNAypb
	rJjMLWgg==;
Received: from ip6-localhost ([::1]:22218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZewA-006wo3-4l; Wed, 30 Mar 2022 20:29:02 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:54671) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZew5-006wnt-Nm
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 20:28:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0114340A3F
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 23:28:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 225792A
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 23:25:09 +0300 (MSK)
Message-ID: <9c5e5f7d-7f5c-3401-85aa-dbfee917b807@msgid.tls.msk.ru>
Date: Wed, 30 Mar 2022 23:28:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf install recompiles another 4k files after waf build built its
 own 4k?
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
In-Reply-To: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

30.03.2022 21:22, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> Here's one more issue with the build process of 4.16.
> The context is - I'm packaging 4.16 for Debian.
> We fixed the missing PYTHONHASHSEED=1 for waf already,
> but it didn't help with the recompilation.
> 
> I noticed that `waf install' compiles a whole lot of files
> after `waf build' finished already. Most of them are recompiled, -
> for example, the dynconfig.c file (it is the first such
> file), and many other files from all over the places.
> I can't say they _all_ are recompiles or not, maybe some
> of them are new.

As Andrew Barlett wrote, the build system is designed to
build samba runnable from the build tree by default, and
the install step makes it recompile quite some stuff and
relink almost everything.  So this solves the recompilation
mystery for me.

Ideally it'd be good to have some 'build-for-install'
target which builds everything needed for install.
No such target is mentioned in `waf --help', so I used
`waf install' instead of `waf build' to perform just
the production build step. It makes extra file copying
but it is better than recompiling/relinking.

Thanks,

/mjt


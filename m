Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD534ECBCB
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 20:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QxYCX7m2aC3BiCStpkz0TUl7Bdj3KAdpXVWPnwsahuo=; b=W0fkT9bbp2FBqmwLF1Gn6MKFCq
	KInNVi3b6hraCZ+b8UvANek2atTfbxa3Ts6MMr/nfqxB5tD8aDaeMSh/kqIVATk6aE2xKJq4ENqkY
	YNYj6zqxWY+TPJyewdVQvT9TEOyn1u0b/ZeEzqBgnrlm9+h7fh9pxcVJ9b2TQ1KKRwi4wGchdG3aa
	UxJj8Y5RNLtylZ0qGK4MkGB+gZ3Mg9A6gcGJ+GAB3jm7ugMF/WHTdGi/Wfyi6pXk/MeYXeFg60CdK
	1txjmeH8m5A6seNnTivpCFyORnOMn2ZGIMdJvy3DJDtzq/lTfED0KsUb5SmXsPaA4ktowiCDgQG/s
	4dYGEAng==;
Received: from ip6-localhost ([::1]:18388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZcxR-006ujN-Cs; Wed, 30 Mar 2022 18:22:13 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:52489) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZcxL-006ujC-EH
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 18:22:10 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E94A940A3F
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 21:22:01 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 363382A
 for <samba-technical@lists.samba.org>; Wed, 30 Mar 2022 21:18:15 +0300 (MSK)
Message-ID: <2f430629-354a-5b2a-111b-c80b93225e87@msgid.tls.msk.ru>
Date: Wed, 30 Mar 2022 21:22:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: waf install recompiles another 4k files after waf build built its own
 4k?
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

Hi!

Here's one more issue with the build process of 4.16.
The context is - I'm packaging 4.16 for Debian.
We fixed the missing PYTHONHASHSEED=1 for waf already,
but it didn't help with the recompilation.

I noticed that `waf install' compiles a whole lot of files
after `waf build' finished already. Most of them are recompiled, -
for example, the dynconfig.c file (it is the first such
file), and many other files from all over the places.
I can't say they _all_ are recompiles or not, maybe some
of them are new.

Some of the linking calls definitely are new, for these 3:

  Linking bin/default/third_party/heimdal_build/compile_et.inst
  Linking bin/default/third_party/heimdal_build/asn1_compile.inst
  Linking bin/default/lib/replace/libreplace-samba4.inst.so

(these are linked at the install time _only_).

Why the build system might decide it needs to recompile right
to everything during the install stage?

The 2 waf invocations (for build & install) are the same.

Thanks!

/mjt


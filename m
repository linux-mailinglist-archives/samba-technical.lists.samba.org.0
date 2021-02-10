Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4B315F8E
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 07:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DAqAYKEzyYPnFUHYjYqVIDLVyQG7MwBPruZYO/jGaQs=; b=hSl8/G2B+FrZfw/hla1boGUOMC
	dTs82SPmBrl6Wv/SGuKi0d94gfF0ZkXCdSsJVKjlo6KJujNjZFEZnMtCPcRa4aFmaSCISKAp1XCbf
	3V6sQsi2EwV0ZSk6FT0YUa5HlLiJHcaVfOATPUEHdeFeliD9/Gbe5BH96ajmRBvKetiS5DLT/ZncP
	qUns8yj9gUmwEkWOiTBO/+WCij9GuAL6ve1lP7SJh8jL5Sx4ZWriULoMSmGG29HNGrECDFOi1R5jN
	DwU1pIeyk+/KOtRFvGOwJRoUA2Kj8EudDeEk4pZIqcMOKScwjIISEHNUMgQv7JCGt6SHTRCNsTdf5
	yLP05Teg==;
Received: from ip6-localhost ([::1]:64210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9j6w-00Bwob-0J; Wed, 10 Feb 2021 06:36:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9j6h-00BwoU-Ak
 for samba-technical@lists.samba.org; Wed, 10 Feb 2021 06:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=DAqAYKEzyYPnFUHYjYqVIDLVyQG7MwBPruZYO/jGaQs=; b=F05JhQBu5q3l2VtB/44+pl42ZE
 6X4VOWIIa31JeS6JsMxZET+Sl5g6pRdFFEfhSONWrfFW0YP182f30oFl8bqIUiqP2pk9CRuefW1mJ
 byMW8RFcar64jAG/yEFQX4GORvBqM/iIuucxcb3ZB0Akx2Zjxc9Kx83DJNbFRzhhddIxEvPR67o+l
 t6kdZ86LByoGocredgbBAjrXYLkvz4nmj0QibwLQF8+At5znkhXAvHoj9Knw5p6AFtBZ1RStQb+jW
 ZNRJhh3nhRtW0ph3wtXloXVnN6R+OEuJGvRqCOgBu7jwPBoTKpTwR+aAJqWFRaTNQw9pBSY71JWds
 nOCwYt5uircSUy7ivPXTJ8ukw1xKFu+KmOfD0Sf2mgp94ahMTBSXMM4ch3eJNII5yUhZ1uCRpLakr
 zsGE9IQxHXnpLbAU3Y+u+rscjJoKAlGP6MvCwkzdNL1rLTNoQ6af94aJBHqkXaI9bA8DKQkVa0HGJ
 AiQ5Gz7v8bUQn/h1yZoJctfW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9j6d-0007cE-P9; Wed, 10 Feb 2021 06:36:08 +0000
Message-ID: <1bd546368a2e6567f3a43c238cb513f495bb61a7.camel@samba.org>
Subject: Re: Build error with C locale 4.14rc2
To: OHKAWA Yuichi <kuri@ei.tohoku.ac.jp>, samba-technical@lists.samba.org
Date: Wed, 10 Feb 2021 19:36:02 +1300
In-Reply-To: <8FA63D2B-626F-4717-858D-8DA81F2AB80E@ei.tohoku.ac.jp>
References: <8FA63D2B-626F-4717-858D-8DA81F2AB80E@ei.tohoku.ac.jp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yeah, we have so far enforced a UTF8 locale in our build environments. 

Later python versions assume C really means UTF8 but in the meantime
just set that.  A patch to handle this as bytes would probably also be
accepted (via GitLab), but I think this will be a big whack-a-mole.

(And because we enforce UTF8 in the build environments in CI any fix
wouldn't be tested anyway). 

Sorry,

Andrew Bartlett

On Wed, 2021-02-10 at 13:06 +0900, OHKAWA Yuichi via samba-technical
wrote:
> Hi,
> 
> When I tried to build 4.14rc2 with LC_ALL=C locale, a build error
> have occurred.
> If I used LC_ALL=en_us.utf8, I had no error.
> 
> I guessed that because python3.6 under C locale cannot treat  a latin
> character ö of source4/heimdal/lib/asn1/lex.l.
> 
> ---- error message ----
> [368/418] Compiling source4/heimdal/lib/asn1/lex.l
> Waf: Leaving directory `/builddir/build/BUILD/samba-
> 4.14.0rc2/bin/default'
> Build failed
> Traceback (most recent call last):
>   File "/builddir/build/BUILD/samba-
> 4.14.0rc2/third_party/waf/waflib/Task.py", line 350, in process
>     ret = self.run()
>   File "./buildtools/wafsamba/samba_waf18.py", line 30, in flexfun
>     tsk.outputs[0].write(txt.replace('\r\n', '\n').replace('\r',
> '\n')) # issue #1207
>   File "/builddir/build/BUILD/samba-
> 4.14.0rc2/third_party/waf/waflib/Node.py", line 201, in write
>     Utils.writef(self.abspath(), data, flags, encoding)
>   File "/builddir/build/BUILD/samba-
> 4.14.0rc2/third_party/waf/waflib/Utils.py", line 268, in writef
>     data = data.encode(encoding)
> UnicodeEncodeError: 'latin-1' codec can't encode characters in
> position 33323-33324: ordinal not in range(256)
> --- 
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba




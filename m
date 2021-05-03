Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1037101F
	for <lists+samba-technical@lfdr.de>; Mon,  3 May 2021 02:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=FGSAveiZefUvFAUuvqYwNppuuC9jE1wknxhd4xupUts=; b=X/AB/E0bq7s+cao0t/7Cb12LcO
	/fX9k3606T9ogE8Np4EYDOwqCj56gzxsJdwhtfRz24nU9tq1+dRYzGaXSSfb+SYS0flUEl1JAETML
	Amy/XAL2ccAt6ErNFnork3f6jk0XrCZBDH0I6FsgDPY8t6UwT5hpjjxeIJBo5SIyNAGfYPdkJ/Jsi
	aZdY6sknnU6C1E5368WuvyirAwsMifc73/veCDkM/FWGSoduOBEk/XNMWMaxLT9QDiFvO0BC/twtu
	wFdvY212mqL3XrDLA+DykxcwpCja44ORclhEITZUnICDD+3rxKTvnlBx+N4qUyr/Akeii8IXlpH3d
	Q+ASz/IQ==;
Received: from ip6-localhost ([::1]:30564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldMWR-00FKNr-Dh; Mon, 03 May 2021 00:33:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldMWN-00FKNk-2S
 for samba-technical@lists.samba.org; Mon, 03 May 2021 00:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=FGSAveiZefUvFAUuvqYwNppuuC9jE1wknxhd4xupUts=; b=aSZiUVFq8YBRcB0ptolVHFyrdc
 Hr4X/artvy9e4H4t56i/+MCfAKtCYNwkjTKh4cyoRyLTwHwEkNYTIXmNnvsCaikwh/vAoHg+6u2fr
 P/LomA8vDbAXiMZBqs9NXGxdaWd1N0zuHYWVO3E+kZUGM9L6BHw1QPfb5/IlgfmvnB+9ucItO5eLI
 7NzwkTJKKiOHcj5V6mkwvueN98LHArnQ4iN1bpGX+zdBgRKSbZgZSKf99cNuCj/7a1d23BUppBhn4
 Qts2/FX8Hn9ShgS7JW0fI6kxSdq8xiyN79oUMUhw1Awgk9P98Qi4PiY1n9Q9xnoxJc1VmeVtiQKll
 uQDXwZ1AgXOFzS3XNXFZJfDTwx3DLqfv8fd5R+Gi4UfTq4FhincfwaIutWB0OiRUvc5LaqN0O77R9
 kPUiWurE805AfWzk1g2Ifmp/s+4sZJPLiOEp4Xn2Wsg7tweZPxKKV4g6FWpR7brjBbnhOCSrhRjbx
 G5Xw2qpcNuIOslsNY1QZzBew;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldMWK-0005ah-Bn; Mon, 03 May 2021 00:33:08 +0000
Message-ID: <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
Subject: Re: Kerberos raw prototol testing
To: Stefan Metzmacher <metze@samba.org>
Date: Mon, 03 May 2021 12:33:03 +1200
In-Reply-To: <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
 <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-05-03 at 01:16 +0200, Stefan Metzmacher wrote:
> Am 27.04.21 um 12:31 schrieb Andrew Bartlett:
> > 
> > Thanks for keeping this tree recently rebased, but how do we go
> > from
> > here?  
> > 
> > Should we just learn from the concepts and implement the narrow
> > case at
> > hand (FAST testing) and you will integrate it later, or is there a
> > better way?  How can I/we use your code?

> > There is clearly a lot of effort and value in between all the 'sq',
> > 'fixup' and reverts, but I don't know how to sift that gold out
> > properly and refine it into an 'upstream' state.

> Just look at the complete diff of that branch as_req_tests.py and
> raw_testcase.py, and work on top of that. If you're ok with it I can
> just
> squash almost everything and propose it as one large patch in order
> to
> make progress and get it to master. Or do you think it would be
> useful
> to have some of the preparation as individual commits?

Firstly, I would say I've come to like our pattern of small,
identifiable commits with single logical changes, because we learn and
can follow better when the patches tell as story, but the value
diminishes greatly for new testsuites.

In this case in particular I've checked the diff and other than of
course the pycredentials fix (thanks, obviously good!) this really is
quite fine squashed. 

I'm also happy if you keep some of the early preparation patches
distinct, eg "python/samba/tests/krb5/rfc4120: better etype dissection"
but I wouldn't spend much time beyond that. 

Please propose it squashed down and lets work to get it into master. 

I'll do a proper review but just one thing I noticed.  In:

commit ea514b738416efc7429943c7e06f7f52670cfbe9
Author: Stefan Metzmacher <metze@samba.org>
Date:   Tue Apr 14 14:05:03 2020 +0000

    selftest/knownfail_mit_krb5

diff --git a/selftest/wscript b/selftest/wscript
index afb1fa936cd..3e68ec77d8b 100644
--- a/selftest/wscript
+++ b/selftest/wscript
@@ -144,6 +144,8 @@ def cmd_testonly(opt):
 
     if CONFIG_GET(opt, 'HAVE_MIT_KRB5_PRE_1_18'):
         env.FILTER_XFAIL += ' --expected-failures=${srcdir}/selftest/knownfail_mit_krb5_pre_1_18'
+    if CONFIG_GET(opt, 'SAMBA_USES_MITKDC'):
+        env.FILTER_XFAIL += ' --expected-failures=${srcdir}/selftest/knownfail_mit_krb5'
 
     if Options.options.FAIL_IMMEDIATELY:
         env.FILTER_XFAIL += ' --fail-immediately'


This needs to be dropped or consolidated as Gary already did the same
further down the file.

Anyway, a good example of why we need this merged: much better to all
be working on the same basis in master that than seeing duplicate work
done, we need to spend our time wisely!

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







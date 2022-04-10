Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A084FABE2
	for <lists+samba-technical@lfdr.de>; Sun, 10 Apr 2022 06:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=O2oX3gXmIKAgmB9MX3xGEyTuzEx/SDSr+VzfdOigTOY=; b=P6TPX+WOLp4KPn7blinwqYoDOb
	jZBCDEyP0wAbbkQrxhBdXhUQuyHUxXxETi3EJO6ZQgkmaY4pCO6UJnrT7+mrsNIKe/3X46NW+5X6S
	cg8aIt7d5Xw2odfIzRMwU2VcKlmyA3F78ULgNs0E0u7JNJ1/RlgjPMg15V+TUB9GNU01451rvBTuK
	sVKRgizjsEtvUz3lelDayz6U7Dk/M/Dmq6hZV8St1cYA9h25GXmgnAN3KNTFLfJ4CHGhAvwiu1cJB
	J+xkG33CdaX+CIsXZcHP4coks++j+owZTFU1Te7F9vreqguTnUdox3qVg0Wo34jDWy3Vyl0zGhrGv
	Sj5SB7oQ==;
Received: from ip6-localhost ([::1]:39964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ndP9r-00BL2S-6X; Sun, 10 Apr 2022 04:26:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38272) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ndP9k-00BL2J-Lq
 for samba-technical@lists.samba.org; Sun, 10 Apr 2022 04:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=O2oX3gXmIKAgmB9MX3xGEyTuzEx/SDSr+VzfdOigTOY=; b=HdtHv9ZnncfT2wCrblxjA19PbQ
 fF8RPzVbO8bxPemPu2j2T57yNtYQVSXTE+6S9HxRhU5hRfkDOKvbuY6c+ry092iZNVqL9JV1NB6uD
 97sOdMJF+pp9K+Zsrg2Hkdlbm7W/FSOpiSGMIaU/70rDZ9ibEO7RgjVqVIRLr/HAbpAj9hqf/O87e
 8FOqOTUfCOz+HCM0MQYGuoQ/JN8a75gla/ZOtvktsfUz+qaIecZ9gur9OYVzUHPbzSWJyVYYAmXDl
 Bqx/kH8JpTsjoptbY+l2QZ5y5c5Z3p1rX5eM85ETAgJrSmdD/ipi9R721UyOVIr+8bZSD70kjnlUr
 GFlGQmZ+X7Q+Mbtq0iNTQMRB6TRPggmTf48pCJW4f71eETJC8lD3Tr2+QqfuloA1A64Dn13fJTtR0
 RVQElgYF/nfi/OG1JKfnXAW6ZiF982fKXI/3j8G/UxSUMhBSbyHt3lwTTUFEh+AZh7Fc3H3ObLoDT
 fPk7/nafaT099W/cSmuo6/Dj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ndP9i-006EOd-NQ; Sun, 10 Apr 2022 04:26:31 +0000
Message-ID: <3b7bbcfff82c15a6e6fb8e186e75e4e8e54c6fa6.camel@samba.org>
Subject: Re: waf and building python modules for multiple python versions
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sun, 10 Apr 2022 16:26:27 +1200
In-Reply-To: <bb99e0b1-ceaf-fa70-8830-6eb2f145f273@msgid.tls.msk.ru>
References: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
 <8368b49259376d59184da5aadc7c156226b950a4.camel@samba.org>
 <bb99e0b1-ceaf-fa70-8830-6eb2f145f273@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-04-09 at 11:13 +0300, Michael Tokarev wrote:
> 
> I just built talloc with default python 3.10, removed
> bin/default/libpytalloc-util.cpython-310-x86-64-linux-gnu.so, and
> re-built it thysly:
> 
>   PYTHON=python3.9 make
> 
> and it re-linked the same libpytalloc-util.cpython-310-x86-64-linux-gnu.so.
> So apparently it recorded somewhere the python binary which was
> used during configure.

Yes, the above command will run 'waf' with python 3.9 but yes, the
configure results were already stored (just as it would have been with
autoconf) a configure time.

> > That is the only plan I can think of.  But which python version would
> > Samba's python-using libs link to?  For as long as you ship smbtorture
> > and expect it to work you would have to do multiple versions of that as
> > well...
> 
> It is not about samba proper. These will have to be recompiled as
> a whole anyway.  This is about libraries (talloc, tdb) which are
> used by other packages. When your default python is 3.9 but 3.10
> is also available, you build, say, python3-talloc package to contain
> *two* versions of the pytalloc module (containing
> libpytalloc-util.cpython-39-x86-64-linux-gnu.so and
> libpytalloc-util.cpython-310-x86-64-linux-gnu.so ).  Other packages
> are built with whatever python version they choose, this is not
> relevant by now (either of 3.9 or 3.10).  Next, you switch default
> python from 3.9 to 3.10. If a package used 3.9 module in talloc,
> it will just switch to 3.10 one which is *already provided* by
> python3-talloc package, there's no need to rebuild python3-talloc
> so that packages using it will work after python version switch.

Just run the whole thing twice for those, right from the top, picking
out the different modules.  The 'used elsewhere' libs are much simpler
and only have python -> C deps thankfully.  They are also really fast
to recompile.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



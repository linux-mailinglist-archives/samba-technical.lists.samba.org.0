Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CE1231AF
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 17:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=H47HSWJ4PsygyKWIp3nsfV15trq4KAFU8tVUMvZ0m94=; b=AlR006KuKaMFu0HALvxEvJTuur
	hdoiqSI9JTg0+1VdoA0IlsA/b5Og4ps9OtD5jyGFXpoK52zjJxfkgUAIf7NnIPWeS9qWp8jNu7Zmv
	85U3DqROBDhxt4RSddSDTyCkzuYtUH2c3y+I8eyLO2AgiOZAcxzwyFSzgHGgqaVbjG1Pv8LqtCkZp
	DgTHZVULKiLvHI2KBUVWWKMz1wvfmJcGr5RU4VI7kNg3STVuIsVOceAxPrKfwUOL2HAYXGmNZ2LAk
	irOVCXA1u9bVle/r3Xi2e3tjx0FQoYMmGzPbn0KULyEETD5bXUwZjrD24xjK8gjRfVn7q/EoUajWR
	vdMw2NvA==;
Received: from localhost ([::1]:59816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihFWl-007WU8-CK; Tue, 17 Dec 2019 16:16:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihFWg-007WU1-M4
 for samba-technical@lists.samba.org; Tue, 17 Dec 2019 16:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=H47HSWJ4PsygyKWIp3nsfV15trq4KAFU8tVUMvZ0m94=; b=Zr0yQ1fB0TJBI0P5IbQVKtzF38
 rL87qyrxZZ0Fl2UbOXHRfA0N7EO/fLsoIUs18LxNn9PsQDDkc8Wl3G5h2l5i41qJBrJ3kbg68kIGl
 wnjcXK3mh4rybZRDwGWwuF5uGZb4XQcAdiPJt8+lM8v9jI6S+jvZlytE/wd0Ym+xZdfQLn1j6b1xn
 Yn29lS73gyAJ0g6x+6LMEzishTt28TdFx5pKpTb9ns4KQq3TL1xPcAPxk1ZdeIaQYyduXtAh8JqRo
 axdXHVcpd8kwwsGl72s6v7Is9ye+pQb0KYxSYsBpnGJkQnxOrTzN+hSmJI5jteDG/m8JsNWcKQY0a
 XvRycXtJFVClIwHAzp7+gk5AVqed9+SzcHMKqIYEBuVEcK9jp/3S2iMet9P2XXn3gt85nr/Eeg8HO
 8rzKkulPzY2zl1ZkQ8DEyW1O/zvV/2DfXOkUmEB246bkA/ASAvbhG6o2nJD5Ltn5duYSHMSNnCBBe
 b1aUsOAZQrEZQOZSrBFB0wEn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihFWf-0004xf-T9; Tue, 17 Dec 2019 16:16:46 +0000
Date: Tue, 17 Dec 2019 18:16:44 +0200
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: ldb: LANG=tr_TR.UTF-8 make test - fails
Message-ID: <20191217161644.GD1458792@onega.vda.li>
References: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
 <20191217160440.GC1458792@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217160440.GC1458792@onega.vda.li>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 17 joulu 2019, Alexander Bokovoy via samba-technical wrote:
> On ti, 17 joulu 2019, Isaac Boukris via samba-technical wrote:
> > Hi,
> > 
> > I'm looking into this bug, which I can reproduce on master:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1743531
> > 
> > In short it looks like running the ldb tests with tr_TR.UTF-8 locale causes
> > this failure:
> > 
> > Running Python test with /usr/bin/python3: tests/python/index.py
> > ...F...FF...F......F...FF...F....
> > ======================================================================
> > FAIL: test_delete_index_multi_valued_truncated_keys
> > (__main__.MaxIndexKeyLengthTests)
> > ----------------------------------------------------------------------
> > Traceback (most recent call last):
> >   File "tests/python/index.py", line 999, in
> > test_delete_index_multi_valued_truncated_keys
> >     b"0123456789abcde1" + b"0123456789abcde1")
> >   File "tests/python/index.py", line 98, in checkGuids
> >     self.assertEqual(len(res), 1)
> > AssertionError: 0 != 1
> > 
> > Does anyone have a clue how to look further or how the locale impacts
> > here ?
> 
> Most likely it is GUID versus Guid in Turkish locale:
> 
> $ for i in tr_TR en_US ru_RU ; do LC_CTYPE=$i.UTF-8 ~/tmp/strncasecmp Guid GUID ; done
> tr_TR.UTF-8: Guid ? GUID = 32
> en_US.UTF-8: Guid ? GUID = 0
> ru_RU.UTF-8: Guid ? GUID = 0

Forgot to add: https://en.wikipedia.org/wiki/Dotted_and_dotless_I

There are at least two locales (tr_TR and az_AZ) in glibc have dotless i
transformation different from Latin scripts and GUID versus Guid
comparison would be different there (attribute name would not match in
the test).


-- 
/ Alexander Bokovoy


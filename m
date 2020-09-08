Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE9262241
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 00:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=KOjdhyAHRKzdZQELo1DXoToXx2B7HgAGo+JcH/b3yDg=; b=Ci/HshGksxua5piB7F0SmLH9QR
	ABmt5yvNFJ3Aka9olHEdjX8RvLAkzjq47UAci0ccljoJ/btpNhr0LvdIB9/Ejdgf5V5SYuOgbN/Y6
	gf03hB2PTtrzPdmGo/4ljQI7OBiKt0kfJxhEqwqeiUiYt3/9fNhxJA+USr8tfmvpgDrUbIqTiWwvL
	iBtc0x2RMMGt/q0WNuAw4sCdPFVMih5WCyABb0qiv1qUP+YwTusOvgRSJF3mwbN/kCRH7dWHW/EDn
	/YKwNdFMobkHb1rt/b9bT5i4n/rAzWed7ER5/VAHOL6V/Cdw8Atm6VPqncZCx0RfmeLHHfSIIBCjB
	TIuy40aA==;
Received: from localhost ([::1]:54404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFleJ-004hpI-5D; Tue, 08 Sep 2020 21:59:35 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:42194) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFleB-004hpB-PP
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 21:59:32 +0000
Received: from [IPv6:2404:130:0:1000:4199:3f10:497d:e5fb] (unknown
 [IPv6:2404:130:0:1000:4199:3f10:497d:e5fb])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 12ED7810CB; 
 Wed,  9 Sep 2020 09:59:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1599602342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KOjdhyAHRKzdZQELo1DXoToXx2B7HgAGo+JcH/b3yDg=;
 b=CqUMznQNxgi+fEDL9+XfSfF8jnejaBbPqqzGlxJJ5wvLQ7QtlrqmEQ38A+fuivFnBzLy6L
 wLlJT0wWMgnJBmH0U1wsOI/41mAIgLBbcxZdesemkrqkz90MfkK4WSEJ5T4mJqLoJrnGom
 /3UNRIReKhwj5wIPWHRWMtk0PAvgmIEjU/n4pfHE0Gx+iHLo1j7qDOKV3rweI2/Bd5WubT
 DV8c20lQQt6b5MSRw4oH9raIuFVKplWEuHilP1dqsnPjph+J8yxl4v4wwRsB3Tm5G42XKJ
 5R6eRdePKoU+DZtea6+EDiLnkNRZdQX1X/QKnzQzpfd3di5y6bjiKP8YEsWSFA==
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Andrew Bartlett <abartlet@samba.org>, Alexander Bokovoy <ab@samba.org>,
 Jeremy Allison <jra@samba.org>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
 <20200908161627.GB599978@jeremy-acer> <20200908165820.GB23377@pinega.vda.li>
 <d5a31f2fdfcfd03813cd3cc9ee862af2aad5d5ed.camel@samba.org>
Message-ID: <fece1ff9-f0c8-ab82-6aba-fa3810ca387f@catalyst.net.nz>
Date: Wed, 9 Sep 2020 09:59:00 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5a31f2fdfcfd03813cd3cc9ee862af2aad5d5ed.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.58 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[]; TO_DN_ALL(0.00)[];
 NEURAL_HAM_SHORT(-0.48)[-0.479]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 SUBJECT_ENDS_QUESTION(1.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[99.99%]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/09/20 9:16 am, Andrew Bartlett via samba-technical wrote:

> Thanks!  I love bike sheds

Well in that case,

the final release of Python 2 was on 2020-04-20, not 2020-01-01 as
suggested in the patch.

https://www.python.org/downloads/release/python-2718/

Douglas



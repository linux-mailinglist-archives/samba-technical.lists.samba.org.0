Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0962945E
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 10:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/DTyVth83gkSIB1XgvROyROFgyD9vTXe9EtXzqjK9kY=; b=sq1S0xkmlOqEWM/p2mHDVDz6rn
	aSx7EvQSChqKu9628afijvs4Uxi6I/UMivQRyKWOW8rlk72rqwogiBApchHfTQaFSkv3YcMA490Cb
	yKBHdy2QdtyfJmOaZjF521980DFW6tkT9Ce6ob2mB1lr7ZLwEYKLDQPbDjhCdpa/NLPUSL1lcEZU4
	6SjZKHT89hvTzzw7mCXEmLoNNSKIDg70cYIEA64TWf9gCaDTuJXGeqOv3v3rVIrltw/PIHawvd5Zf
	f1IAdZLdXSPviWbAqXyPkyzTETXrk0RKw6x59t16SFYJ6sJ771LM2cs6+/IROKfzj2YUrQmXTO13a
	WOPQiMHQ==;
Received: from ip6-localhost ([::1]:48954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ousJw-00DetD-9c; Tue, 15 Nov 2022 09:33:32 +0000
Received: from smtppost.atos.net ([193.56.114.177]:19496
 helo=smarthost4.atos.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ousJq-00Det4-Hg
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 09:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
 t=1668504806; x=1700040806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/DTyVth83gkSIB1XgvROyROFgyD9vTXe9EtXzqjK9kY=;
 b=Pd0fzlXjnthHYAOyZEotjehpjhrYpulf5xAS8F4JmpSO0Py+fXPg8Y9Q
 GPRQajShCsYCHSlKMawicasPeUj3cUA8/OHQnGL61/xYx9jFwCgRvsxFc
 XD8HWPorIsKwDWuDtUhRMT0EfuD2GQtFyTRO4lTUaQ+oxh82HoOUVHyYZ
 AyF8/LPGAUnWXANGJlgpOYhSuuLOVgmyztP6BGlbyp7hXf3KFBAP6O/V2
 ZmoonLtkN/oojUcFxMDZSva5Bau4xCwM6OvozNcZlmmKS5OjsWIIs+iML
 oa8diGx2V58dHMRmM3z7FKM5O0qe/4YL3BmW0WUYw45uSQ6aqQ55XtETU g==;
X-MGA-submission: =?us-ascii?q?MDHMCWADl/mDVwGAMe5vtEVexayg170ya6xjXl?=
 =?us-ascii?q?IW0alHiF0iuGASDiJBnddr6l2pcYwiYtZ7Wmtc1eno9tAI/aAwJk98Jo?=
 =?us-ascii?q?B5nhQngIi1mYm2wioM6ext7aUaK3MoPzKKJMZlAt+Ht3Ph2yRcKk5tih?=
 =?us-ascii?q?RT?=
Received: from mail.sis.atos.net (HELO
 GITEXCPRDMB11.ww931.my-it-solutions.net) ([10.89.28.141])
 by smarthost4.atos.net with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2022 10:33:17 +0100
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) by
 GITEXCPRDMB11.ww931.my-it-solutions.net (10.89.28.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 15 Nov 2022 10:33:17 +0100
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd]) by GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd%8]) with mapi id 15.01.2375.032; Tue, 15 Nov 2022
 10:33:17 +0100
To: Daniel Kobras <kobras@puzzle-itc.de>, Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Topic: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Index: AQHY0q0xP3Tuh09CpEaQNbeEgtOwFa32NCKAgAaxE4CAAADrAIAcFQaAgARSbWeAIpE1UA==
Date: Tue, 15 Nov 2022 09:33:17 +0000
Message-ID: <29f2f344ce954367b65e54bac76bb2d8@atos.net>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
 <Yzsp/U5itUs486Ic@jeremy-acer> <YzsqwptGoGijMcib@jeremy-acer>,
 <5b08d4aa-2d59-b5d6-07ad-9cc40438aeb1@puzzle-itc.de>,
 <0698402c43a54ae6baf045e99e8c259c@atos.net>
In-Reply-To: <0698402c43a54ae6baf045e99e8c259c@atos.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.0.28]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Warn: EHLO/HELO not verified: Remote host 193.56.114.177 (smtppost.atos.net)
 incorrectly presented itself as smarthost4.atos.net
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
From: Michael Weiser via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Weiser <michael.weiser@atos.net>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Daniel, Jeremy,

> > Ok, I've just submitted the fix in
> > <https://gitlab.com/samba-team/samba/-/merge_requests/2763>.

> Thanks for your effort! We are in the meantime in the process of testing =
your
> fix in the affected environment. I fully expect it to resolve the issue. =
Will
> keep you posted.

As (hopefully) final feedback on this issue I can report that we've deploye=
d
the fix in two affected environments without fallout. One is running RHEL 8=
.3=20
with samba-4.11.2 the other RHEL 8.6 with samba-4.15.5. Backporting the pat=
ch
was trivial.
--=20
Thanks again,
Michael=


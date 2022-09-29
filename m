Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B025EF34A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Sep 2022 12:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=aLSvmb2kiKFQC/DDborU0eZSV6Z5HwqSn58O/cc+lO0=; b=yzCAdXTyeNXjEFTtDmZxmKx9sy
	WeBc4kDCEO6aw/l96LWNkf/2Ec570saJckkb4r1pHM8dhVl8GdNsptBd+EU0RRqmRpaVujM5L7Q9b
	6TA084KDgwqeV+L78JC1mf/YJBFFGGqupvYpU9LFrZeSwDNOe+Hm3i4AuUVAIsoduboM7pKL5eb3e
	jgHFKpFjU9sR4dnZ8r9V/4hw0zwPfel8FBgCRR+cqskGjSJGvuap7Y38MSIRXCTNw0qoqg3dyqE5v
	2XIW1+WVd6XVesgqoePC6qsfFC72u5blyyIY2GWQtvRS7pc17tYV9FgzUk3mIdgnY5ST/mmnplIAZ
	iHs5Xxcw==;
Received: from ip6-localhost ([::1]:19830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odqbW-004p9w-VJ; Thu, 29 Sep 2022 10:17:19 +0000
Received: from smtppost.atos.net ([193.56.114.176]:29760
 helo=smarthost3.atos.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1odqbK-004p9k-TV
 for samba-technical@lists.samba.org; Thu, 29 Sep 2022 10:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
 t=1664446626; x=1695982626;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aLSvmb2kiKFQC/DDborU0eZSV6Z5HwqSn58O/cc+lO0=;
 b=GQEpTAaiGCtMBGVeMGyvPi4s1NNws4pnma6qFhCSV2wfwRucYRc1wtnX
 otHGeLADpo6P8h4CB9M3uVXq9OP2xpAjbPJLiYWxhcXx5GL/J1Ac9hSoP
 8USX0oEw/UGZXS1/6JZvqakKNjvA2xsg6Pq7w41+vq2iS6udIbvMUgWvV
 0qif895emIfpEy4eCsvX5qCv/v8MOglkJmKkGpliyXkRwMT0sAr+1lD7W
 CfGoHqOuQyZAl2uRQqapuMi+GYK9Mqhh47TuTr7jqPGmMd+Nak8d7xCMu
 34ENWSgNuHBJaMh60cvMuKRUmUtyAgPpee0UfHnxETd0W+LIISmPKOWQI A==;
X-MGA-submission: =?us-ascii?q?MDHPIwxRAzHiHQHsXloyLYsQHsJ/TDeTF9TsNb?=
 =?us-ascii?q?XbyWG4CZkwZm4puAzrgV3RnR30IO+FSCHMUost+bzzIvsffeW3DJWM7I?=
 =?us-ascii?q?0dNhw2I3bOm3XVyaN3mNfJYWOOQXDqIKXpaAjpFvbkDnUPDlUBTLgUwL?=
 =?us-ascii?q?x7?=
Received: from mail.sis.atos.net (HELO
 GITEXCPRDMB14.ww931.my-it-solutions.net) ([10.89.28.144])
 by smarthost3.atos.net with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2022 12:00:51 +0200
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) by
 GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 29 Sep 2022 12:00:50 +0200
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd]) by GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd%8]) with mapi id 15.01.2375.024; Thu, 29 Sep 2022
 12:00:50 +0200
To: Daniel Kobras <kobras@puzzle-itc.de>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Topic: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Index: AQHY0q0xP3Tuh09CpEaQNbeEgtOwFa3zq9yAgAACE4CAAAJLgIAAAXoAgAFtPwCAAQ3o0g==
Date: Thu, 29 Sep 2022 10:00:50 +0000
Message-ID: <9ef5fdf14ff44bf6812c8ce709da26e6@atos.net>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
 <YzNu47xX9+j0BLKH@jeremy-acer>
 <1074acc48316978ba1fc5af74c7cd486fbe2ce0c.camel@samba.org>
 <YzNyDJ43AIAkUSTX@jeremy-acer>,
 <70e9c734-9c7e-c70f-4465-efa1946313fc@puzzle-itc.de>
In-Reply-To: <70e9c734-9c7e-c70f-4465-efa1946313fc@puzzle-itc.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.0.29]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Warn: EHLO/HELO not verified: Remote host 193.56.114.176 (smtppost.atos.net)
 incorrectly presented itself as smarthost3.atos.net
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Daniel,

> > Yes ! +1. Exposing other namespaces was the original
> > bug. IMHO we should fix for 4.18.0 and announce now
> > this change is coming.

> Even if there were someone depending on this, pointing out the bug in
> their setup and suggesting to fix it with a specific VFS module that can
> perform the mapping in a reliable fashion, seems to be the proper course
> of action to me.

FWIW, I can confirm that in my test setup this change solves the
original problem (as was to be expected) and causes no obvious fallout=20
with today's HEAD (commit 318da783e9df83550d86fcefcf89f55a77addcbe).

Reviewed-by: Michael Weiser <michael.weiser@atos.net>
Tested-by: Michael Weiser <michael.weiser@atos.net>
--
Thanks!
Michael=


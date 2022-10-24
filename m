Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62684609B59
	for <lists+samba-technical@lfdr.de>; Mon, 24 Oct 2022 09:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=k5Duj9LK3E7iZ/FhGQXlDLrhqmEfDy3TfcrcL/yhUZM=; b=Re6GU4Mow54ASQkXBQd5Lvs8w+
	+zOH6IMCV8aE4pmaHg51Pt5F5gJAwEVLiudvVFGtgC7U3twDO1rtOfxP4jvf0QBy1NjZ8T97SX2iT
	pxv0Qjp8AbcLeN8KD0KR85MW6R8FcIEN9YlPTUsu/Z+NfU3kHhp2LoY+exZiJAJeDwFFldr+qUP9f
	YZLbF6n9LMTH5t7K03vjAT3gwruCB68fKvW3Ti9LGynQXwFcCuM9j3yZujnn2yQxxo4qh8e9qROOR
	WoQeQnHuquWQF3az6mMIk9inloWba2NeGLvY4hcA2vOdbxFFevxQT9b7PfGCJ7kbUMoicJ+qC6j7U
	T3xxhmIQ==;
Received: from ip6-localhost ([::1]:36208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1omrvu-005G7E-Gl; Mon, 24 Oct 2022 07:31:38 +0000
Received: from smtppost.atos.net ([193.56.114.176]:21697
 helo=smarthost3.atos.net) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1omrvX-005G74-2n
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 07:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
 t=1666596675; x=1698132675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k5Duj9LK3E7iZ/FhGQXlDLrhqmEfDy3TfcrcL/yhUZM=;
 b=DAWkWpYjxlcksGrmiLqyzgOHQ3pFPChwMyQ/mMhJVc1nP7PBY32hP4sD
 NIz+dfzgQpKWtnc/JiGTH9oQPy+XQax/DO4tRh5SceVwaqfhbjA21KTvn
 9ah0KS9no6tkzRwb28YCJEOZELV3fGdpEB1KQyTQntVPnLR1Mr5JUYCUA
 Ge34/vWIzuuY62MSrn1d3WRBFPu4TaU1wEVViQFbeJ0+cjmcR+u9YmWRs
 QUiVSTKxCSn8BAoCALOZt5LEs4iZJGKP6nTG1qY7q2FQow4dfUiQNF34l
 Q7YeHwEgBl7YH41BlzKdXoftMdWvjhhjm1jPPkn6Hx8m/QAs5DqfHmMIn w==;
X-MGA-submission: =?us-ascii?q?MDHDJT6m0TatatLBDpb+0JPKhO1KUulQAWVMpK?=
 =?us-ascii?q?GT8ttsKElKGYCQdDvsM/knWuvuqELCkRWBRRyXvz3xy+AtPSSjYaKB/z?=
 =?us-ascii?q?GAp1wZdUVpE+eDR9hi66P9HcJu/M3bSvsZg31lPuB1aJXcRg89vpM0Lf?=
 =?us-ascii?q?EY?=
Received: from mail.sis.atos.net (HELO
 GITEXCPRDMB12.ww931.my-it-solutions.net) ([10.89.28.142])
 by smarthost3.atos.net with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2022 09:31:05 +0200
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) by
 GITEXCPRDMB12.ww931.my-it-solutions.net (10.89.28.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 24 Oct 2022 09:31:04 +0200
Received: from GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd]) by GITEXCPRDMB14.ww931.my-it-solutions.net
 ([fe80::4817:dcd:3f05:31dd%8]) with mapi id 15.01.2375.032; Mon, 24 Oct 2022
 09:31:04 +0200
To: Daniel Kobras <kobras@puzzle-itc.de>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Topic: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Thread-Index: AQHY0q0xP3Tuh09CpEaQNbeEgtOwFa32NCKAgAaxE4CAAADrAIAcFQaAgARSbWc=
Date: Mon, 24 Oct 2022 07:31:03 +0000
Message-ID: <0698402c43a54ae6baf045e99e8c259c@atos.net>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
 <Yzsp/U5itUs486Ic@jeremy-acer> <YzsqwptGoGijMcib@jeremy-acer>,
 <5b08d4aa-2d59-b5d6-07ad-9cc40438aeb1@puzzle-itc.de>
In-Reply-To: <5b08d4aa-2d59-b5d6-07ad-9cc40438aeb1@puzzle-itc.de>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Daniel,

> > Still, that doesn't change the underlying fix for now.

> Ok, I've just submitted the fix in
> <https://gitlab.com/samba-team/samba/-/merge_requests/2763>.

Thanks for your effort! We are in the meantime in the process of testing yo=
ur
fix in the affected environment. I fully expect it to resolve the issue. Wi=
ll
keep you posted.
--=20
Best wishes,
Michael=


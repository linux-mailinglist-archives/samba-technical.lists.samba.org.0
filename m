Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 749881DC2B6
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 01:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=acjRJneN9ETg+Lmiq1Gsr8qeqhbjaHP3P4Yk5qXIt74=; b=eftwQt1bFx7JTk7ripL4IGgQVO
	l5e9ZhjfnCWDjxbTEP1dMIOU+85g1zPNdKo8gdmWqRvGDFFVU1zQyJOAkB8qHXV+8nYOkpGrFLc5j
	yUOgzXmyQvMusq4RSmiwMEEmqcYPrOQeDPVZqiUQSD7jCNgsj+wS8t4eUaIspphIy1mHUHmTfcF1j
	irGolF22FQ1tyBmDl2rTYI7zgqE2pfMlTbXG80ntUhrcReJSo59JU4S8is9XFaYa8V1aApnIOvO/F
	eORZZC6T4w68Nl7u1QCk6N7PNhAR+pi1j6jIE2wmwHaS3MrgUTlw+CsKaj+B3NzAMemf43isyWBJq
	a92jBleg==;
Received: from localhost ([::1]:62720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbXuK-005JPX-IU; Wed, 20 May 2020 23:13:52 +0000
Received: from mx2.suse.de ([195.135.220.15]:55376) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jbXuF-005JPQ-Hp
 for samba-technical@lists.samba.org; Wed, 20 May 2020 23:13:49 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC064B242A;
 Wed, 20 May 2020 22:56:40 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Why use TDB and LMDB?
In-Reply-To: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
Date: Thu, 21 May 2020 08:56:32 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <164163B3-92D1-4A8E-80AF-1F43CE85AD9A@suse.de>
References: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
To: hezekiah maina <hezekiahmaina3@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 21 May 2020, at 04:46, hezekiah maina via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> Hi everyone,
>=20
> I'm still learning Samba and one of the question I haven't figured out =
yet
> is why
> Samba uses TDB or LMDB instead of RDBMS like Postgres or MySQL?

Throwing in my view here,

You have to remember that everything is layers. TDB or LMDB are =
key-value stores. Postgres is sql, but internally will have it's own =
key-value stores. At the level samba is at for it's LDAP server and many =
others like 389 ds, we use key-value stores because we are literally =
constructing a database, with a query engine, indexing and more.=20

So the value of postgres is you have a query engine, indexing etc out of =
the box, but they are not modelled in the same way as LDAP requires.

This means most LDAP systems basically have their own NoSQL style DB =
built on a k-v store.

There was a project in the past for sqlite to have lmdb as it's k-v =
store, but I think it didn't get very far.

https://sqlite.org/docs.html has some great technical docs on how they =
implement their layers ontop of a k-v store, and their architecture.=20

If you ever have any questions please let us know!=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs



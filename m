Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C770A8A8558
	for <lists+samba-technical@lfdr.de>; Wed, 17 Apr 2024 15:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zoy3YjMJIrzYEbtLbdQ7+KikEyj0xnTUqoqyF9m0W0k=; b=M3iPeP1ntwGG/B66fbZZDVNn4F
	wzgX9vGoXWRaJfJ7Salk485AYl3HGFvB1RJ0cNZLCmABOUtqEIHmwuS9Q7oBADrC74TeczV2n40Mn
	NsovQFQliVWjndbv/Y6JxwvIhITD8Y8SbfA08bzWmZOm58OhQniXGtZkKt04xCsCCT/iqE7H5w/ST
	8prhgl/fS9kGOgM37yZe+ysy6VSO2VSc3TTGVCnWi2BwulLPR0K0BiCnEjUBkziUeaEfTi4mmYP0A
	MKH30uE4Ja1WNdReVwGyX1bzCFb8xsiDaX2q8rwHgmnCj5uG5vT6KqJlDGddk+jlhP/rxG8DhTqes
	j6ZSTp1A==;
Received: from ip6-localhost ([::1]:19566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rx5io-004yPt-JS; Wed, 17 Apr 2024 13:53:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33006) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rx5ik-004yPm-91
 for samba-technical@lists.samba.org; Wed, 17 Apr 2024 13:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zoy3YjMJIrzYEbtLbdQ7+KikEyj0xnTUqoqyF9m0W0k=; b=d+KU26cFwFe3qfZNgAmhbGQ901
 ITXCiMvcArOnWSpTP7fbA08auPKqn10d9zC8khy5EqR1ZMa0nd8Fer9n27NEhQubX9252vd3gS8YF
 ziTYu7UbbeR8e7Mt8nSjSuA6GonHdoxtpg3+AnDJrA6+A0tscDsXdFqJe5BlT7IPJRyJFQSSHaCjv
 nMTyA7T59kLMDmlxYbXLbtDFU9SjPgcJzqx9xJsioPe001RKQL0x+sf3pP2SO5PVJ4W0flXZOL3bc
 avrlPd7Wj7BAmeWOvdJqh7MnNqPP/dxoT9AHwYgDrpfvkXIt6KZavT6fCamWrFGq3JXxb9V+cWPXY
 3qX4CJxhSFbDWlIYJO7yLEV+GQDo4ceTyOjBi3bhwj9sAh1qoD/1plumSd5PTM+QpT30A7Dbjw/NI
 b2wy/fF/E2MyxQGk05iHjJjqK1VfDstSobLkktQt9nDCpUXRS6P3v2tjXS+q0tCXZ6jkO5GF2NUsB
 8SlnxdahfXeKB34g1ARRSr7S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rx5ig-006tyY-1y; Wed, 17 Apr 2024 13:53:02 +0000
To: =?ISO-8859-1?Q?Andr=E9as?= LEROUX <aleroux@tranquil.it>,
 samba-technical@lists.samba.org
Subject: Re: Fwd: Regression: ldb performance with indexes
Date: Wed, 17 Apr 2024 15:53:01 +0200
Message-ID: <2680239.lGaqSPkdTl@magrathea>
In-Reply-To: <f09a03b8f405c2cc9a2e97df5576a927eb823cdd.camel@samba.org>
References: <4856178.OV4Wx5bFTl@magrathea>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
 <f09a03b8f405c2cc9a2e97df5576a927eb823cdd.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: yalemu@tranquil.it, Denis CARDON <dcardon@tranquil.it>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 22 March 2024 21:35:27 GMT+2 Andrew Bartlett via samba-technical=
=20
wrote:
> Firstly, these are very impressive improvements.

Hi Andr=C3=A9as,

I agree, this is great work.
=20
> Thanks so much for your work debugging this and getting to the root of
> the problem, this is very much appreciated.
> Do you have any data on how much of the improvement is due to ldb
> patch, and how much is due to each of the other patches?
>=20
> Did you happen to use Brendan Greg's FlameGraph tool for the debugging
> (this is what we often use), and if so, can you share the graphs?  I
> want to understand if perhaps we need to consider restructuring the
> caller.
> https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html#Instructions
>=20
> For this series if you could please:
>  - send in a send in a Samba Developer Declaration per
> https://www.samba.org/samba/devel/copyright-policy.html
>  - create a gitlab account
>  - let me know the username
>=20
> Once I give you access to the devel repo, so you can run the full
> testsuite under our quota, please follow our contribution steps here:
> https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_(an=
d_c
> omplex_first_requests)

I didn't see a merge request so far? Any update on that?


Best regards


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




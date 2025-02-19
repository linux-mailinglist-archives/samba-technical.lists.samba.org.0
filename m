Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B01A3B1F1
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2025 08:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iiSrrcg4Te9Fis5n2NmIny+W6rTA9xbYSd0dfxCN948=; b=B6jmP8qAWZsgUq5EhYTlv44lUn
	jO4cLAuAlONwSJasE8AONStAzfE6ABbfpaiWnaGvCImFrOYeeHuh02GpBsVj5Jt0H2fIIHar9oiOZ
	ktkIMUmJFuerau5B9Nsg5n6IM9DW1kajbNiaI0O3Fet0BJ0qKAw/JCt8Vg6qQh5mK48h+S7goYIvX
	wa43uuRQ2H7jQSSxVX9XWJZm/ZHLTkCf+VWEYT4BXGxC8TUqKhGUDTFvBqO5D/bdv8kLYkOR4Vi5k
	rpbIuo7NFCbgpbuz+KsPOA9XGv04saL/htCPSQBduuTk1cIM9rd7eSMzKmw8mn3MQgdY3T1GjmgTW
	PNEGfhaQ==;
Received: from ip6-localhost ([::1]:19656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tke8G-00CnjD-Pj; Wed, 19 Feb 2025 07:04:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29014) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tke88-00Cnj6-FT
 for samba-technical@lists.samba.org; Wed, 19 Feb 2025 07:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iiSrrcg4Te9Fis5n2NmIny+W6rTA9xbYSd0dfxCN948=; b=dygrMmxLoli2yrqdKE18kMi4+2
 ewV+bHflow8arLw80vq/S+EvE4qgqgY3y7xB4iZs7JRaR8UqhSnLEbICiaj0P3cfBMv0R3pd4vJNF
 25hoxR4cB3rTs0yv8hb35r3hDJ5QAMqzos+8hyNBVvBYz/in7NnbkmVsYxEbzUDWLPlKJCB75bKnG
 6FTnen+yaCnsDdQSMr1BKRug0JvxXvxzAzjWMUFBpugNF1nLU+0QfzD/QSRnq3+TLQmgQVYbt5JTM
 UagYekGaFmkybo11l2bWdhdRyHcEY5SgeEwJjSB/0CaCDBbavVtZwz7I2GMxyeKh+y/4/8BxKD4Yv
 ir5MhQUmHrAQ5h67gY2KpiJE51xAidzY8pINcrVb7LrkD3tJqQz/yjyi87hdmsrODvCEFKBH8EeUW
 cYNbi+LLiJwWV0NkPXHxRhPiaKG4G/UIMAxjsFyO1esaA13nubnVQVj6+nnJCoZPMKr19PKz8KcYP
 IMYrUaqqUAa7jboh8R0ddq5a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tke7v-0013SS-0d; Wed, 19 Feb 2025 07:04:11 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: get upn from winbindd
Date: Wed, 19 Feb 2025 08:04:10 +0100
Message-ID: <6081286.vXUDI8C0e8@magrathea>
In-Reply-To: <6771289.rdbgypaU67@magrathea>
References: <1739859798.356583592@f141.i.mail.ru>
 <6771289.rdbgypaU67@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>,
 =?UTF-8?B?0KPRgdC+0LvRjNGG0LXQsiDQn9GR0YLRgA==?= <usoltsev05@mail.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 19 February 2025 08:02:23 CET Andreas Schneider via samba-
technical wrote:
> On Tuesday, 18 February 2025 07:23:18 CET =D0=A3=D1=81=D0=BE=D0=BB=D1=8C=
=D1=86=D0=B5=D0=B2 =D0=9F=D1=91=D1=82=D1=80 via samba-technical
>=20
> wrote:
> > Hi!
>=20
> Hello,
>=20
> > I want to receive upn in winbindd, but I don't know how to do it
> > correctly=E2=80=A6
> > *  The first option is to make edits to the SAMR protocol. It works, but
> > it
> > breaks the protocol itself.(samba_fix_1_samr.patch) *  the second option
> > is
> > to receive upn via a direct ldap request. It only works on samba DC, wh=
ere
> > there is a sam.ldb database. Winbind does not work on
> > clients (samba_fix_2_only_winbind.patch) I made patches for the
> > commit a814f5d90a3fb85a94c9516dba224037e8fd76f1(Stefan Metzmacher Feb 1=
7,
> > 2025) on master branch.
> > My config  /etc/nsswitch.conf:
> > passwd:     files winbind systemd
> > shadow:     tcb files winbind
> > group:      files winbind systemd role
> >=20
> > Test:
> > id   user1@test.abc
>=20
> I think this is the wrong approach. We should actually rewrite winbind to
> not pass `struct winbind_pw` around, we need `struct winbind_user_record`
> and convert from `struct winbind_user_record` to `struct winbind_pw`. See
> the discussions in:
>=20
> https://gitlab.com/samba-team/samba/-/merge_requests/3805

Wrong MR sorry.

This one:
https://gitlab.com/samba-team/samba/-/merge_requests/2928


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




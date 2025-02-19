Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D25A3B1EE
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2025 08:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Cx3OVHuOd14qHGvXbbX/r/H4taxAO/pCBWrXbYwX+ao=; b=5EgaEl3+JAsX3O7YAXfcPfTce/
	tfCHB7fgZCtvBDBAzcUngEsj45aUTCf5zSr747eFfi/pWB43MxK2IFv6LSBNe1MHGwuiLnhOEcuCT
	wSvKwwj2R1ItSXCp8iDlG1+O9q/LSo+LxdwthylLdUEVCwhlOpwzU40q3kqMzZ5KFN3gez3BEzjbE
	20zHnQENBX0cNKFWgG+9I1kPldhHdt/yjQ2TEGJwv9n9WxSrr9xCZn79dsM2QxCU/KSPcckZMwSV0
	JdjjObtxa6TaAj9r37+gNNZ+KjljmHLr91T0R8Irk3T8wFhk5fhTrHNrLFV6CEibEml0Q5VYWq78L
	82kUlm2Q==;
Received: from ip6-localhost ([::1]:59362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tke6W-00CneC-58; Wed, 19 Feb 2025 07:02:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63880) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tke6P-00Cne5-Jz
 for samba-technical@lists.samba.org; Wed, 19 Feb 2025 07:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Cx3OVHuOd14qHGvXbbX/r/H4taxAO/pCBWrXbYwX+ao=; b=FeBh0BPQN/oGjqrXVvQywZZTng
 n2ula3Jsn/dKxPTagRXq2u2brHzZk3exNqAckk5SXf8xS3zuH1n0IaTpWV2RkJPYR8RzW3eiSJlsx
 WhsNDrXGyyQrhpecvBIuyhkFNFn7c5pPu66M2p2YqX4dbve1lnJU1qmT9KhoQMsAlda2oSt8xBUMP
 mkxOzu6z7iKRyjP6Pp5fzAkrXZx/Sfy+jQwH+I9OgO6b2TOS2QHF6oslZuk5rny0vSaCNG+wMBkX5
 2JSqatcxqDEuYdNFahUJoUmXfZ7KpUgtcPr82z74kw5/AZg1eYQa8Q6gjg+8+vTArYp2fG2TJLdux
 aYQW6GC3GrDovD1yl1jpjQsJf1/GpptXHMFINgrhU+HI8EImTvVjlpsTrOtP9Ac3D1pqO65/xEMyA
 iWH6cKnkyu36TfKbHK1ROmT0RPO9dbW2Ppzupu0Ms02wCndNf8WWtwAcBIevcVqOew9QWtNrK+6Qq
 8kk9E8mroSND1wbiNyvEw+mb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tke6C-0013OI-2I; Wed, 19 Feb 2025 07:02:24 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: get upn from winbindd
Date: Wed, 19 Feb 2025 08:02:23 +0100
Message-ID: <6771289.rdbgypaU67@magrathea>
In-Reply-To: <1739859798.356583592@f141.i.mail.ru>
References: <1739859798.356583592@f141.i.mail.ru>
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
Cc: =?UTF-8?B?0KPRgdC+0LvRjNGG0LXQsiDQn9GR0YLRgA==?= <usoltsev05@mail.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 18 February 2025 07:23:18 CET =D0=A3=D1=81=D0=BE=D0=BB=D1=8C=D1=
=86=D0=B5=D0=B2 =D0=9F=D1=91=D1=82=D1=80 via samba-technical=20
wrote:
> Hi!

Hello,

> I want to receive upn in winbindd, but I don't know how to do it correctl=
y=E2=80=A6
> *  The first option is to make edits to the SAMR protocol. It works, but =
it
> breaks the protocol itself.(samba_fix_1_samr.patch) *  the second option =
is
> to receive upn via a direct ldap request. It only works on samba DC, where
> there is a sam.ldb database. Winbind does not work on
> clients (samba_fix_2_only_winbind.patch) I made patches for the
> commit a814f5d90a3fb85a94c9516dba224037e8fd76f1(Stefan Metzmacher Feb 17,
> 2025) on master branch.=20
> My config  /etc/nsswitch.conf:
> passwd:     files winbind systemd
> shadow:     tcb files winbind
> group:      files winbind systemd role
> =20
> Test:
> id   user1@test.abc

I think this is the wrong approach. We should actually rewrite winbind to n=
ot=20
pass `struct winbind_pw` around, we need `struct winbind_user_record` and=20
convert from `struct winbind_user_record` to `struct winbind_pw`. See the=20
discussions in:

https://gitlab.com/samba-team/samba/-/merge_requests/3805


Same for the groups.



Best regards


	Andreas


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




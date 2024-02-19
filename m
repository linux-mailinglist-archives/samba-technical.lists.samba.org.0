Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6385A9A5
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 18:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ILmugOJsPjZGu+rPMvV1CtmTLgSPCSyoO4oW983DEZg=; b=gO9pHciRSbVbqMqVHRiMYTiLm+
	qH2lmBRJdh9UkSNn/aeGjKXmDeuou6hJfMJaZwH0DJ+OiC5AO7y5s+q2gaaF0rrH3N9UkiZf/3rK3
	GCEQFRXQedGMxI8RpSCxdMhXMsecgRDReWzELoTvG+ci91mMKagH8hBInE8XWxXs2RB0aMzirarWv
	d7Xin+1IBE+wiMa6yJjzntE8mQW72ODKwI4NMd6wFpicGYJkTgfNKeRS9B6TH7lpkSbQpYCTek+7k
	ox95wYkJuDKZ07Y3+XBY7hz3tPc5JKFBgdGfYDiEmpZXk+tv6GrpqKkQx9HOIS9VShECJGDlAHJg2
	5/BBp2sw==;
Received: from ip6-localhost ([::1]:56608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc7AH-008vi1-3T; Mon, 19 Feb 2024 17:10:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18294) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc7AC-008vho-Ic
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 17:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=ILmugOJsPjZGu+rPMvV1CtmTLgSPCSyoO4oW983DEZg=; b=xNw/dJ66IaG4yon7UgqJTGdAeE
 sGCWoyk5qZzlxEwD5oBgJVAvEhoj2ibT5C5YvooSL2UZ0njSJACNfbB6K/OJxp1I9VOtjx4roHu37
 npt+PwKhD4KVy8MKoJ/BdbPvWD7QtvP3qUf6vr5tKR5hKJ/KTWotbh3WHs/VaL4bqgdekNZxkDw6W
 oTEunn9Pem41hA4lv2kI66UWyzH+SGchIl5sUfaNakKavDYL7Zjmf79dSIwePA3jhSws25m7XfZbD
 GqsLbKbT2VPKECMFmpPNXxzMu17zhIddOKEFgLPAj4N5fvP7B4yQS71WyK8rDjRI7XnHf7Cdb/j6X
 M6dfJioQWzYLn0X1F1LK24KT20WStsFQIXgDdhSfD8FDgwXnJL2VwAtZPLN1NkTqd58W4y1UoF5KW
 JGWu3CD2GdLnmgoKWRgrfE55rBPbNdFDvEj6DCp5OZrJQ5QoWTwjse46hxfFyooXNLMCK7yXtvnIy
 /baasUMu0DCFHROGMpIO5H6P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc7AB-00DovR-2t for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 17:10:44 +0000
Date: Mon, 19 Feb 2024 17:10:41 +0000
To: samba-technical@lists.samba.org
Subject: Re: setting up authentication policies in 4.20rc2
Message-ID: <20240219171041.1608c9b2@devstation.samdom.example.com>
In-Reply-To: <0dab2318-4326-4874-a29b-b64f2a5e552e@kania-online.de>
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <20240219164507.6a37e945@devstation.samdom.example.com>
 <0dab2318-4326-4874-a29b-b64f2a5e552e@kania-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 19 Feb 2024 17:56:45 +0100
Stefan Kania via samba-technical <samba-technical@lists.samba.org>
wrote:

>=20
>=20
> Am 19.02.24 um 17:45 schrieb Rowland Penny via samba-technical:
> > On Mon, 19 Feb 2024 14:48:06 +1300
> > Jo Sutton via samba-technical <samba-technical@lists.samba.org>
> > wrote:
> >=20
> >> On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
> >>> Hi to all,
> >>>
> >>> I just tried to setup authentication policies and authentication
> >>> silos in 4.20rc2.
> >>> Following these steps:
> >>> 1. create a policy
> >>> samba-tool domain auth policy create --enforce --name
> >>> winclient-pol
> >>>
> >>> 2. create a silo
> >>> samba-tool domain auth silo create --enforce --name=3Dwinclient-silo
> >>>
> >>> 3. adding a at least one user and one host to the silo
> >>> samba-tool domain auth silo member grant --name=3Dwinclient-silo
> >>> --member=3Dwinclient\$
> >>> samba-tool domain auth silo member grant --name=3Dwinclient-silo
> >>> --member=3Dpadmin
> >>>
> >>> BTW: In 4.19 it was "silo member add"
> >>>
> >>> 4. Set single policy for all principals in this silo. with 4.19
> >>> that was possible and that's by the way also possible with a
> >>> windows DC. That's on a windows DC called "Use a single policy for
> >>> all principals that belog to this authentication silo"
> >>>
> >>> In 4.20 the option --policy is missing, you have only the option
> >>> to add: --user-authentication-policy=3D
> >>> --service-authentication-policy=3D
> >>> --computer-authentication-policy=3D
> >>> So it would be nice if the option --policy will be back
> >>>
> >>
> >> We removed this option in commit
> >> c22400fd8ef961e472ce2803cf4a2ec58b778795. I don=E2=80=99t remember our
> >> exact reasoning, but we must have thought that it didn=E2=80=99t make =
much
> >> sense for a user and a computer to share the same authentication
> >> policy.
> >>
> >=20
> Hi Rowland
>=20
> everything about auth-policies and auth-silos is a bit complicated,

That might just be an understatement :-)

> it could have been made much easier ;-) I try to explain it again how
> it works in Windows
> create a policy
> create a silo with users and hosts
> add the silo to the policy AND add a condition
>=20
> The condition is the most important part, wich is missing (at the
> moment in Samba) the condition defines if only access to a host is
> allowed for members of the silo or only for non-members of the silo.
> I tried to explain it here:
> https://www.spinics.net/lists/samba/msg181014.html

I am going to have to consider that, my eyes glazed over.
However it sounds like a variation on allow/deny.

Rowland


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A37879D93CF
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 10:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=71Gr8wBkLLDz1D78Eqo4z1BowPSc9rQeAqZI3SO7/Q0=; b=ci27iB+hjfugNhr8zFoCF32N9+
	8qW/1HLIfWqlmgcQwsIRHqwrgdLboicbgHrdsZ1PImGSK5LQcnmNrzjdzHSbsgxO5xHSWHpvFgkW2
	JGI5dGqN8X7Qc9XdSq3nvTkbACXxoVNb8JPjNguLLxGhUIXi22mHiPJ0GFrjX2/0BsD/irGA/AgS8
	K7+FqlTmO0AYfE7rqQxvWLIj98qBl32W4QKNiJbwnBR3hzO7Pe2xt0h8UdW8QVTkUlEcA2VKBny0N
	85fuPo6B01Dc/UHCpUg3Xb6l5PTvxSQWg1ULkpHSaQklGI4FiAcVzbMQUZrTrWx1P7Uobf1hhbQP7
	loVYTmpg==;
Received: from ip6-localhost ([::1]:21812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFrYR-000q1R-A9; Tue, 26 Nov 2024 09:08:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28944) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFrYM-000q0x-0z
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 09:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bLpkOIJ6qCidGb1xkcZHIHLYhTjT/BsvUPLQx3IlEho=; b=UtzutZUC+jVHhbU1nYNEKI2ST+
 aC0RMeNKOi7gfZI/y1DrtgQ8EHrsaCLv94xOi7vSn+XIH46wuMtsNGlaGDzt8tsaNGegcOkTrNYMh
 4vlKX92hu64iiTs1Wv0ZXkS9Yagbg9Tj8lcy3FV9bgISSluf4TYRbMhdyHH+1CRmKh4/DuBFFTPQb
 KsSZnrvdQ+l3r3wn48kRLb0whtHbmEo+mvST4xyfKZz4LRxPEbb5IkfFHDvfDIiIfKVksGjjmNmSo
 ppR2OcGpJrtaYV6Jb1M9haMEyEb9z+XEbMDLl30Kxs4pOi4DboeJ1lRXeWI/zTC/dWWtlZ9pDy47/
 uYbKnKP9Csqgc0SehX2mKWapWGsDbFSJ3rGJxz55KzOZZCtrgUqrERqhrZLZGs2L7IDcywdWaFgEC
 RE0Lnn/n5rhZb8WJOjK1BsCdqiJB4pwDpd758wclgX7ZjLG1neIQ8CPfoLWx1AwaiURcvbS8Rev6h
 9Fp8NG4/f/NxJDXIQubV9LlW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFrYJ-001W3n-1D; Tue, 26 Nov 2024 09:08:11 +0000
Message-ID: <7e3dcea1759b018784ca9041c9e378ad7ca3f285.camel@samba.org>
Subject: Re: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm, is this
 familiar?
To: =?UTF-8?Q?Ond=C5=99ej_Kuzn=C3=ADk?= <okuznik@symas.com>
Date: Tue, 26 Nov 2024 22:08:06 +1300
In-Reply-To: <Z0WJWF0sWSFbAy4E@ketupa.mistotebe.net>
References: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
 <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
 <Z0WJWF0sWSFbAy4E@ketupa.mistotebe.net>
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2024-11-26 at 08:39 +0000, Ond=C5=99ej Kuzn=C3=ADk wrote:
> On Tue, Nov 26, 2024 at 10:41:12AM +1300, Andrew Bartlett wrote:
> > On Mon, 2024-11-25 at 16:08 +0200, Nadezhda Ivanova via samba-technical=
=20
> > wrote:
> > > Hi team,
> > > An OpenLDAP user encountered this issue, and since Samba also uses
> > > Heimdal too, we were wondering if maybe it has happened in Samba as
> > > well and was fixed? Do you think it is something that can affect
> > > Samba? There are back traces in the issue but no steps to reproduce,
> > > it seems to happen randomly in their environment, and we haven't had
> > > any feedback from the Heimdal team yet.
> > > I could not find a relevant issue in the Samba bugzilla or the
> > > commits, but perhaps one of you remembers something?
> > > https://github.com/heimdal/heimdal/issues/1189
> >=20
> > Samba strictly avoids using the Heimdal SPENGO and NTLM layers, only
> > selecting the GSS-Krb5 mech to use our more mature internal
> > implementation and so avoid this kind of issue
>=20
> Hi Andrew,
> thanks for coming back to us, are you saying Samba got rid of the MEMORY
> credential cache as well, the suspected culprit here[0]?

No, just that because Samba has done NTLMSSP since almost forever, we
always preferred our code that we closely tie to our credentials and
authentication stack over outsourcing that to an external library.

Any issues with the MEMORY credentials cache, if not just a matter of
how it is used in NTLMSSP, could still bite us.

> Also are you aware of a way to control what mechs are enabled/disabled
> through configuration?

No, we just don't call any of the mechs that can choose other mechs, we
just call directly with the the gsskrb5 OIDs.

Andrew Bartlett
--=C2=A0
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba


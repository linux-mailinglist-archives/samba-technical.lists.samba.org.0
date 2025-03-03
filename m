Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819AA4B58C
	for <lists+samba-technical@lfdr.de>; Mon,  3 Mar 2025 01:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Iuff80Tl3Kul5nuhD9wDj6kP1OZOnGuD1I+h4SNFFyg=; b=wngt19HDERz1n5EWPYeHuu6yR9
	bZ9TdYtCOfWF7Po5dvRMhvVaw1nTEdTp/aD5IMIU9heA+K4RdiLf9iScSAjG1VFMtx561IGzHJSml
	P33x4gC9DQTS0WQMDLA4W1k37ZksseI29yGrpUPUomoDvWaRN0L8DoNM9rOxxk7h6U9/Td4yy/KFZ
	GPcI7IXxLLPzVwKXR8scYacqqjFoLi2NJbG4ZdEPgsb2k1h3p6D1wXso1nwCv0eTsPoV+sn1lMosl
	rcFGsAcFE7lrJc+kfL9FD32uUprso8UY/iaUylVIR9FuV6hu6Iv7vFcNQO+QpBHr+Penff4biAPxf
	KhdBO0gA==;
Received: from ip6-localhost ([::1]:32630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1totH5-00FSDi-ST; Mon, 03 Mar 2025 00:03:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11074) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1totH0-00FSDb-Pl
 for samba-technical@lists.samba.org; Mon, 03 Mar 2025 00:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Iuff80Tl3Kul5nuhD9wDj6kP1OZOnGuD1I+h4SNFFyg=; b=rB30Gfwad6+7tT7XAUs4O4sH3D
 1V5nJPrnwWwOM9BnvAzTBDPMprT4zZpEGcRvNWOwu77ir08WwpXSG4jYm1uK6zr66YFC8bj1hf8Gw
 BJZ6z5eRP4uPZ4UcpMBZn2V8KNT6MEph1+wb2kWb5O2VGDqUHrmQrwE9rObyTS1gp8HNckqEE5gMa
 VxUoC4m8uN6AzZlj6wVMKapY1R0na9z+/Qp3HFFD6QX+rTO1xmrbIg3b7T7EoJpIxjXlX//nrcp6B
 ZiI5xE45fzl3jYft6fZ8veS1ULQasznn+5qqRISj2gC/HCIeLebf8zscNOI4Z2CliIR4dVR9ij/kK
 qG4sbEO8NxLTN9YBHyuHBLUTX268Gu2OOehID2XdKM+R7QW/tCpBPhVutveLnw3E2HAQrftxuDkUZ
 uLbRvFpK8EcSV9p2diYYA7Cqfjas3uYcmk8ou1cCRT3u8nZK602cSuyMNBH6ZWVTVSRz5ShqOZ00o
 rDqjvkk1rBki42FfSoaCACiw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1totGy-002z9s-2g; Mon, 03 Mar 2025 00:03:05 +0000
Message-ID: <2f7c5128a9b562a3b79011c74303a9e3415bf6e9.camel@samba.org>
Subject: Re: ldb sqlite backend
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 03 Mar 2025 13:03:01 +1300
In-Reply-To: <e21773e7-9e6f-4b1c-af21-73e52566de91@catalyst.net.nz>
References: <e21773e7-9e6f-4b1c-af21-73e52566de91@catalyst.net.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2025-03-03 at 12:35 +1300, Douglas Bagnall via samba-technical
wrote:
> I quite like the idea of the ldb sqlite backend, even though I don't
> exactly know what the idea is.
>=20
> But it is very dormant. The ldbedit man page says we can use
>=20
> =C2=A0ldbedit -H sqlite://filename
>=20
> but as far as I can tell this has never actually been true.
>=20
> We have been dutifully maintaining it, but it seems to be over
> 15 years since we made any effort to actually improve it.
>=20
> Should we perhaps just delete it?
>=20
> Maybe this is a dangerous road to start on.

The primary reason it existed was because at the time TDB did not have
transactions, but SQLite did.=20

I think it can be removed.=20

Andrew Bartlett


--=20
Andrew Bartlett (he/him)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://s=
amba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


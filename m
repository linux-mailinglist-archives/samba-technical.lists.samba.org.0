Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8E60D2C0
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 19:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nfXsxoVmwPM6Uy9MMlefcFNkuZlxDygaIFca8gsu/q8=; b=QqN4t588i1jJTlNgqwzt/s970C
	O3TGcnrYME2PbX183F+pgVwT5IAPZCbfXz1Q38+xLuAJziSwbv8C3dt0hQ34pRvMqAGIIYKCLbpoP
	84p0Uh0lbCEMeE+w00pCpCSZ/b7CnoqqfHHMWZ8gOycFUZwCN/YLgu4VnJaxx6gjfdIQkZfM2e8Xq
	3lipusc2pm2C+CkRj1TJ/wuMtTqxPY5OqkeDCjjhbXACPycU0gib84SWODhVxSOim3BpCqEWaMUWz
	uFCM+JIVkS8+VQSTRddDOf96DUchvpIhSApUWZC8OR33kkBWTrkSsNDtV4WHAuj2xP3Z4Mm++akYC
	TZh29+fw==;
Received: from ip6-localhost ([::1]:20666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onO2Z-005zr0-Vq; Tue, 25 Oct 2022 17:48:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onO2U-005zqr-O4
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 17:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=OcSOMixXA91OyordbKt7HxhQbDkOrk9IufHN689zl7Q=; b=nowXbWbZGkxduHlR+7RmhZpvT2
 Fq4nZlSejRdcSFtownreUY13wNTF2CD2m7qKSM1i08sO1Qm1rq+meAJEP/0D8fGOlAIWDX71v7QlI
 IgMsVvSeae8xit3hBE58wK5Q+ouBsjM9gxqWow+41v0WkI0GGYVN5H5fPa2zbQB/nCKJmCOXF4AS4
 VcN+BkRLu/MSsX7w/RlphfUecp4nkhwS4+NLVG2cWUsTOh5+RvnK4li14KmVzZpPZw9Bg4oQaGo7J
 hGTeXlKZ+oHY0XYc/CG9hxYLH/3MUvbnJFwzyQ17YpK06DKzjsE2u+WI8L01h7ckZUd6+/cORTskw
 S2JOe6UCv1CrVScHZeyxAHK5s3s/TM6erzZBi2vDr2LMuop1NPQi0SYkcrVj3f4hRj7gwkQrR0VGk
 6Xeh0W1D7KpRZ3BjZWQ/9FV6kLK6k8Zn41YTaBFVh2WhSoDLM3uzb/ahr5IZ2TfT53Ar2h4YHBcA8
 ix6P6SXh5dtbppK+la2gOm0i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onO2T-005leF-JT; Tue, 25 Oct 2022 17:48:34 +0000
Message-ID: <156cb87f2e0ef9c6c3ef86fd9bee3fa5b874be53.camel@samba.org>
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN
 protocol too?
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Wed, 26 Oct 2022 06:48:30 +1300
In-Reply-To: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-10-25 at 18:45 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
>=20
> When trying to use current smbclient to connect to, say, a windowsXP mach=
ine
> (which implements only NT1 protocol), smbclient has to be told to use low=
er
> protocol version than it's default - this is intended.
>=20
> But the thing is that it doesn't work:
>=20
>    $ smbclient --max-protocol=3DNT1 //testhost/share
>    Unable to initialize messaging context
>    protocol negotiation failed: NT_STATUS_INVALID_PARAMETER_MIX
>=20
> Using -m/--max-protocol=3DNT1 *also* requires setting another option:
>=20
>    $ smbclient --max-protocol=3DNT1 --option=3D'client min protocol =3D C=
ORE' //testhost/share
>=20
> This way it actually works.
>=20
> Can't smbclient either warn about this situation, or better yet,
> lower its min protocol automatically if it is greater than
> the requested max protocol?

That seems like a very reasonable request.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba


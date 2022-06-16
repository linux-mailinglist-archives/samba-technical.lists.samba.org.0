Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB554DE09
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jun 2022 11:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=adPdpOyTKO0NsIBy4YKTGJX3lPBOWip1EErjwLprVIc=; b=0Tz4BMzj3z1fya+4uNOKumWpIV
	Xl0Zy/xT0zBaozEu5IaSp35KhUkTEAfjSxISyDoLjo0Nnkg46tR0CHyNL0IxDSzZ9bvYEUwFBW4Go
	uAgxVONRaLYr0RtgzqnWZX7x3KOTIblDJ/evNulpVZ9PPKLGtNi6IofaR337mMnsqVSKnnA1cnRCn
	80ibBki/2xjUk5ycqT4zNMD3AEhHJEH+V507dandFMv5IOdaYIi7CRiw4Hajy6YMuoqDrFg0Nx0+3
	znM1rpg5PptGCIkudFnEX44LKt6hQs9Jro8RUpS+StX6O5A5IZluzY2jrEGp0LkM5hGLh0du39HqX
	BrE9np9Q==;
Received: from ip6-localhost ([::1]:48546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o1lem-00Acpe-DQ; Thu, 16 Jun 2022 09:19:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33170) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o1leh-00AcpV-F9
 for samba-technical@lists.samba.org; Thu, 16 Jun 2022 09:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=adPdpOyTKO0NsIBy4YKTGJX3lPBOWip1EErjwLprVIc=; b=j5dnboePVbXammSHa3+te4cerH
 S1ktRz7VEXGrsObBwfsBUzZJxEeZgQr28/xomYzaAiWPlFqA5KqevpHujmKmIdXBEhhuxkbdYsB6S
 zX8wF8bX1EquJJublTx3NVsp6ATyltv1TBmlvUhwWML3u/Xink7glRQIc8xI/URfN7nq1SYXwzwJC
 K7XxIhwUJpZH+9jad7cC46JYEcAOR+70i2o5DEJWMW8LLCctrjkEWIW0RoV+Ybe74m4jkEDawjEBp
 JFcZCbLBYmMkz6kDN9t8etqgKSxYFPJ5qQUlDq5WW9djkPrXn/MDeAXXEJXfli5BSZHCk/TmsJaso
 nt7+RwsFb3GPMn4Bs+0+ScMbbBp/Qf5EIkaeDw7RCP3yUlonJjVNVFTwnMg9ETKZ5ty2BI0N0Lm/P
 +0ed0ILqfLpT4ftpTjylykM4Yke1VBrlKMZ5g0kqyHXzdMjhuqDffNhdI9O8iBh99tQ6xVDyX13S+
 zdtMcF5bKxajgReOM/pWdlNa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o1lef-0005bN-C9; Thu, 16 Jun 2022 09:19:10 +0000
Message-ID: <193ada71d4831cd715ecefe2f69d16e31beb6399.camel@samba.org>
Subject: Re: CVE-2022-26809 (MS SMB CVE)
To: "V S, Nagendra" <nagendra.vs@hpe.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Thu, 16 Jun 2022 21:19:06 +1200
In-Reply-To: <PH7PR84MB19838ADADB313719212BD4BFF7AC9@PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM>
References: <PH7PR84MB19838ADADB313719212BD4BFF7AC9@PH7PR84MB1983.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
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

On Thu, 2022-06-16 at 07:16 +0000, V S, Nagendra via samba-technical
wrote:
> Hi,
> Couple of months ago Microsoft released notification for CVE-2022-26809. =
Would Samba be effect by this CVE?
> The CVE score is 9.8. With very little information in the public notifica=
tion, couldn't tell with certainty if the CVE is relevant.=20
>=20
> Thanks & Regards
> Nagendra.V.S=20
>=20

I looked into this and it looks like an integer overflow in RPC
fragment reassembly per https://github.com/websecnl/CVE-2022-26809

While it is possible, it is unlikely we have exactly the same bug (we
likely have different bugs...). =C2=A0

I looked at our code in this area and we were well guarded.  I couldn't
find a way to break it.=20

https://gitlab.com/samba-team/samba/-/blob/master/librpc/rpc/dcesrv_core.c#=
L2298

As an aside, it would be really awesome if someone could fund an
ongoing project to look over all the CVEs from Microsoft each month and
at least write them up in the way you ask. =C2=A0

We can ask DocHelp for what the changes are, but we need to know to
ask.

Thanks,

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48585A932
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 17:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WsTZKtubtoIfn+ut+n+5Pf+8S1Y9Lyg2sFx0FCzNCZ8=; b=dnW/y7+4TDCzj562dXfhWP2ZTo
	26et96w5HddDiY8jtCv+MIn0UgPa0zuv/GiAYRUWLprSgkjM7l5ozMW7LF/XzdEzZZntse1468mnz
	nJEfPwIud+x+J7avmzJq3QKk3ZGKyS3X58kjI4p7lBmm7ci3CLmEtAzxIiE32W3vjigvwrROrTgME
	5oac9fS6rdi2Gy+f0K/r1TMiNEAZGujHzp4VJQqpImPhAYNxTfot+68j7K6uahzn0yaqRs5kd1zJA
	No/uqX8JuYXHHoDuKZp2xJqxjS30bKc1+cxnk8xC0HAr7BXPrbfa7QH9fddQCgmXDrYshzJm3+RZc
	whqtyfxA==;
Received: from ip6-localhost ([::1]:50434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc6lZ-008vRJ-E8; Mon, 19 Feb 2024 16:45:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27406) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc6lR-008vRC-MI
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 16:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=WsTZKtubtoIfn+ut+n+5Pf+8S1Y9Lyg2sFx0FCzNCZ8=; b=qlmyiEoqCZU0KszD+8EUMNzlJL
 Cbo5yN8O0uXoYvXgMrOUTQUoeHftkO8URbrWNwL+l2Uq1fW6hPWMxYTLAKGPGG8yf5X0lYpQ1VdPL
 RNWSQDe7jSLAh7dKdu4dVmbC+29zwQxCWX1XbmfzawII7UoOrLzVbAcYRjvwbmRXzK7+Qt8FnLnca
 yJcSHVNkA+9Y6T4Abn9ejtE9iEondhLXsiQO8eRPUMS1y1dqkQOqJlHNEOsTijCXx733lGe+CBkNf
 vZNK7jN29bT+XT/YRGyROCZdpTx6PFGZfaulqn7zqC/lmwCzx/jjACTmxVGjLJse8rgN5r/t/fQ6i
 OfEHSVx+K2daor6ay8JDA8vp62CPhfr2D7Jie+FdqvCYT2VcqY/UdT4MowJwQ8a2xSqKHWsNnuAMI
 Lv6zIVmaZ+JCION7yzcTTqp/tPQnVsCZ6cmrr/2cKAMT4dxYGITIR4TUYN1OjSkRYJBUXKUugxOf7
 jdPb67h2IirIP9DcEM8km0Fa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc6lQ-00DogU-2b for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 16:45:09 +0000
Date: Mon, 19 Feb 2024 16:45:07 +0000
To: samba-technical@lists.samba.org
Subject: Re: setting up authentication policies in 4.20rc2
Message-ID: <20240219164507.6a37e945@devstation.samdom.example.com>
In-Reply-To: <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
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

On Mon, 19 Feb 2024 14:48:06 +1300
Jo Sutton via samba-technical <samba-technical@lists.samba.org> wrote:

> On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
> > Hi to all,
> >=20
> > I just tried to setup authentication policies and authentication
> > silos in 4.20rc2.
> > Following these steps:
> > 1. create a policy
> > samba-tool domain auth policy create --enforce --name winclient-pol
> >=20
> > 2. create a silo
> > samba-tool domain auth silo create --enforce --name=3Dwinclient-silo
> >=20
> > 3. adding a at least one user and one host to the silo
> > samba-tool domain auth silo member grant --name=3Dwinclient-silo=20
> > --member=3Dwinclient\$
> > samba-tool domain auth silo member grant --name=3Dwinclient-silo=20
> > --member=3Dpadmin
> >=20
> > BTW: In 4.19 it was "silo member add"
> >=20
> > 4. Set single policy for all principals in this silo. with 4.19
> > that was possible and that's by the way also possible with a
> > windows DC. That's on a windows DC called "Use a single policy for
> > all principals that belog to this authentication silo"
> >=20
> > In 4.20 the option --policy is missing, you have only the option to
> > add: --user-authentication-policy=3D
> > --service-authentication-policy=3D
> > --computer-authentication-policy=3D
> > So it would be nice if the option --policy will be back
> >=20
>=20
> We removed this option in commit=20
> c22400fd8ef961e472ce2803cf4a2ec58b778795. I don=E2=80=99t remember our ex=
act=20
> reasoning, but we must have thought that it didn=E2=80=99t make much sense
> for a user and a computer to share the same authentication policy.
>=20

Can I what was the reasoning about this ? Seeing as a computer in AD is
just a user with an extra objectclass.

I am trying to get my head around all this, but I am struggling at the
moment.

Rowland


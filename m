Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A86807F9C8C
	for <lists+samba-technical@lfdr.de>; Mon, 27 Nov 2023 10:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hfL4jl8gx6+BSfKqzG/01ss6d7vtFxLbi68PH+vnLeE=; b=obekr6oJGuOyF4vMAM3K4icKlW
	UM2liMEFSgOzXc7wxBlILJzvsGE69+aC69/7QYn7JARn8Bbx3AuGEYsDT224waMc2OnJr+QEC+mZ1
	I/aLEUJHM8gsUoJMsQ2RRl1+yJFZljRiDXRBWhv/Sab42h1iYvtLcQbkb+YydX5/OwDPR8Htf/JdX
	m2WCPLNnaywnxd8wpBymfRK98Sje+Gt2hMhbLCmQTk7M3PS8rbMpHUtN4FdjUTaldSk80kfxb/M5v
	IRK/WJYfmggCkmdEHOzO2zBLNRQqtt/nyVJi9jq+5Dcvq61cmRQYhkqW3nadMccK67awW5Boki7Fv
	sFoCjcLA==;
Received: from ip6-localhost ([::1]:57158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r7Xri-000m6H-QE; Mon, 27 Nov 2023 09:25:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r7Xrb-000m68-VP
 for samba-technical@lists.samba.org; Mon, 27 Nov 2023 09:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=hfL4jl8gx6+BSfKqzG/01ss6d7vtFxLbi68PH+vnLeE=; b=wCF8HeOk7nnM+xPfOQxn/Kt7RG
 mtOZuLqpIQQ8CIN7sVi2NUC+czEb66r1wUwYLwdGxjUm40Zmk2Tk2+piCXX41SYUXQYmwy+VBRjpO
 nnTMsN07PSp88SNIt26CGtRzWxBhqZJdu6YTbyivB1597Aff7x5x9dVVSRBoZ9ff4h8NrXrsecKjd
 29aMX7mjNaFIs6iZq+PQWts5Yh3tgzQcnXSGpp0wZS6oDNHtKQGeQcfOKYFSEtsTFDzPZ7iDQk6Oc
 mqgwkjs2rZmHZy/BFccId77NLovLQ1lNSOoDhzNh/dYrwvqyTfzRGS8mtfevLDVgdwEur3VyAHAzI
 gV/6IinQZk6k82RtXUpb+EGp3A0xu1pjPZrQ+HytJciOto14i35eASOmeqD6UgmP0+irrahAYFy2w
 JZK6sDiyFfPIJjteSkAdhF+rxz1uGV4SU6nke1T1c1t80kRsIE2aWjtTFjxRKL2PWMx/eCDYRt0AW
 tnLNvBnGvf9qMC3B86Z7GaMQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r7Xrb-000hg9-01 for samba-technical@lists.samba.org;
 Mon, 27 Nov 2023 09:25:11 +0000
Date: Mon, 27 Nov 2023 09:25:08 +0000
To: samba-technical@lists.samba.org
Subject: Re: Migrating from NT PDC SV 88 to Samba PDC
Message-ID: <20231127092508.76ba0ea4@devstation.samdom.example.com>
In-Reply-To: <e1eb97694554458cbbb80845260ef4a8@it.mos.ru>
References: <f93407d8fe144b3794c7d7237abc1eef@it.mos.ru>
 <f36571866e9949fbb1735496100dd415@it.mos.ru>
 <3e40c93ebe774af88cdbe2336ebf45bd@it.mos.ru>
 <e1eb97694554458cbbb80845260ef4a8@it.mos.ru>
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

On Mon, 27 Nov 2023 09:16:26 +0000
=D0=91=D1=83=D0=B4=D0=B0=D1=80=D0=B8=D0=BD =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=
=D0=B9 =D0=90=D0=BD=D0=B4=D1=80=D0=B5=D0=B5=D0=B2=D0=B8=D1=87 via samba-tec=
hnical
<samba-technical@lists.samba.org> wrote:

> Hello,
>=20
> We need to migrate our AD from NT PDC Schema Version 88 to Samba PDC,
> but we can't join our Samba to NT PDC or migrate SID History and
> Account Passwords to Samba PDC.
>=20
> Our company is over 3000 NT Servers and over 5000 Users and we need
> to migrate to Samba without Servers rejoin and Passwords reset, but
> it's very important for as to migrate.
>=20
> Is it possible to hope that there will be support for AD Schema
> version 88 in the future? If so, are there any approximate date of
> this?
>=20
>=20
> Best regards,
> Sergey Budarin
> Lead Engineer
> Department of Management of Services and Data Processing Resources
> GKU "Infogorod" work tel.: +7 (495) 957-93-57, ext. (77137)
> e-mail: mailto:BudarinSA@it.mos.ru
>=20
>=20

Sorry, but these type of questions should be asked on the samba
mailing, not the samba technical mailing list.

Rowland


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA886D38
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2019 00:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MDlzs0yeZ0pl2QFRfM5QA21m4GNItARb6fFWraWIzhA=; b=2be5id8RF1Txd7Kl8RVuBWbiE/
	N3GHuDHwAHRoQahINrIMm8irFxUFohv4v1esvi5hfiLT7M89gcmfAZhMtFLsi/9rSGznJIxQX9oj0
	ExDpKESsiUVWB9POds/ifu/fX0/lFj9X3n7xVuAna7RQ682FXn8X0V+6wSD/my6lj6h58eFRfn1ZX
	SVZYCFF5AMEbTlpUd6b0lvfatFHrPJh8NQWF78s+kPozM7oJuhodpTPpDcPfvdc1FaPDdHsnXqL89
	S0mhu10596Nvi/gM9lnbI78YQZQ+3q8M9HmS0AQfGPQ42Qyi3JgcpMh27L7QgMOju7jgpUgxmErYO
	VUCZLCQQ==;
Received: from localhost ([::1]:35460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvqrW-005I2M-J9; Thu, 08 Aug 2019 22:26:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40203) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvqrS-005I2F-F2
 for samba-technical@lists.samba.org; Thu, 08 Aug 2019 22:26:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r1so96363018wrl.7
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2019 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MDlzs0yeZ0pl2QFRfM5QA21m4GNItARb6fFWraWIzhA=;
 b=TLedIlp2XRUQCOWnQOFM25/9l0+gaADQB9i6dyr646Y1TJx9d/asPFl/H4JVlaUvja
 l2pWvdw2Tatq70IV0wGvuuuzHqhmhbuenZ0eOWGK1XvvQ0ET4gQ+ws5r6qQE+tYo0lsu
 JaqRtLv9P5KlG/o7/OimQOoL2KaGj4JlluTQDZYwnUr5oAgxO/2BNcD7S5J5RpTg7z9+
 H3o1GeVn0rtZuyCzIB363kh4ybrDc8BN6dGJqkw+iYFC2wVbsB97c5GZEeExZGa5Wfzp
 fWtB7YZwsesJK1KOpXpvwGtwoZMjrxeyIZzino+/ve2rbVfF2di8oCINBuY8FyU5O3wj
 Uvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MDlzs0yeZ0pl2QFRfM5QA21m4GNItARb6fFWraWIzhA=;
 b=lY7ZGEESk/jFebndI82zr9SYV4/D8NPKegRImYRKEQaDkpQoNwumoPswTAJycveJh4
 S6hw+X55s+vzE2e0HhSF6+qz8Qv4Q3h4vzErTs++zpCcTanAXaE8zgtKsBrJ50jqwZ5+
 n3CqJKLTOsGjmOfS9B4ka3JtTMsERb/bxLSnKm3PvSJ/4Wi6C2XiSz5iBBYfD0p8p2CI
 j4BijL/QX8vcRsiF63VLRCvuD/9maMKFtcuRPHe1ymPS9RQJWr3aIrjMWLns69j5tiov
 lv5X20UqFSi+2PJcfeNh2sSU+TZyuLLyTNeSUU7W1M2NPAyjtvqswxsHJ1s0UfScfn/k
 vkvQ==
X-Gm-Message-State: APjAAAVwmrT2G7R8ShQqp17ScZoPROUdRjuDP2Yylyv8eqsNGXuberzS
 WH1f7nyvY4Ee44q5U7kyG58A9blVcDzejpZH8Puk8Q==
X-Google-Smtp-Source: APXvYqzNjqPsvkmUtFpNNmoX1+9XhkwQ19jLk86A7nHB+ZPNHRqsdNak7pUYoMc9212HEUWGhez+I3VeEpAKem5qjUw=
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr17957731wro.337.1565303177086; 
 Thu, 08 Aug 2019 15:26:17 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 8 Aug 2019 15:23:57 -0700
Message-ID: <CACyXjPyxsrrTkD7dBtLuQiwrTh=o+8k9vJPKYfrMtrAe592hwA@mail.gmail.com>
Subject: net ads join seems to restrict itself to the first 5 DCs of those it
 finds
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

We are finding that net ads join is unable to join because it only
issues cldap requests for the first five DCs it finds when looking up
_ldap._tcp.realm ...

Is this correct?

The problem seems to be that sites and services is not correctly
configured to return the closest DC first in the list and the one they
should be contacting is around 16 out of 29 returned.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


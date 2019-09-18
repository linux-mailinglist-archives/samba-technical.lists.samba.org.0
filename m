Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB0B6C44
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 21:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jK3GetQ8T3Hyqj8H1zMVNR664r4lHg2fbpacX3A62hc=; b=fmKXB+3INAfR5odifzDMdjR9PW
	iLRfWH+UIQVuR6XAmz5ZLEVPSW/KFv/pEONqpkdIsqXiRMJk/BA5RsPIUCyrwMFQzppPPRzXza0iA
	d9d4zVbRVRJtlmmUPeUJsj0QRqWGBelv5XQle/alTODt7+BODIgilRYMNS9pFN/2Nf2pihm79oL0V
	8ArfYrUh3lgEyZOW5buytXf6LtWE0r8hbQS8cl3u9XqpnM4EAHxZnJZVDlRWQtSys7mcFExu4ppeE
	FgeJkv7w4XTuv6euIjhdQH2O5W/pWYOlJhK6R9eVwqwjjnsSbziUoxrjUbxW0gSFjksr+zX8ylLmG
	pOXrt/Ow==;
Received: from localhost ([::1]:35268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAfVz-006fsx-0g; Wed, 18 Sep 2019 19:21:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAfVv-006fsq-Bp
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 19:21:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id x2so1436974wmj.2
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2019 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jK3GetQ8T3Hyqj8H1zMVNR664r4lHg2fbpacX3A62hc=;
 b=rgtsP3c1oPf+nFja4GIwHomx3SKvhB4Ijn/aIE+xMWwqCSTkOw4AZp0T8eYlcBtjQ3
 H2kX2Th2rxybXOk/R5C2/3rs2slTQem7HMp6/rWcaLQFbkp6jMtOiHd9QMuejTqpzcsf
 oaQe4xWCiiBHlarUh4slhTXJ+uQ67Gw91YzPYRVIaUryfz6fSEz9xBvGLKoqsJix9VuG
 QyZc9ovukf99F8wPixt4sKw9JH/tooHp9bWcOcb+jvmhufkHONanh+tic/4T4m8toX3a
 kkWElf01lydyNfeseVlU8eo5Y3bYCjD8XZLSvGoZmAXH59xuhTksSf6xMB7OzcTbbgb3
 pDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jK3GetQ8T3Hyqj8H1zMVNR664r4lHg2fbpacX3A62hc=;
 b=MTgYswP1eD6ZH5cGzkkrPqIxguo0IvzrpmVI3nXBIvzqkAcvulJXv2MThfjA6+xs4J
 wjstK/TnbJUm4RTroo2OvMWoMR+iUOwdTNq52pNKk6+I/bAGNn+8HpxEP9HgD5sX9cow
 HUuUY3uxHifhOGrvi1lV8T72RG9bsmKJPi1/wGKKanXQpL8iPCFHQYQ3jM/w5LNtBJC5
 eulrfpW4tyq6UJfBbUntqqoXAcBy3nXtUkOGb5bn7oj6lhbrpve1NYPe9Aez9bQS+2r6
 IP6y5ErbLySBye8oSPdgrFXHsXa5wrraar6hI3o0Nc+qfQFbkmwjXyrlXNUTVs2/RYPa
 Admw==
X-Gm-Message-State: APjAAAWrzEH2gY0wL/ratq3njFiwAEQeBmpJYgOTJh2kn0zcJkgfeUvu
 svwg1PQNpF5P0MuEKSyt3Ycb0PjrmseonsxOVLv4ZTtb
X-Google-Smtp-Source: APXvYqwJu7dEDHwVrsl4OfFqRwUtfupMOD7oixH3A/5J8yzpPs099j79Mbpx6pOySZWZzFb4LJeDETrWRUXu4zPxCIo=
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr3968089wme.146.1568834478481; 
 Wed, 18 Sep 2019 12:21:18 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 12:18:17 -0700
Message-ID: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
Subject: Sites and services and queries for SRV records ...
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

I thought, perhaps naively, that if an organization is using sites and
services, and you do a query for SRV records from Site A for
_ldap._tcp.<realm> that the Windows DNS servers would return the SRV
records ordered with those for Site A first.

Is there more that you have to do to ensure that? What I am seeing
looks like standard random round-robin order.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


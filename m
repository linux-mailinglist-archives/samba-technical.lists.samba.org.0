Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B231985D
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 03:40:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WWwekpXr7YrGtrlbG1gNiqtu3b3wAApqzUvoQ6GBImw=; b=pF/jNrRMalKBMG3+0fZTbDLuWd
	SiTtxgpC40kCNpi+3OdlkoUXF40Hsz3DomjcsIIBRjcKMmxLebAWaOjOAa08dqv3d1/+JIajDYD3T
	gZCMAcM10kci2eVPQk1YDJBz4I5cOI4TQLqzM0IwfcsPiC7ZJMvqk313I5Xh6c/W4EDeH8dz9iXjr
	QHFz0IscpE682ZjNcwCzZTwVnRcLwd37Br2StjQ+IPFKHuOZHFAkry1JTfQdFYla6erOVF3iAYk/g
	EvsdyDb+aTqydAWPBKqt6yh7gNXbaVfxX9jF0GMNHw/qr4H2vFdAB5+JUoOuP2Vj7bTgORrl9IqpC
	Jr2JgHqQ==;
Received: from ip6-localhost ([::1]:65134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAOMG-00CL5S-Nl; Fri, 12 Feb 2021 02:39:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40733) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAOMA-00CL5K-Pr
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 02:38:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id q10so123528edt.7
 for <samba-technical@lists.samba.org>; Thu, 11 Feb 2021 18:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WWwekpXr7YrGtrlbG1gNiqtu3b3wAApqzUvoQ6GBImw=;
 b=S7dF9zO/hkTCWxQLvB+xm5G2qbb8bmY/v1kr1lgAiKoaCoI6yIF1I4/oAKkVd/sFsm
 lkYRQ5Z2yJsmCJHul2ZaDmxmvqg2qFD60w+SgToki6Q83Xt1iaxfpBGZ1ORbSOD4sAc2
 IOyDyO3fwAKBiCpI5Q3ZUqqXMM5ih3xpCamC/ABAiMV5XDAKvhiL5FQaC+BXghQNDXV+
 nNumY/h3xK+qogMPsTlgv6Yb3ywi0h4pCD1rZctMFxbMoJSaY9nj02jLhoGNbwRKLmTd
 otMtuUJPyBBKjGyKdA4hTr5e7aga9u9FcUab0CGd3ObfJz52v+41x5giXFFL7lBnmpvV
 cYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WWwekpXr7YrGtrlbG1gNiqtu3b3wAApqzUvoQ6GBImw=;
 b=mxDZNvcqwzFy/L92Pen7GvoSq8bliQzkF52Mlmtg0g9ZGgFlFcML9+ieZ0rXaRCON5
 gyPchpIVIcjwMDXIajTDKZcKTSS7gAF+WN7KP8oOi9L0EHG3566+RcJc/dvNHlIF6jHO
 2wbxIojPbjyN1arXqRhq6geF49E9s24NJ2H9EYeRAtdl6BnO3Ywcc/8jGCU7yjze3AhY
 X+h1Fu/J+VNFaE+2HrE7zO1yUozh1UnvnMl4z0a8IVzgyfc13ostCy77Y5Sn9kfrteCK
 l1eyTXJi4hn5pcjMdCtLIIpMInYcpKkGOwFwIN+qSDMpjIHLXCGZ/qDzAnJFIIoSZwFI
 Mp6A==
X-Gm-Message-State: AOAM532ENBpnasW4gxYeLa/NH9fH181S3dRFoTDCZuR+2/OtVWfADSxa
 HnFpbVpcVh11Upu/0fFOIi0MDTI4HiKRp3DM3+GO3+/UExg=
X-Google-Smtp-Source: ABdhPJxmBF4Fn3pj6emHvJCyL90GrjoIUEGyCJ+HKbJnwO7DX3gIYoQVpOJJ6ML52oRdyzzlCljMJ1y++oSXqNP0EHo=
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr1158550edv.268.1613097533341; 
 Thu, 11 Feb 2021 18:38:53 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 11 Feb 2021 18:35:47 -0800
Message-ID: <CACyXjPwLyZE4p09VWiG8r8KtgiNRsVe4ceF2X5ZXJbYmwOHxFQ@mail.gmail.com>
Subject: Trying to build Samba 4.14rc2 on a CentOS8.0 system without
 development tools installed produces a weird error
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

I just created a CentOS 8.0 VM and had not installed the development tools =
yet.

When I ran configure I got the following:
----------------------
Setting top to                           : /home/rsharpe/src/samba-official
Setting out to                           : /home/rsharpe/src/samba-official=
/bin
Checking for 'gcc' (C compiler)          : Traceback (most recent call last=
):
  File "/home/rsharpe/src/samba-official/third_party/waf/waflib/Utils.py",
line 828, in wrap
    return cache[k]
KeyError: (<samba_waf18.ConfigurationContext object at 0x7fe8a08d3cf8>,)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/rsharpe/src/samba-official/third_party/waf/waflib/Utils.py",
line 828, in wrap
    return cache[k]
KeyError: (<samba_waf18.ConfigurationContext object at 0x7fe8a08d3cf8>,)

During handling of the above exception, another exception occurred:
----------------------

Would it be possible to check that gcc and the other development tools
are installed and give a better error message?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


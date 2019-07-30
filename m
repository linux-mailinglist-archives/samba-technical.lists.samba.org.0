Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A57AF8A
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BsSSupJnglGCZi/V5sH9JBAiC75q05boOBbixH1aRWk=; b=YjP6MeWRVtZJGquKZLGqfDj37w
	/dftspiCsSnIPEj+wsgvt5tEh0JGUnEZgBuylYs4Ro8ygfw6ArmPv0oez6wTHNgG6Sx45rOnH2BI7
	+JYHQks6WRiAWPTB0n3DYz1k5UtrVnenkRkWFbiV2kkbJHlkiDTTDqRIwrdEczU0+Wh9ifs8mTfbV
	d3qX2Hn1JOXUSEWDdEpZ8QvSrudx5+ScyUzi9GZ/CztWG8tzIRCBcIYxtVYJ9MVWAhCCslBnbWjdm
	qk1uSe0XVTjQHwdsFSa400W7Pc2Vp8/4zrb1m9lIkqly35TsyVPWL6LCAfdbBx+GmUfo7iyOLPA2t
	43xjDqKQ==;
Received: from localhost ([::1]:34022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsVkM-0012gU-6t; Tue, 30 Jul 2019 17:17:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35165) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsVkI-0012gN-Gk
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 17:17:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id y4so66644722wrm.2
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=BsSSupJnglGCZi/V5sH9JBAiC75q05boOBbixH1aRWk=;
 b=jmX4KTtSN32BoCu+1i27FFKRVMRytY/7B//runX4TjiIFOufW78lK8hBsTtrPPpJct
 KRvbaBSlmsh8slyWSSP0gEE9emBBEmDeDJLw9c7tcoNBhnkYkJIFnsUuiABuDCuLgf0L
 cgeBqQWcJNvXoV2F9rqiClWfltEfEwcq/0yR9a/k+th9CmFx3a5KbGS69LMTDQlzBNJ5
 ffBst/Q0mXIOluqwwrhIh0TWMi2bFT8hd+NkNk3aQ4yx/g2XyHeEleu/4Yzkl0v/H7Zq
 kVmp7MFJwOZziGSTR1C64PrlzjovpIJGwtduHyDoXP7iSAvAKgJC+fbk6gwM08yNZSdp
 zL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=BsSSupJnglGCZi/V5sH9JBAiC75q05boOBbixH1aRWk=;
 b=j0K3wAEIfhgPe6nuDlwUyZ2K2/SX0Rf0GWFTIPZw8kesWM7IAPY5X2tj6tNwcL8RUD
 r60sin+DUGxufNVjiNK+Ba0QSsU25Fvf95DTL99HwGVkdDY+SAUTmViUIKuhiBQS3JLL
 J6ejAvnM48vBBNg8VosFRjn6jmV9kKRldEEB7L8Xosrk8ujnea7s0DPu+J8gRE8+mlWj
 qRxNxeTsKWdoh+n0QgQQbL9p/CHdKgrKHW1NJqbKC7Daqp7+G1wdNdo7pmqrqSwG+2jX
 9dV/c8Pe+LpffzOzuTzPxMgJIWTq+WUGzRYJ6HyEBFYM8tLQfzkOJf08FguPhcT2q8Af
 x0nA==
X-Gm-Message-State: APjAAAU/RLV9jrgnRE37g89UPCyz3dFEcSDVfuCCHlZZfCh7xFKVprAe
 QnuxWqScnHYSn/jCryhDF/foTAm8GalNkMmRKXae+w==
X-Google-Smtp-Source: APXvYqxuKWfr+QLqqMLdtX22b3I6sWG21gDo0Y5xSQi6KEQWUrnRrcT9KLBCSfb1p8j0p2Hjmh03ewQHm0TwSUWjOv8=
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr73143961wru.339.1564507025537; 
 Tue, 30 Jul 2019 10:17:05 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 30 Jul 2019 10:14:55 -0700
Message-ID: <CACyXjPxikKqDFpTF=z7u-xVwxpXSLEoo1wssnYRccYuUt3brfg@mail.gmail.com>
Subject: Interesting issue with Macs accessing SMB shares ...
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

We have seen the following issue:

UserA accesses/mounts an smb share on \\some-server\some-share and
when listing the files in a terminal with 'ls -a' they show up as
owned by UserA.

If UserB also accesses/mounts the same smb share on
\\some-server\some-share and does an 'ls -a' they show up as owned by
UserB.

1. Is this normal?

2. If so, I interpret this as Mac OS/X lying because it does not
actually know how to use the RPCs that would be needed to translate
the owner SID etc. Is that the case? Is there a way around this?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


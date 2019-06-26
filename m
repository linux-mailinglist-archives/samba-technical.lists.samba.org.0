Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D339056E18
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 17:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=B5wUys0fcJuUoV7rhiSHm16dM2z3zbKFdXc+Sd+CUS8=; b=zQ2+QLXyuuGgbQBYdHv4ouIfFh
	NZG6vX/CLnwdfh8wf8Biudtrwa/YuqpWTOdZrpvN7qcvYOVpKMKjCVlxzzh2njwgMkhP4DNPutlLr
	IcICE3V8zp/cbz9x7wM1i9I/mKV+rM1CMqpbVcvBgYM5gKzfEawSMdvrnDMDaZwatN4Dkr2bjBnTE
	Y2hEItpeTZmzSLgDShvqmh2u542YH5KgNWucZcKp9uL94XpPOknvBGnAYr87wom42SjuAF66wtvRi
	0FCFNE6QE6+XY7/gpf3zFm100fii/I87PUaozhqZVAW3C82Z4/slMk8CyGDdAp/XY1cF9CGoJk6SJ
	vRZWpHAA==;
Received: from localhost ([::1]:41690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgAFI-001wLB-B9; Wed, 26 Jun 2019 15:54:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgAFE-001wL4-6P
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 15:54:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v14so3337744wrr.4
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=B5wUys0fcJuUoV7rhiSHm16dM2z3zbKFdXc+Sd+CUS8=;
 b=OsATTRi46k3kETm30kWHbQWwc68t2NDwF9akZPwgTqeywRhSG2MLqjuTIiZvYNgIy9
 58VDdsNX45M2P6uUUhVBdqtF/KqtNJ+ZCPr04TcNU5Kc6yAYgzXzrwKbvR17q2z+SCa3
 0LOAD6Td+W5IJu1vka31tRAtC+VizP0VVSAbM5lqJrmIf8RH3eqNOGAOkph8gFMkkwW+
 H9kIVJqNc9AkDc4exLkoOQ9dS/orozFgDQwhVWkXgVZ2tN8LELIov8A/4doanOlZwvxc
 +zBbkZlMgsZ7xoVvqoJR3iknRqmtVQZRvHDNFpiSNyFfE2d73z6jdmZMC18Yd0uSyKCa
 ktxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=B5wUys0fcJuUoV7rhiSHm16dM2z3zbKFdXc+Sd+CUS8=;
 b=MTS9XBb0rifA27QxSvZFw9eK5TWV48cbVnquXrNBRDWeKwOFPSgBjEW1X7kB1DK16A
 ilQkWfC9DX2tnN3de78avQi/1usPPk1mUxoG6QFBi/qZ7v+7l9LTLfcUBXy3Tfsh9N+R
 YgYVWegFcHXKmaBtbQW3RsTvNKWwA7cHDeAQpC+HWNZBx8b1vlwSxmdin13sZNMWQO3e
 6DBZ8t9e87HeI4W+r0ogJyN0Vbc9ZSKdSyAGc2QXMQqHEKcM/vXgoswUAGyjDTfcIQAU
 5TBYDAts/BVxyFjoKusGNmsAmgIHt1Y/0XflldEw4f8H6iMksaqAbefwK1ZpDerSGenB
 1KwQ==
X-Gm-Message-State: APjAAAXD9ZG4cWPEzHrAiDW1NiNMU8tKUlDQ7kMWikwpXu1/N3/L034v
 lI/KAB6J5wMpXM1wD+2AX/HmM5RjTbO+T2/1fXAZG6aw
X-Google-Smtp-Source: APXvYqwqjSz7Q2MhciWMKD0UAYoN/zLSedNiiWKMCxzYrgKYGAiX+yJMDbhUXLfVREhwzM+RKlX8PEdnslYQm454VDc=
X-Received: by 2002:a5d:4810:: with SMTP id l16mr3919392wrq.48.1561564439262; 
 Wed, 26 Jun 2019 08:53:59 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 26 Jun 2019 08:52:13 -0700
Message-ID: <CACyXjPyKXCXuW2J2C=ocqYTCmhBZEpv+a_Uxd8B5V3WpvOVQYQ@mail.gmail.com>
Subject: Is there some way to have Samba limit the portion of the Version it
 compares in a CTDB environment
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

I recently made a small change to something not related to CTDB.
However, all of our builds stamp the version with the GIT hash among
other things, so when I installed the new version on a node, it would
not start because of this:

---------------------------
[2019/06/26 14:38:02.226586,  0]
../source3/smbd/server.c:1528(smbd_claim_version)
  smbd_claim_version: smbd 4.7.1-GIT-0778e7b-VENDOR_NAME already
running, refusing to start version 4.7.1-GIT-a8d19b0-VENDOR_AME
---------------------------

That required I install the new build on all nodes in the cluster.

Is there some way to limit the comparison to the real portion of the
version string, ie, '4.7.1'?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


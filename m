Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B1387EFA
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2019 18:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=h3DZKoznBaIs74vyjKvh+ecagu7XACcMsRWj3B9ahd0=; b=fyJR0uPAM4aA+CuoMdJhlkPna2
	3ff0F+rNj0vAiutJ/iYiUnS7VHyEnk/W61NGNM8Vxme+SaCQ/yLJQUD/2GJtGyViaCMs+iAOhUwpg
	IsdubujT8pEtdEJgHXidATwmokT6/oyqc7tgP8PcxiFRUwSsIINi/X7HWVNNk0WuGeTCmWNDbEQ1X
	hGQj4hcWb9cuxyOZYGYtBjqFz0ed+g4A/FR2VEU6Q6Yf9Ect9T986FMF6jk3YQyuyskl8y2kec7e9
	fNsomWy1yzR+fUy4g3k8V+Y9GAgVwvD4P288JoT1KONiraVawmE7UYpJZY6ZjYVpLMsInvf9qpksb
	c6exg97w==;
Received: from localhost ([::1]:40618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hw7QB-005Qe6-Ep; Fri, 09 Aug 2019 16:07:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42419) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hw7Q7-005Qdq-AU
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 16:07:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id b16so2030108wrq.9
 for <samba-technical@lists.samba.org>; Fri, 09 Aug 2019 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h3DZKoznBaIs74vyjKvh+ecagu7XACcMsRWj3B9ahd0=;
 b=e5fe/MCGHEjMYIbRbTCavkJq44/U4G2tgMQmtlrZbjZE6WoEFBp2hpJ/cynisAqsYi
 7l30KEAAGpwWcYUG8s5xJZQPVctStswapiXYAXcTn5Af7p1qWkGOydGqd7Ry1lELu36h
 mXltE9aS1NLxwgnU7fGv6ieQPp+pQoFN5O+Ags8eDSGaTI6pBNFnISttqCZlYSacF1au
 lLikhcxy/oCHUJ7257GiH3vOoI3jLTqKdFbV1PcjYjcGcka+EQFqaYrIoKyhpfGtH7B4
 2VNJzXRnK3SnFKAeo0BZDFuDvtDN9h7ImRzO3w+tG1Lmv0NgGFJxR4FWvBzFIHw2rglN
 6obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h3DZKoznBaIs74vyjKvh+ecagu7XACcMsRWj3B9ahd0=;
 b=Jul/qCG0KH4w3rnocNGhHJCNkjLqi5p1R3coelNf+JbAyv9uwFl9BVb7Zm11r7kkuc
 +lt6923Zbm7bsMUVVULtOTfLdukBaSSn9JdtP1hxcBfrEv6MCgr+dhQc2KsQSKTj4kVt
 Ixy7uiSRcB4w9Ya3JnHoXOLryevO2NSc9BfHsZO3OMISsjDaJ9ZTnUKVndJl7iujUZYm
 7i0Ri8oLgL8AdxN62ixVrnHNZPIiX5bK6hzJ5U62nKyaayKcwUIEq80ppvr+m35sNdw0
 eA7X1sM8umNRh7ttugY05R4ZaOpJJ2gEVHPsTE0Z9mTiNxrv+JRvcZC6X1vzNTHulM1d
 VCWw==
X-Gm-Message-State: APjAAAVwoLGCXKnKMYMWQ9KfejQ0gDH3l2VPMZWO9k2F5Tf4/NP4YVMM
 mynU/97bml+2Av1qgHK7BcUwkbb5u9NXpc1Indw=
X-Google-Smtp-Source: APXvYqya+tp22dzJZyVMIfHf32N2nOeIQaWtU7LhZl8PXxReLod/0aGBqvIWP6G6VWX3yBTTP6EKCECnSQWTCMr9N9A=
X-Received: by 2002:adf:91c2:: with SMTP id 60mr26161721wri.334.1565366830486; 
 Fri, 09 Aug 2019 09:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPyxsrrTkD7dBtLuQiwrTh=o+8k9vJPKYfrMtrAe592hwA@mail.gmail.com>
 <1803836.RimPDrGzcC@u33b4e6d89a065e.ant.amazon.com>
In-Reply-To: <1803836.RimPDrGzcC@u33b4e6d89a065e.ant.amazon.com>
Date: Fri, 9 Aug 2019 09:04:50 -0700
Message-ID: <CACyXjPyq1qTW3dHmzUcUv+DOH+UkJfkzShb9cvTyDGthDqoesQ@mail.gmail.com>
Subject: Re: net ads join seems to restrict itself to the first 5 DCs of those
 it finds
To: Alexey A Nikitin <nikitin@amazon.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 9, 2019 at 8:33 AM Alexey A Nikitin <nikitin@amazon.com> wrote:
>
> On Thursday, 8 August 2019 15:26:43 PDT Richard Sharpe via samba-technica=
l wrote:
> > Hi folks,
> >
> > We are finding that net ads join is unable to join because it only
> > issues cldap requests for the first five DCs it finds when looking up
> > _ldap._tcp.realm ...
> >
> > Is this correct?
> >
> > The problem seems to be that sites and services is not correctly
> > configured to return the closest DC first in the list and the one they
> > should be contacting is around 16 out of 29 returned.
> >
> >
>
> I cannot confirm (yet) seeing this issue in `net ads join`, but I have se=
en something similar in `adcli info`, where the code selects only the first=
 five entries among the SRV RR for _ldap._tcp, leading to domain discovery =
failure in some setups where DNS is configured to return non-site-specific =
DCs yet firewalls block communications from clients to those DCs. One could=
 rightfully say that the setup itself is broken, yet Windows is robust enou=
gh to handle that, but adcli wasn't.
>
> I wrote a patch that fixes that behavior in adcli, it got accepted upstre=
am some time ago. If someone can confirm this behavior with `net ads join` =
(or with Winbind in general - I have seen plenty cases where it fails to lo=
cate DCs, just haven't yet had time to pinpoint the root cause) then I imag=
ine the patch for `net ads join` shouldn't be too difficult to write either=
.

Thanks for the hint. Yes, Windows is robust in this situation.

I will have an opportunity to determine if it is 'net ads join' doing
this or 'realm join' issuing weird instructions to net ads join, but
it looks like net ads join.

I will also get a level 10 log.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


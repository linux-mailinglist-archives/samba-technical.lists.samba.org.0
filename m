Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B15102C57
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 20:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ETekLPuwAvffvff07uZO5L2TwFvC0NzsYrFNVIj82OM=; b=vfR0/Q/mkQ7Wk2ZUsPHHAJIfDV
	+7xaihTWmSB1zHusyOZQKlucz/sNwg92D/Y+THcnTBzcAZw9Pxd93iYZGHl5sF/MXwGSt2aIPblh6
	CRcyHxdVTqCWBQaT3De0lTm0eCMXanrSCPK3jhaIVYAKABkldBw4Tis2YIqYVBSETjshKU8yHd9l7
	rkn8mA8oNlr5PwdDhCi/koX+7hgPQL1CXuRmNxgfloGyA+CLa80pQgpASkiTEObpzd8/1TFN/m+US
	WUz1ohObsDHa20dnBq/94IKbyaVs6t6Af8phA4GyDvn8ZG8oLCqO0cLlRdxsrotVaJtlxPgmLap+p
	Nao6DK/A==;
Received: from localhost ([::1]:19212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iX8og-001eI6-Dx; Tue, 19 Nov 2019 19:05:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39463) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iX8ob-001eHz-La
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 19:05:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id l7so25207488wrp.6
 for <samba-technical@lists.samba.org>; Tue, 19 Nov 2019 11:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ETekLPuwAvffvff07uZO5L2TwFvC0NzsYrFNVIj82OM=;
 b=kc4X6S/pK/1WLboehNp2v9EMtNY1JSOwAVu3WkOXRhDH90BUQ1TwLK8F9S8pPXPHSB
 vQ436DVZQoZVIE5vn8XTxCY3bB9V/gH6elATy09MjIWp9itpF7v6R2TxJOTOFYr9lyC7
 mcz+vmZRkEnDHHiMgzEV3f3iCTC5kB5tJNQb+J5zQwJD2lO46gcoT25/sOuvjM+AjKY0
 P/FXoHDNK/oQZMycqBoqmnOitio4/izL6FXrbcy+H2HVhwrsN+0NlUFwI+Luuv7KKVeX
 ZVpzA/MLrAKWN/DeusZaOCi3VDnhlSXeB1kDBYOE4HiOtMxRdY5ZhOI1/jkOEMuOzZD9
 i1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ETekLPuwAvffvff07uZO5L2TwFvC0NzsYrFNVIj82OM=;
 b=mKwSuwXDDb7xz5djWv6txtMyc8aJfwkyeVET0ZKSa6jTcxlbqoOo3/qDmbQ/s5Ieh/
 Lhd6BR4Yu5T7FBUpjKbfm5E48z2/cA+TDcN/7j4cFNuKAzOxCA1Uu0j/gpyjYhYiGvTs
 5OtUPRqCHPnaPTogmwiEgeHTm00AyghtOqg3M4atNgexcBTXXLlur019lnmYpKMzKcQg
 gbZ3cC5R7epvgZkqMsgzIxJmmOn+Mh0W7h2KoBc0sZGAyj+Dl29T3ZaCkjGVjQ89SAg0
 LH/IWC60QjpQu37sT/2NOfvLiEbmmE7zcWKOXqUXOSubAkHvxlPb5hEVxfflT8zEBPnR
 Vrcg==
X-Gm-Message-State: APjAAAVVWrWndrlBOCWvLEHtohB7WWdqHSZlyLdgp3ou46O8KngPj+kr
 Iok2kn3Zcd2/pjbF9a2hGroYAdSqJOxYnwuF3w8jSw==
X-Google-Smtp-Source: APXvYqwYyqhPMDOQA3s30eZIU/JdhBP7bL8QmuRSfP/5C2HBI2JaLy8l47ecmM6YYbA8aC/X3i+5K/MhxN/BElquNfU=
X-Received: by 2002:a5d:6706:: with SMTP id o6mr18610135wru.54.1574190328646; 
 Tue, 19 Nov 2019 11:05:28 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 19 Nov 2019 11:03:39 -0800
Message-ID: <CACyXjPwfkzN-GUqnffKeOgH9vYRP9qLP8Jwh0cuE_a=gP03bEg@mail.gmail.com>
Subject: Wireshark 3.1.1 and SMB2/TWrp Timestamps
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

Wireshark 3.1.1 has my changes for Windows Previous Versions/TWrp
Timestamps in it.

Unfortunately, there is a bug and it displays bogus times way in the future=
.

I have committed a fix which is already in the Wireshark master branch
and will be in 3.2.0rc1 when it becomes available next week.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


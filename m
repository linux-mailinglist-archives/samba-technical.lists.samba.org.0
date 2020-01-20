Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E2142264
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 05:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xtNvPkHQ9HB3s32pv6NxTrVxG8rlEPe4v1ldntNKR9Q=; b=4+pkqoeyh5iiDI3VnmeOpbav0G
	E1IN+kpMlo/AP4Ij+8G+xShC24n9eH/GRWv6/Jhdo8mLmbgQIxc+dULSMfohL1vVsKgXNnAsHlCnx
	cH5hnekQFbHRpkoncxJ9uMaiShSvXh8F+JBkkaTkeK4O/10bsPmk7kn3ydsEe6695r95YT5Je6r3Z
	1t4Pe7H9Q7HsRKGMR9bS/IzD038HzIRYrjbFVBprRQsp9oj26ifPugJB3htOBgj+QYE5U2AVPeWyz
	OHUMTUchA0404nvu5WKACVewBo/NOmTgqG2BpFsWVMvwYJFcXpiJ9EaELeFmE52q9U3wWBuYU/Dfz
	cb4mRL5g==;
Received: from localhost ([::1]:60358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itOjD-003st5-U9; Mon, 20 Jan 2020 04:31:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39285) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itOj9-003ssy-KP
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 04:31:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 20so13282913wmj.4
 for <samba-technical@lists.samba.org>; Sun, 19 Jan 2020 20:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=xtNvPkHQ9HB3s32pv6NxTrVxG8rlEPe4v1ldntNKR9Q=;
 b=fvOkxjjnop0HkxbkkuNFJaN/bJrRm65O7pH0jGUB0BOv90sWOKy3+9pdWbar17d3HW
 0sXPzRSn+asH1wShhZFFcox0jRwlJEcBrO4uPlaIWr2Z0SAwwKMTgEP8Xs7L49MViS1P
 DAsppLiuKsldWhhAJ5c6ENF55sQ+ogoUlzLfHv+Q7hN1k6fVFEXcBrFi1TodQME2MkoI
 YsGiK8F9F/M4gc30TcSGCEROWdr91AC8wF44FdQGAyn51C9OCAUVr0S7sv/vOC241XUu
 vWEmF8WH4xKGfpRrKOmxbiQbmBl+SDsm/xBbGX8mG/ThsQtrHSNv111rlwD/9IlCyHQZ
 Arng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=xtNvPkHQ9HB3s32pv6NxTrVxG8rlEPe4v1ldntNKR9Q=;
 b=LhznlFmX8cnaxONW6OcGBrhnoWNUb3qW2z0r9MTUs4Z8PQxsshhXjkYIx8pRfPuk31
 La9QULYuQAbIPTv2EdLwjTrN4ytNi2QTRxUw84M8e3Kk/dZtRsb1m8nRbOlUPq13mdvd
 uwKqagp+A4i6kQsvfWLtm03BhiwzoavD3IdE3gCgGtRMcygebD7f+2tmiIZq7blG+WU2
 8FyjzNnu4TsfMkmuGaG03OMm+nVw84oI8lZedJdjiv8unScYGoijy1Gnw721C7bO2M+w
 mZ6rMRYwZQAv/vcaMmJcflQdUVr4FWoKtbD6fiuJ8JCkxA/4J/QgE+akPax52WhbIVkb
 e2UA==
X-Gm-Message-State: APjAAAWdZ5ZYQxfpfq5gjTglqgmXCj2Iygx+FFPSIptJPJWY71TfB2Qh
 j7hMHAA8SerCh9Bu+lI6j6F5erUYCbmt6adPScyO4g==
X-Google-Smtp-Source: APXvYqwyp67P5TnTyctz87WnQ1coldxA7RinjblpvYsNLR2H/j4TVl6cMbr8YB7ZhDEaxOS4tF9Ag26UzTv1zUCf600=
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr16915865wme.98.1579494709860; 
 Sun, 19 Jan 2020 20:31:49 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 19 Jan 2020 20:29:19 -0800
Message-ID: <CACyXjPy3DwDAX9gDZT6FuqWLGMg_yKFObcZcNBfeXX_JtfqyCA@mail.gmail.com>
Subject: Weird Windows Server 2012 behavior with compound requests
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

I am seeing what looks like weird behavior with Windows Server 2012.

I am sending it a long series of compound request with:

1. CREATE <some-file> with OPEN for backup intent, READ CONTROL.
2. GET INFO for the SD.
3. CLOSE.

Early on the server give me lots of credits (around 35) but eventually
it scales that back to just three credits per request.

I never send a request unless I have credits, I believe.

Every now and then the server fails all of the requests in the
compound with ACCESS_DENIED (which seems wrong, because I would only
expect the CREATE to get ACCESS_DENIED and the other two to get
FILE_ALREADY_CLOSED or some such.)

If I restart the operation where it left off, everything runs to completion=
.

I must admit that I was doing reboot testing where I reboot the
Windows server to ensure that the whole operation picked up where it
left off. I have ~40,000 files in my test set, and if I don't do any
reboots, it runs to completion.

However, if I throw a couple of reboots into the mix I see the above behavi=
or.

Has anyone seen this sort of behavior. Is there anything I should look for?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


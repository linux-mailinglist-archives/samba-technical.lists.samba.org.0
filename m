Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3AB0E5C1
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jul 2025 23:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yMX7vsD2YWgK0ICuo6AfqWvaZtUErY6SgEQTXqK/5fY=; b=PmdsEopyRe0lZht0MXAbUrhfrt
	NwfaoNiQi9VqhU7h3CGm6l4Kim8UvPlg8eKmvLV1J8AfF95G4i9EIoMHFpbJlnz2mEJTR/ipaqQyl
	aBfA8DCS1bw3oaWzQ2ngzDzvi5FzHE7t+FLyRMMW2lWbZaFT39T1M/uoCTeDGzI4FO/8HKPsZwk+z
	JLkkyxtFBPrENOkPQc5USbDT+61pbS+eBNq5m7D5lgZ2nC9T8zyShDRuXhtkONddfTvEER0VbqAJ3
	aZaFCj0/haARgBngboO3af5KI4ADb/GAI0T+vUOPxxZSpMRSKk4mLBZIu9hGD7dQmP8i/ft+YdLX0
	oPHV4fHw==;
Received: from ip6-localhost ([::1]:33046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ueKwh-00BdWi-BV; Tue, 22 Jul 2025 21:54:47 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:61479) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ueKwc-00BdWb-RV
 for samba-technical@lists.samba.org; Tue, 22 Jul 2025 21:54:45 +0000
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7d5d1feca18so564118485a.2
 for <samba-technical@lists.samba.org>; Tue, 22 Jul 2025 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753221281; x=1753826081; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yMX7vsD2YWgK0ICuo6AfqWvaZtUErY6SgEQTXqK/5fY=;
 b=epxEGE+x9VQ5YppKOEOOkROmQI8h7tRVzZ4Env6xvJEeDYPuxtcIl7JAkup4+j2VKW
 OSFPCkXnnHHzR0AMiVBqkNf6cnOC9MercBCWqwbkDddQSv1C1E7ImtZQQnnzlCvWozRz
 TfYyaMC/4pWefV971e40FUFhqGJMVWop6wehgucIPmFX2BVPnhNakPkWZzE8NFVFqnhx
 dk6QPBk7+bAu7m/HYTyXn3dDS2GaXFkrtZJaIFJHj8nYOoQ8jpNiPJUI/c+0voCv0+3b
 RmOJtJGD1r4fzU83YNXrNKGEB8rXaaoQy3IeDc2DDICQLVNdhMeBFd/9sMdUTUus47Qp
 uPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753221281; x=1753826081;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yMX7vsD2YWgK0ICuo6AfqWvaZtUErY6SgEQTXqK/5fY=;
 b=aORVNXLCe1fYyfuSal+QdYc+kosha7+jgL6WVNKkuEa1K4PkSmi2ZhN0rDsE+gtG0z
 Tkl/U10mwFZ8jITvmZB5kq2I7rgEzgbFX2cOLdd1fNHeJfRSjVoyihaND2G5cCk/OmYi
 5ONC1rbpQZE+La7DmRLW/rENNiuTVI2/aTiaO0Zljwy+1Yyhfm/f0auI/zVs3tFpeSj9
 R/n/f9T6FH36ThU/zIndEreul9UeosFvEHTkcgINwZEYxU24tAxpsPuIOfK3zSSEYbg1
 l7h+Z15KOD02QgZ6FDrlNqHxQMLJpFPos7yGz9tpljYsBmIyexUgkNIet1A9XZuoT4jP
 e+kw==
X-Gm-Message-State: AOJu0YwRc5+fd/8A/Es3iAlcBqboaxHKo7mQ9tahJfhUGUa8UkmULL07
 8ZiVzqBgzDmaBb4hKqmp4hq+s/US/dKbyGP1Odm6SqoGu3bavLC7VtJA33BU3aoeAjEcStekmdk
 CbMSS0FqskNRG4FCZC/jPxFgFEYeX8xWuhrXog0o=
X-Gm-Gg: ASbGncsrFVxsUS47PCsJAts3ysvnNgMWvXSqzOGC6vaEe4VqQ55BQlMaw/MVp/9RvTi
 eWlHzWJAeS+qTIygB6JQS6CCtX8jPmxHL0PMIrW3FD9H6lQj2YrO+qRyGuQTkVyIvIS3Kh4cQbF
 WOnsMhE9w/MHxOWm59hb0Kt8/M1v0cWk5yLPs+OApYFxBTY+MF+oL4DLM7ZWMpdX2HTtOuEwIgg
 zAAzx0N8J9PDREre9akYBZTMyQuzPL2LsoKt/Jmaw==
X-Google-Smtp-Source: AGHT+IE1KyNAX06AucOGxHNEiCRimBCVTY8EkEwYnNZPwQQD7FSbzJVzP0oNsyrZQ99j7pyOijeJZJWgh8Y+qmr1aSI=
X-Received: by 2002:a05:6214:4105:b0:704:f952:3d6a with SMTP id
 6a1803df08f44-707006e0b0amr9792606d6.51.1753221280729; Tue, 22 Jul 2025
 14:54:40 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 16:54:29 -0500
X-Gm-Features: Ac12FXyVbP6QqlmAufKTicJL5Gy3Z0axbMClGOVrqp1E5e24VivZrMOyN4qolG0
Message-ID: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
Subject: smbclient posix_mkdir over SMB3.1.1
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was noticing that with current smbclient (master branch) most POSIX
commands don't work when connected to current Samba.  I see the
SMB3.1.1 POSIX Extensions negotiated, and in some commands I see the
SMB3.1.1 POSIX create context sent, but none of the posix commands
(e.g. posix_mkdir and chmod and chown) work. After connecting to
Samba, issuing the command "posix" succeeds (but doesn't send anything
on the wire).   All of them fail with the following:

smb: \> posix
smb: \> posix_mkdir 0755 dir
Command "posix" must be issued before the "posix_mkdir" command can be used.

Is there a trick to turn on smbclient allowing SMB3.1.1 POSIX/LInux Extensions?

-- 
Thanks,

Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96D162AEA
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 17:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UowvKP4AfSGPathz7oN/TKD0+F2pY0e6Xr2t/PYhiv0=; b=TFiwb2zfTIp4bWKJ2beFnJgHEe
	JwnQ93M9AJzc2UELpNL5uKIyp73zAJn/L3TY/3hRK1lVsSq2TrfKWa0t/NdKsMlDW30/4MSxr5hNK
	7C72IWSxeqL3W+6BG4CUwqQDDleqNAzmaA0CZhrzEI1iAnpRLCrRPDyORH5ppZuAasFSPlwLd+573
	KNUHxL6RTV0slGt9iAAIk9HKM/XInts1tauGjM+hHsSLf9XBOfQj0k6eKkUwElLRJdeUn9iuCYgRU
	fOTee/DDYD7PHqQ8Km7UAO0mOM3G/8pkaIY5hyGFh25HWZlGajBsePh/C4IkC/wD6Ba7+JBlFlS1G
	+h24Ppjw==;
Received: from localhost ([::1]:63596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j45yz-00AP80-Gn; Tue, 18 Feb 2020 16:44:25 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:44288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j45yt-00AP7t-G5
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 16:44:22 +0000
Received: by mail-oi1-x232.google.com with SMTP id d62so20689170oia.11
 for <samba-technical@lists.samba.org>; Tue, 18 Feb 2020 08:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=s80kGxy/9a9oG2lyikTjdtptBjfQHDSRao6Zzy3mYCU=;
 b=Wcuonsq6wNIRDSbJEMfeqclVmrs/HYtKq0i5gmX0HxYcwweyVjmmxN8q1atbGKRRDX
 RNztFaKoC0IZfFsWUpUZePE1HD4RooAod07sjicoaGF50R+F9QP7ErpP3ltiHEC1IdkO
 uuOMdUUV3aEkXUMoaUMGwlvw/bZoSDzun7WUQ9QNAG3Y8GDStAvi+sBmC1ardiDalaW4
 oMrcrJOdgrgP543FhxoxBhXYqYSCWLk06OBJZKwthM/pc9NuUxk5H/3aOOEv2bWhbcc7
 kQ37dH4CYMMQH8lT0dHY9O5CzHDXI8zD6IT4WRHi1AFhFR0yB4ORUpApoMf5cFzy/Ix1
 1o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=s80kGxy/9a9oG2lyikTjdtptBjfQHDSRao6Zzy3mYCU=;
 b=S0qbhWc29w+6zVKUypktLJew5xdirM/BQ3V6mfISrXe6849Nym4zMSXf61fhUm/jYH
 FAmHEdR/ciXgaHhFziFYXmWPhHHplqzVYx9mM+Z+2qDY71GiGSxY+WinvC5gzGg8SFXs
 ZN0sA7YXKqzD59fXlw1YjtJB9rW8sDtRqLOw7e841pt8DftEhi9i4fRRwSkR65h3t/sZ
 dxfVNbvzhJPihL2dlJeCNBQDNhuPXQjyOqcq2gqvVjE3kOW7RN+vi3mk0kgBKTP4mDHz
 OeQ3cj5UvEmVJavnHEPpc+O5PwrqgDXej3z8oO8Oxbnutc+Ld6GcsFZm4aCyaSkV8qZr
 321w==
X-Gm-Message-State: APjAAAXlWsF7eHKEEb7oDDnEcHD01Ll51QgQRgJ80LP2jsW6peh7phEr
 c1NYbQwz3BLPtpsso96inejnSccIGupj/W5i3NFGagvy6vY=
X-Google-Smtp-Source: APXvYqxN1SVxn+u9KIdDCPYjInQT0jlT9hPn/nu6CRvHHFqS6eiiXlF1XMTj7pkdcwAEyd7i47lpG/xKKCPnUnkgU1A=
X-Received: by 2002:aca:1c0d:: with SMTP id c13mr1732247oic.44.1582044257262; 
 Tue, 18 Feb 2020 08:44:17 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
In-Reply-To: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
Date: Tue, 18 Feb 2020 11:44:06 -0500
Message-ID: <CAB5c7xrk1JJWmLoW9LQ3AmjMF_CMKFbdbLCqUt5S8JK2RenEYQ@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 18, 2020 at 11:07 AM Isaac Boukris via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi,
>
> I tested net-ads-search from a joined machine configured with "ldap
> ssl ads = yes", and it works once I also set "client ldap sasl
> wrapping = plain".
> However it doesn't work when I configure the DC to require
> channel-binding with LdapEnforceChannelBinding=2 as per ADV190023.
>

My understanding is that the new defaults for Windows in March are:
- LDAP Channel Binding = 1
- Domain controller: LDAP server signing requirements" = Require Signing
- Network security: LDAP client signing requirements = Require Signing

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 801111706DD
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 18:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=p4GsBFDQ4IQsEk0OqXkHNQ0hSxYHmVqmg2/DSU7zXzM=; b=keG4iIi0/ebvVG6WeWr3MzgSdw
	LLhUFMr+5+K/Od7J/AkNCCtBVHiJAV0eMhQzxg1JQOhxWRj8ti1baFuzGm2tXLilt95P3Zp1ANhQt
	cIrOVjTsMU+kD2+vZaFS6BABEqbg00twJM0KxY1JqY/aDgARCMEv6j8SRJ2dpus8hM62YyQrETR1t
	KhBcNC5lEfx2P4MxI5LVwmjD9lpqpx2wziZbX4293Frag+HHoWXsssGDHuowYj9b8xeB/T+jiCRAI
	QvBVAeH/2TVdmp8SRlBqNHdjv6us7J09NGNqYNNQkG7yHEk4qI/TOx47HCBWupfbXyBXD0x0dnD5C
	Z4WUbnqQ==;
Received: from localhost ([::1]:24366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j70xY-00Bq3P-JN; Wed, 26 Feb 2020 17:59:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j70xQ-00Bq3I-RW
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 17:58:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id t23so235030wmi.1
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 09:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=p4GsBFDQ4IQsEk0OqXkHNQ0hSxYHmVqmg2/DSU7zXzM=;
 b=txk9x7m10wbEnQB83XIEdPgsfGhURpwjbLfZV5CWsiyhZueYQjFnmj3OGmlW26g/LX
 JE+Z0lkp1TgEb+7aE+HhSWt6e1gxnLM5v59ij1XQv7RWQVPyvB1FzfqgACpt3IVK4+E9
 pNgcU1DpAUlUkDFowueFAUOKg+tRQ2x+EWuo/PCwL9/2NmKXS7jYcFhGkrhiPvLYT/F5
 axeQaCAuRdgMe1hVZdL+1Iuu3SIJoDC1YMRxEh5jvV5ct3eloyDSM0RfzdgWT5YMeIyf
 vDZJdagWE2Y9kuX3ISSSsxTky+Uc34lrkPHqbU2qN4WdgzIpknULYbRoJd2MAUG9KTXh
 B5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=p4GsBFDQ4IQsEk0OqXkHNQ0hSxYHmVqmg2/DSU7zXzM=;
 b=pyaRxpdPGzlfI6VKdZ+gZDP6mZhp5JtcERavd9+pWvB6lqEhLG53YGArrF0fZPkmbI
 0cyRkHZjfh0ykwqoY+Uxh7PDrTWiYBKec7SAxHqNFGgyS1zXyABeGG1oA5GK7DVpf5MA
 gCdKL6vytueQ+WdtUNMILzKpiBnEJ+NzuvcRF5scFDM3aSLToB7vQHZxh3lWWSn+t9tn
 VwP7qY9CtFy+JDz01WX4pR42NuJC5/S+0nG3ezNaYoJwhOFifToZKPphwR8dEc/6tSJP
 0qAmbXdjbk7cl2i35iyos7a7zDOsORHk3/16fW/1swj4ejgaZZUlpCw7Ik/vs15U/jPU
 z3ew==
X-Gm-Message-State: APjAAAWFprhupK8haE6uHwerG/BCbUtRGDkUOcYm6WJ37LkLj3bxb895
 YlpckaXDaJInEOSm0Y7hs4PIgfCvO4sblDi8s/Gv2dsE
X-Google-Smtp-Source: APXvYqw7oSVcEgXZmZsRu/jVmUYB37cDj+xv9fZpe+TcNfFaYsDXBTK/ZvUHythiZMuDKRLRoohFbGzNmSs59DZ2MgU=
X-Received: by 2002:a7b:c204:: with SMTP id x4mr96949wmi.20.1582739928569;
 Wed, 26 Feb 2020 09:58:48 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPxG-_MQst10GR61-A4LNe1bg4LE9NRCGH3myX=hSUN3iw@mail.gmail.com>
 <87eeuh44r3.fsf@suse.com>
In-Reply-To: <87eeuh44r3.fsf@suse.com>
Date: Wed, 26 Feb 2020 09:56:02 -0800
Message-ID: <CACyXjPxumYsEHxOcn=Ho=ZuUNmThsYfzWy1VO=tLq-MEvEa+tA@mail.gmail.com>
Subject: Re: Anyone seen SMB2 signing issues with Hitachi HNAS?
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

On Wed, Feb 26, 2020 at 9:50 AM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote=
:
>
> Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
> writes:
> > Tried connecting with smbclient and on the Session Setup response,
> > which is signed we exit with "Bad SMB2 signature for message".
> >
> > I tested against a Windows 2012 DC and a capture shows that the DC is
> > also signing the SMB2 Session Setup response and smbclient has no
> > problems with it.
> >
> > Is this something broken with the HNAS?
>
> * Signing key generation changed between SMB 3.0 and 3.11, is the HNAS
>   using the same dialect your 2012 DC?
>
> * Signing keys are generated based on the Session Key (which comes from
>   kerberos or NTLMSSP) and it uses time as input. Maybe check the clocks
>   are not too far off from each other.

Thanks for that. The HNAS supports SMB 2.1 ...

Clocks may be the issue.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


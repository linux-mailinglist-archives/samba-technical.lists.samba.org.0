Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2E95A3F8
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2024 19:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vwGKPR9dScyEf6RIlTCNqkBAFknVGBL0G4lRztfOGK0=; b=Fb/OSmTNJeuL3VMcfEmnKpHoHP
	ODUzR0zMxfPu423l4pQ9PfDwULrQpelDuBHhAQr6UUGJlZ8iRiBFW8Q/xfLC77mrqSpwUAOnEmiFb
	nhHILpJVvAAsX5t9JLi7Zh0dkqBAJawJFZbYcAG/Hb2YDkI6yNJLRjgu8PmM8uQYkvQc5oadcJnNM
	iVx9GlPlsu1/GXXbyau/4vA5wI5cWNjcVSEN1cd1gBSxQegDUqEtIOiHEpCCNzaBQK0HNvZOKJARC
	MOzgHy9xbd0lJAJ+3XgWX7VQkpaDsqAcrgg8eC+qkqH/5opuxKOuWjMpsT2fdVLIwEC2n+T5NINFk
	h5aW4ffQ==;
Received: from ip6-localhost ([::1]:25488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sgpFW-005B50-Jq; Wed, 21 Aug 2024 17:35:58 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:48580) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgpFS-005B4t-2g
 for samba-technical@lists.samba.org; Wed, 21 Aug 2024 17:35:56 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc6adso46810981fa.1
 for <samba-technical@lists.samba.org>; Wed, 21 Aug 2024 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724261752; x=1724866552; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwGKPR9dScyEf6RIlTCNqkBAFknVGBL0G4lRztfOGK0=;
 b=AYPdNwRQf6ZvsEnEPevxBbrlnNSgU4s2YPKgPQuA2i2iSYfQMVU41mMozGWqIxVMhW
 HqH8DqH9bDBhDwyXpv8l8p6DNuj8x/H5X38SQpWSile6gi2t5CmYnVcwRgLK0VX4pawk
 wpirO1anEYBtQx/z1ztT6U4PCshd2tBrcoJHnUnhHYh0FINCieCo5si/xMrfzZduxK3J
 msJ4atrJVMQiFfL8MhXsw//YKbh+Ykp9ecmjAAjNOTqkUMEajsIdphOekPUlPX9uZneq
 MFMONGh72ywdvWdSiuB/XLKf7qd/926iBy4JX6eXS0xDA8P8Rj+1iLpT02UPczNxRTYR
 za/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724261752; x=1724866552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwGKPR9dScyEf6RIlTCNqkBAFknVGBL0G4lRztfOGK0=;
 b=XcJHv0kzzP+u7BKv0elZOQKxVHLlsHWxOm/xNl5PuhuX890GDnyGiqQEp1xungtxms
 CtxBUI48pSjV9+O3i87+wUQFsf9MhcP+CG4WIyA9gB4CjGnapbNJCLIgnciT+m2uCeht
 QPVtnmlr+QZaolS7lwBb3r7gnE63WRQ+E+TL+KywCC0x63SugW8xTYrZwaSrkyP/IFv3
 0+SYaVLuXEoGgKAe/pFIcP3Ypy7oyo3XwYr+qMRT37ItjtnE6yaRH/hKlBMtVD1p9CgJ
 BU7ZeBaYZKb04aAR9TCHkujgGkjS01IA4rvcmn8Y7e8Bq7UBAo0pgh6dKj0xGlje2v1N
 w6Wg==
X-Gm-Message-State: AOJu0YwNElBGjHd8qAYiq96jNwwBS1sEgcuEX0cB+gVTvrzEP+jWyWbw
 XACJPb7tjAorVL10ePuMVTVG1mwdoVRUemGzy4Xa8Uzki4nrDHqFhHw17Yhg7RBk9Oikp59jjiw
 VEk2aZJE21Jy3cHrLqrNDBy3jvN0=
X-Google-Smtp-Source: AGHT+IE9XAgPiD6lsAiAE5ZEFlqHmA0fIxRHDUJRB057zPRD7NZpTgiLXjh3OvaSEz1WN1GKPoqf8MG1hKeZ9J4bIrI=
X-Received: by 2002:a05:6512:2214:b0:52c:8aa6:4e9d with SMTP id
 2adb3069b0e04-5334855e05emr2626320e87.29.1724261751977; Wed, 21 Aug 2024
 10:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>
 <f1bc4bde-f1ff-4b52-9cf4-822f94b31a75@samba.org>
In-Reply-To: <f1bc4bde-f1ff-4b52-9cf4-822f94b31a75@samba.org>
Date: Wed, 21 Aug 2024 12:35:40 -0500
Message-ID: <CAH2r5muFV2+SXhGmkv5WYawtAyzK0D6y5hFLS4x6542cUwjACg@mail.gmail.com>
Subject: Re: Samba server multichannel session setup regression?
To: Ralph Boehme <slow@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ugh - I can't reproduce it now.  I added an additional test user
(smbpasswd -a) and cleaned up a few comments in the smb.conf file and
interfaces line and it works now.   My best theory is that it was
triggered due to minor difference in the interfaces line of the newer
smb.conf

If and when I can reproduce it again, will send you a trace, but when
I had looked at it before there wasn't anything obvious in the session
setup on the additional channels that wireshark decoder flaagged.

On Wed, Aug 21, 2024 at 11:11=E2=80=AFAM Ralph Boehme <slow@samba.org> wrot=
e:
>
> Hi Steve,
>
> On 8/21/24 5:57 PM, Steve French wrote:
> > trying to setup additional channels.  Any ideas what changed?
> can you show us a network trace please?
>
> Thanks!
> -slow



--=20
Thanks,

Steve


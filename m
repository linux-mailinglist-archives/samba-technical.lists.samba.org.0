Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2997D711
	for <lists+samba-technical@lfdr.de>; Fri, 20 Sep 2024 16:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pqh/bZ+T9L8M+txNpwib5x/ZdxAbVYapMeOQb/KqJu4=; b=OZRnkYtbUitA6f6GmoQFFLg1Zh
	SyGDpKEyLsSLQ82QHb4KNfKz5nhs5WEKvj9GthTUdFAby6hdK+ri+ckYB7X7BtrTB8Z1Aov0J8MJh
	IOcmsKt0QXvP8KFz0oHct68sK3UvBiZl/2veq4e9jk41Nx5a2HW0V725lTKWTSNSNcnMU1fEeug2f
	WEkSsSK4muSiiQ88WgmDhxehQM4lr1vO/z47s4HtsorLxJDFS5iWvXyKk1445FDoNJPXzF0ozFe7t
	lNv6FxUWT8yc2a3WGd6waPbzlSbuR5dzLYvfHWGlxNI61MSLnuNRUzerr1+2Rg4Ix8dtp8EePSaA/
	xL8x4pEQ==;
Received: from ip6-localhost ([::1]:38878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1srez3-000Q4p-Fm; Fri, 20 Sep 2024 14:51:45 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:58476) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sreyv-000Q4M-Uo; Fri, 20 Sep 2024 14:51:40 +0000
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82aa93774ceso97752539f.0; 
 Fri, 20 Sep 2024 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726843895; x=1727448695; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqh/bZ+T9L8M+txNpwib5x/ZdxAbVYapMeOQb/KqJu4=;
 b=GV1zXdBU2g56CJPf4XEcC4Cqd11DVY37tjtK82OekpIzrfMSrM2wKRsuNLyJPh/omI
 abrp4Y/UYluTztXxA8xh5OnNYptgbdFJIaM7SMsV5npkSPbzamzao2GAMuM7A5olrZEC
 8e7/LcA9yS2UD0UwxBoLizTIYghYElgbB29O3Q/anKSyLEWNS5T9HWFKWc87l5jxJDf9
 /cR1eE1eRaAsS4iQjG/PAstgoO0V8yait2wNGmDAPc0d4K82lB/f4P4QQQlgO2HeZmFB
 jcGUuwkOcpaLOQSMizHx4/zkh37qlx1eHLn+uCrjXIEV+ZoILk8f5l8sNTpTIAVt8KKP
 tkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726843895; x=1727448695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqh/bZ+T9L8M+txNpwib5x/ZdxAbVYapMeOQb/KqJu4=;
 b=M8u057C7qQ3s3sm/INHzJ5ADAsjCEO7eoEf77bbdXesniepOsCx7IuN7feiAfUPNUy
 qbkhs1Fn8aTAxPmQ5SSgt9O/Hs3wKNrs636h7jJeXlvsDHXCmjPSCPZlRYZJWvHhqlVE
 AjWa7S4nnTFBpKJPjGptUm/edBINa67DDkpLFwaArqyrXPWvHFmegqilxHpM54+dWN8J
 Cy+J98B1AYty1RmiAOBTuoYV5QIC3QViQihLxvQkOejEaSocjnamRh0J9Hm9eEi7bK//
 UDI0PDF+h2fo1LQY+WwrlH1yt7Uw0bkR+MQSi4ce6c6CmK2M2xi0vqKxJfZPFAqj6K/R
 qLsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJYiaLsN5DHxjTOqPCC4eSdMU1klcjT+tVQkjNJt294SBwdtwDBXOK3pCH2mbgpbwSh+Is0aWAmiGs7Kxc6JM=@lists.samba.org,
 AJvYcCXM2OvE13bj2HQeR2QYJNPjm8raPXI1aJI4lTnjhCPckT8qESH/Eskr0pSjQ0OuHc2y3EW7v7U=@lists.samba.org
X-Gm-Message-State: AOJu0YxrTFP47j/GZdgg1aHUVJ7KKk1seEZGDPwpyqx8uT1pX3bs/+e0
 yTuZ/V2fYX5OS2BtnJOmETcxTqyOvqyX6gqcm8oUSZGD/bwLmJy2RQ/GLukS2jeZUP0NHtkq3K+
 GEgJ9aOlbDyPh2OaKkwexG6LD7u8xtw==
X-Google-Smtp-Source: AGHT+IH+eyhg5X5HwyO75IULQprDRaymUIXS2k9WyPPnhPKuyRhxr9oE2ugDLQ1XCSIhxWH1zYpYiXwo2rGcIlzMPPA=
X-Received: by 2002:a05:6602:1615:b0:822:3d11:106b with SMTP id
 ca18e2360f4ac-8320b26c009mr281907639f.1.1726843895105; Fri, 20 Sep 2024
 07:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <21b1f3e6-9353-41e5-b651-c19b114596fd@samba.org>
In-Reply-To: <21b1f3e6-9353-41e5-b651-c19b114596fd@samba.org>
Date: Fri, 20 Sep 2024 10:51:24 -0400
Message-ID: <CAOCN9rw-5gUBt2fbrRhGwgr2qJd_ZWWiMP8eaLgcQ+5uTXrBtw@mail.gmail.com>
Subject: Re: [Announce] Samba 4.20.5 Available for Download
To: Jule Anger <janger@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba@lists.samba.org, samba-announce@lists.samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 17, 2024 at 11:11=E2=80=AFAM Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Release Announcements
> ---------------------
>
> This is the latest stable release of the Samba 4.20 release series.

I've updated my RPM building tools for RHEL systems, and included
tools for the CentOS 10 release. These are at
https://github.com/nkadel/samba4repo/ .


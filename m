Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD925E6CC
	for <lists+samba-technical@lfdr.de>; Sat,  5 Sep 2020 11:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NLkMct5gAWcNyXK5JjEOM2P4P0CGxVw6WsdZrQ1DlAU=; b=R4jFmXB7vvmULd5G5n7MzDDRAr
	RZajTq7NFi0Trpjc7LHuILJ+q8PWX2do42fTpSXBqxOZeC4shk9UGkPun3uOEXO0pLA8rxFCCyGLa
	+Hecn6S9t+dk1xcJZK80jw1ZAvwWaTW/ju8u70EJ3TX3qSpJv011sePRYEf+34HEvy30ha4YvFMgV
	l1qmD+6l6xpZcnC/2J3aDIPuDAxzbwMHRI9VtMTjzj6Pzq6G42psmW40wFnVsxQPOoZNpyYuakA4q
	foJxSvwG6eT3EajL6LobGI01yetgWXP7uupS9tmPfkXKGlQK4BY5Al3FgW2dadmMaKJZ5Bki6lQzk
	eV/Lsl6w==;
Received: from localhost ([::1]:50946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEUij-0048rV-8S; Sat, 05 Sep 2020 09:42:53 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51736) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEUid-0048rO-Kb
 for samba-technical@lists.samba.org; Sat, 05 Sep 2020 09:42:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id a9so1114388pjg.1
 for <samba-technical@lists.samba.org>; Sat, 05 Sep 2020 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smedley-id-au.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NLkMct5gAWcNyXK5JjEOM2P4P0CGxVw6WsdZrQ1DlAU=;
 b=zZ3kSnMcL384FyRmiY8KDH73OKOLUCjewTqqb9//YMwN7P8AOAs78JVTpXaVxMG6/A
 Zfs98VT8KfvwEQ6te23Xkl4JADvVIpv+JyeDtH8Pn90th0wDuhBBuRqGFmcDn4Bnbm+a
 xLqILfIxV/nJJKfIsTyiq2zFuncX79m0XcYQKCn3D+gjNsVjyBA4rwST2O7tY6QIqu/K
 qweeIT/tHH/+ozfX10LSNfWGJ34m1It+IbzLZCDYinMK13jJ2dOb7q/D0QkvBrbcy6S0
 gYVwiNSNHngNSrGbr+OGYbbDDWD7lL0fhzcEqNUWZew1L7Pzz2j59oKtpZ7BDpginYF6
 Sl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NLkMct5gAWcNyXK5JjEOM2P4P0CGxVw6WsdZrQ1DlAU=;
 b=L7V/GJhB4FGWIjPvShKaqyRfzYqwdK0h8KmweVD5YBM4QoPFJptUZ0S27A3NuKOwVX
 6LONtWruO66f1sbOG3Ius/a3r9nMEueu/GgEN2bcTmhjZgwBZHCwC8MWuRT3hBVjbG8D
 7KeKlx9xQwjdCzqSzdKssQaACgzHMg7ZEsHHA0qMwfXTbho2hWX6J2hYemM6SSdjIsx1
 FMOAXmZ57QEoAT7RrYYS86WWdPGOnqHu5mZA/I9Er9xZlPJNHvrviKT5Q6v9CGlx8t+E
 5ShK1bIJZmvf7GQ+gCFZkomnONleK7dK17al7NXaoZsNf2QQaKbAUMrSbfb8XRsOViv5
 /E/g==
X-Gm-Message-State: AOAM531hUsqG8vPIgD1bmdRiUtEgY7lwDqgYXrdAtLHEE5eeBsaG0eYd
 sAOr9980WXJXDLQYAIJStA6BH1wtqhJpbZCp
X-Google-Smtp-Source: ABdhPJzl6/hO24moepnnku3020UUGcjqbm++cl8Zu7IaeT3vgOPwR/fjoj4tmDX9BTvcy+Cikg4i5A==
X-Received: by 2002:a17:90b:408b:: with SMTP id
 jb11mr12447416pjb.164.1599298959415; 
 Sat, 05 Sep 2020 02:42:39 -0700 (PDT)
Received: from ?IPv6:2403:5800:5100:f00:2d9d:3a9d:96ea:7c7a?
 (2403-5800-5100-f00-2d9d-3a9d-96ea-7c7a.ip6.aussiebb.net.
 [2403:5800:5100:f00:2d9d:3a9d:96ea:7c7a])
 by smtp.gmail.com with ESMTPSA id m188sm9025109pfm.220.2020.09.05.02.42.37
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 02:42:38 -0700 (PDT)
Subject: Re: Drop Python2 for the build?
To: samba-technical@lists.samba.org
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
Message-ID: <8d1bb56b-c7b9-ac4c-ee19-2d08749aa56c@smedley.id.au>
Date: Sat, 5 Sep 2020 19:12:34 +0930
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Paul Smedley via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paul Smedley <paul@smedley.id.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi guys,

On 5/9/20 11:52 am, Andrew Bartlett via samba-technical wrote:
> What do folks think?
> 
> Importantly: beyond Linux, how is python3 platform support better now?

I saw this coming, and recently expended some effort to get python3 
working on OS/2, so I have no issues with this - I'm already building 
Samba with python3 on OS/2.

Cheers,

Paul


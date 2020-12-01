Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7B2CAB0C
	for <lists+samba-technical@lfdr.de>; Tue,  1 Dec 2020 19:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CGr7B3b8DeP993hMQ3OSckfFWP96IL5H7+E6KOBqmc4=; b=G7k6APzwPTzdRPHURDpI9g1RTw
	4t1Ccvnt2prHorwYmF75Qv//MqivqxmFUvjON4UabO/wvG6Ax9fffaGUoYsrczftOfEUMmGf8DGNW
	sLYSp7SUb92dg1wzLLjfrPJXg+vl1UyTT0XF0Rj+XgCrD3UevhLC8yYZiWAIQZcSyqnDdM9n3mRx3
	2By3d8JolCkZnqMTY/qtc7AQ6lwpfFZGohzus8CZld0OPsfLS4VsjLBgFzkYdgHdZMPLnkzeBQw8+
	25oMwV8DcbQVnIJKrByDJGQm/skyBOgx7eY+dDrKmzW+pqc8rw5GVb3d2l3rVTTxTVGDwELNIKIUa
	yywbvICA==;
Received: from ip6-localhost ([::1]:24134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kkAj4-005FdU-Ru; Tue, 01 Dec 2020 18:50:10 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:42903) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kkAiz-005FdL-8F
 for samba-technical@lists.samba.org; Tue, 01 Dec 2020 18:50:07 +0000
Received: by mail-yb1-xb42.google.com with SMTP id 10so2799627ybx.9
 for <samba-technical@lists.samba.org>; Tue, 01 Dec 2020 10:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGr7B3b8DeP993hMQ3OSckfFWP96IL5H7+E6KOBqmc4=;
 b=Pe6qYyWqQ52B+MT7HDPNuMu5JlBMxGeq5xL4xRkkEgLh4FhMA+AhY/1slkQN5yfoMl
 hHZ+krW4GXWrICaxlyF1Ub8WEl7aTMCzZyHnb0U6meU3sWMD8AktVehsUmBnV31bPKRc
 ppzO1YPnyj2aQpauw9uzNL8zw0wTmhM6Z9h9tbT2m1lNLp3t4ovHHXVz/iLex6nOxN7s
 w10UR4ZDXyOcnuFm1jfcSLS/Dfh5Y4PaXE4OmgLGBWLKQYnbW/9VrV1IumKC1yA7qZKn
 IybrALOzL8xFkXQtjZ8SgebKoBa/VNF5xGIovuvlxkhFDEwwokoHkzNlnSzZ/20GVHc6
 6k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGr7B3b8DeP993hMQ3OSckfFWP96IL5H7+E6KOBqmc4=;
 b=mDSxQyBBBSVKPG/lTSDM6X2z/NjjLnW+vOtkzvSbI1yo21VCfTJSQ4YnAft8IwmiYB
 mQ29PLfVx6gytmdaZqX37ZhiW5oK8wy5Ji4UPAwoaG4e1DcUiMKKQBXdMbYQkSDxT1hg
 2DxZl7u10lTNKT7iV3AQz0f6uTQ6Ud9l+BYP54tDZFIvi8NuiRgiw4NTrb6hGzee6Kcj
 gjIyn5a42CV1zNbH4bzNzaS7aXAZ22HMCDd9r4q6ghzFadeF87tKTLGlB7McFUBX8pcq
 3NsWnMJcNgLWc2eIp9I9S64j4iXuw+9jh9eE4P+g5lDPT+o8NjAhekhnTLmXMKzQwkjl
 iFdw==
X-Gm-Message-State: AOAM533MmxzeMgrZykOwujVpWJEnsA7PwKV8JOpp9gZvEofqJi98C8A+
 y6nUbRiz3Vx4LNiQGD/4nBjISRiNcQJFIH2ufuU=
X-Google-Smtp-Source: ABdhPJwplPV0pIGEtbWrgJyTO5o9A7cSZJTkdAUuG8zT0w5Xbp+1VhfJlRCdokS9NrceBWrkDVGuHHPDm3p7o+1LLeQ=
X-Received: by 2002:a25:c68c:: with SMTP id k134mr5901241ybf.451.1606848603259; 
 Tue, 01 Dec 2020 10:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
In-Reply-To: <20201027204226.26906-1-pboris@amazon.com>
Date: Tue, 1 Dec 2020 13:49:52 -0500
Message-ID: <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
Subject: Re: [PATCH] Add support for getting and setting SACLs
To: Boris Protopopov <pboris@amazon.com>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
I am checking in to see if anyone had a chance to take a look at this
patch. I would appreciate any feedback.
Thanks!

On Tue, Oct 27, 2020 at 5:01 PM Boris Protopopov via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Add SYSTEM_SECURITY access flag and use with smb2 when opening
> files for getting/setting SACLs. Add "system.cifs_ntsd_full"
> extended attribute to allow user-space access to the functionality.
> Avoid multiple server calls when setting owner, DACL, and SACL.
>
> Signed-off-by: Boris Protopopov <pboris@amazon.com>
> ---
...


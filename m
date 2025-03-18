Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30085A676CF
	for <lists+samba-technical@lfdr.de>; Tue, 18 Mar 2025 15:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4eHXb1JJwKi8XY92UdpcdgsAgcnXJDjXq8FHMGreXxE=; b=qs5xNp5HZBPgX+WLbKj/+YlIr/
	HJO7xjdEi2qafHmhhbvOF/HHNorF8AT/uYGn17Q1it5ksHjA41SLhHEkWKM1MAdANf0dyiy87oaMr
	4H3st+FduLYuFt3RPfSCiHtRWJL9LgpcXxkfkzbvWM/ajaPGuAfD42JJG5zq+0mzWKZz+a/DuEEmj
	1PWq4kbmQv0DQrmCZ3YLWdTdBNhoY8+b9tbgTqE6zFKMAUxEC5ZNhXSAnyfHeeIBxz1M/CviFDqKP
	W8M8S4whXM8ddtCR2vvoA/32zpnBJEp6o8L8TDj8PWfiQ5BY43yWM1d5xiceLG0kh4duMozRcWiFV
	neIme4yw==;
Received: from ip6-localhost ([::1]:37798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tuYGp-00GUAT-PR; Tue, 18 Mar 2025 14:50:19 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:48506) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tuYGg-00GUAJ-4e
 for samba-technical@lists.samba.org; Tue, 18 Mar 2025 14:50:14 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso57929151fa.1
 for <samba-technical@lists.samba.org>; Tue, 18 Mar 2025 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742309396; x=1742914196; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eHXb1JJwKi8XY92UdpcdgsAgcnXJDjXq8FHMGreXxE=;
 b=j1/zZZXtMgJ0Flss1tQ1WbtfbciWva4XyaEKizuULDxSoAddfbIl5ko/lz0KvRMD1p
 exQG2nxmwOlwAmaKVzxKfIkWBLT4oPbWFXTV30hlGmIaEjuiiOUXX1bRO7nGRy+ZRWSh
 +O43drVBrrtn/GXTgP2KieDppv3GW2R7unU9idFKSTC8e1AvkZykXoA4RjqMZ9EYa+BF
 AQCLKueHYcR/QzVTybewXEInvNTziGWgAQlbCkpSefjdDMXuEqghL7kKrTNC0Mk32100
 V75o4LjX7iOxza5m9V3TDc/HsvjdleB2BZULoWaB4NQlxzmtbcOEXNGzBKBPFegI+q/O
 hGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742309396; x=1742914196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eHXb1JJwKi8XY92UdpcdgsAgcnXJDjXq8FHMGreXxE=;
 b=usi4b3dA9U9lHfvOIlFQ+dqRw5VmhiBfSqdAPJbuVK5PoieGld6Wr5i7QAFrr9KMHh
 Ed6s2UHLZoIFaYIm+Ou2QhVYj8YHI3vmHKogwLyv+5nZhKVeb87hRW18cx9HdE8CL2hO
 zaFTsk0pXw9pAqEOtGNAycIp5zTXRbyKW0JzJMQIY25+Gml5VOkQ3t3WIhto42dXwZ2A
 RBtUinlg10hCbKdzBtKdAmxONV+ktjQjYSlPQCiZj4ix3DA/k2J2hdorkUEUrrvsNbx4
 4+4IK5r7ZZj/2zTnn2xr+4DbhzMmXH9Ssh/CUrCe4K/wKCWG9Wi7hOJxWxfs1ZoNV3W2
 Wudg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFi62qUWP1Q1QTYl2InSgkn47aHUL5AyCjRLyHe7j/t4bWHMLDY0oG8xo3wj1enodvp5OeXTnK6GKYTN+fLSY=@lists.samba.org
X-Gm-Message-State: AOJu0YyApeKRfvwgAqaTfP34bBrc8D/Z5DkTXEBSbD+ryfuLVfEEqbgR
 vYf07PvccdIlmqAklAEzBdldyNKGS81opEJLgaDEVa9vH06gFYGQPu71/mSUNRsDA7Gii7LzFjo
 xFRcqGnmaDqwxvONa51seojSftus=
X-Gm-Gg: ASbGncuMAB+tETZ8/ir3yFM9hUT5Qqub7xuBcihUInA2tZTY83PFNTQsbIo2Nviz3PM
 8wrjn+Jyx2sb3ucdZuWbUVNKJrp5upeKqAyWOuxs4PYeiaOzagBbRKMKLCpmCfDT9NkgJLRb1rA
 aeXuMAHdQMi2EPbPJkSrwAI7vYFTBAEZ6PR8o=
X-Google-Smtp-Source: AGHT+IH09hK0CrkfFyl72Ymld0x3NZIGZ9dWZ5oVaXZJT27nn59ki999I3o9tnuOR/rBdx5gTNoLwLJHRyHSud7cD6c=
X-Received: by 2002:a2e:a36d:0:b0:30b:c5e7:6e61 with SMTP id
 38308e7fff4ca-30c97559f05mr30289621fa.20.1742309396361; Tue, 18 Mar 2025
 07:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250218143005.1318886-1-wangzhaolong1@huawei.com>
 <CAH2r5mstBkj5-aHcXLpb8YzrDHS+nWhW+i_Kf8eJK15sFmJx8A@mail.gmail.com>
 <c056ce12-2b02-fe11-5f61-ce913b6de5d9@huawei.com>
 <6ae36cf1-a1a8-065e-d884-fe0810e607cf@huawei.com>
In-Reply-To: <6ae36cf1-a1a8-065e-d884-fe0810e607cf@huawei.com>
Date: Tue, 18 Mar 2025 09:49:45 -0500
X-Gm-Features: AQ5f1JoGXRKdUtVIs4RvMg5cTVqczq2w70ZRM9pm-3pDJhklYUNzk_zlQ1qVruA
Message-ID: <CAH2r5msH0-PrzW7rR07cbm99FWTSR4QXyycHLpUaAv9GiDELVg@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix netns refcount imbalance causing leaks
 and use-after-free
To: Wang Zhaolong <wangzhaolong1@huawei.com>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, ematsumiya@suse.de,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 kuniyu@amazon.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This was excellent work, and the test to reproduce the problem looks
excellent but didn't run on the systems I have tried so far - but main
thing I am waiting on is someone who is able to  1) run the tests you
provided and show the patch fixed it for them  and/or 2) additional
review feedback (the namespace refcounting is more confusing than I
expected) and if there is a good way to debug the namespace refcounts
that would be even more helpful

I would like to include the patch - but badly need others who are able
to reproduce the same problem and verify the fix

On Tue, Mar 18, 2025 at 8:48=E2=80=AFAM Wang Zhaolong <wangzhaolong1@huawei=
.com> wrote:
>
> Friendly piug.
>
> Best regards,
> Wang Zhaolong



--=20
Thanks,

Steve


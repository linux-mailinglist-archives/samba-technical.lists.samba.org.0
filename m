Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B119C6C18D
	for <lists+samba-technical@lfdr.de>; Wed, 19 Nov 2025 01:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=W94JZriMgEUJVWomLxr9aeHXHRoN59JIc1YueA0Y2Mc=; b=BxaPcrGppUybrtNYx9BIVqN2Wl
	8veL+aL4CNbBey7Co/uxlrcO6R4E61JTpgcBUdaBEzm0fkJ0l+1pKZd3KwrFVCNlNNt1YFF89BgPk
	sSGuWhlaUYAT1x2DIMr/CjP59GstyoNzvZwaw5JiGgE1h/syjjTmUpEANiGBe/tfI2yhZTHIZ04Mc
	Vra0GbVdXoIxpfUkbLILP57s7mkWmFjg32LxWowu62BpkKyGo1J3FXL7cI1xtksIQt9bgdEYiiBOn
	sBdZuOQYEuLDtLhGSZek9+T4xjGMDpaRC/x+lfYhFf+lnpZ6gzm/Q4QFQBu3eTva/DcLEmQN1h3Ls
	vwivmNiA==;
Received: from ip6-localhost ([::1]:39520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vLVkf-00CbuV-AA; Wed, 19 Nov 2025 00:08:49 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:61647) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vLVka-00CbuO-8y
 for samba-technical@lists.samba.org; Wed, 19 Nov 2025 00:08:46 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8804f1bd6a7so59519916d6.2
 for <samba-technical@lists.samba.org>; Tue, 18 Nov 2025 16:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763510922; x=1764115722; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W94JZriMgEUJVWomLxr9aeHXHRoN59JIc1YueA0Y2Mc=;
 b=b12iJLVAnuaOdU1NyjF3pJG/7se+wCk8SBRQUAEIFgfPYWlDfECyggCs4+hXXhYs2b
 /TdfAo2A6tdRbOczEPvVh2VY8+SJ9zigGzdJOXVupRtkm46Pzxxz1xZxl5n01qEJRGoq
 Fp0TbwBCXr9UdxcomDs5XpjdTXHzWg7Ox7fFWz7qyt+CWIT0dXvmhOLqvbiC0qv6IlVY
 IH0HgximmCNmH75WLiDM4tcN3Ng7LtH1EhyZ8N3mcUbyoT5ONkaR1pwLGTKClu18Hxho
 AuHqZruoZnt5oC19IWk2Ji3R+FT0K1d4Kd9avfgFVTYy6ig4uitCwC9NOxqugVoGv/t0
 sRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763510922; x=1764115722;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W94JZriMgEUJVWomLxr9aeHXHRoN59JIc1YueA0Y2Mc=;
 b=eAmEbS8DQ2IuU43nXAFmEkKgvEVfAKBT8Yiu1oEfLPC7VizHxe7WRIo1zYoLvJ8X/Y
 K20gb+ETcQRqlwfslPhBCnfedr4b/HL1/dpHsqdvZ0JKCPS1OaBA1FURS1FGt3JkPhqc
 YoYomwMlo+VtNj+JTAZW/uvWuuSy65FeimSC1ejDpyV4ZDfo1B9l09sS/bAx2QzIK6+0
 Cx+Jvsukhc2Bd40Icl1xiNowVjavC5jNxQoAGVhlLnSaJyNSv+yDEp5BC9O1EbQnR1eE
 xsFU4tXnI0hjdjnMLoRyvvm/0vvv/wrb7BhJgzVBJaCPkxFnfa5NeOe1KmYyUAh73jJ3
 FnYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm8UY9Wj4IYBba2t5k75ashJQpIMxDyAco/c2VdImovyYgLPVAz9UrYFbsfri59+3sofFd3fNxGY+yZnm0dok=@lists.samba.org
X-Gm-Message-State: AOJu0YzFbQ5s/M/UeFRS95/MtTECLYaOtGKFXRJJnO1g0fvCmJxJCtdc
 sVWzwmkcod4KAHQ0XW6U0SZyELQ7eyFgQCnkcYNAXd0W3vfP+zhUwrgPS8j5OO3HDJLrV6E9DVA
 cpP/xT5yNTJrwqgKZgHMpSvE4+FzXOC0=
X-Gm-Gg: ASbGnctpiXd8NCU5Wig4dr8bW8vQgcrJm5PhSYzZyVmgjSeUHcjEG5eZNv6nL/NuThq
 b2ryI/ziIreDQRPqMdZIH8453/KZgSON4QTtD7YJLC2GxuH1uRmeZV+OHNRSXsEIn2Kh2Y1OqO6
 6wP16L+Mg8z/8uWoJq0MXuhaEIj8Si1UsB2yxSYNIqpgXsNqSPnLbUZ3ixPmRrid4pk98LzR34G
 kY/mCd0NyF3PjnZfFCqf7bPTgT6YMqsEI3uw/YniIgD0xtkkdnrz0sj8P7mGWzXpkk7ZkndXRgY
 VKuV2BQ6IxSG/ztcViaS9z6DbwvHbVZ5r9kug2XsuhYu0lorOANFdNzenkOaIUshHmzoYyMZJ/j
 o7QEckGlRdkrsjzSIUi7m91p6Vb0167PXS7m8E/pOmfAarK3K6JrZnsgevbIVZyauuNYO68mC+F
 eazOrSzOazbA==
X-Google-Smtp-Source: AGHT+IEareUYWMb9eMEPxiXUpNCgvERyl+uPJraGVbzznqXjC/xqzTgDcH5UiWVSejpamYHsOJu6jHtyYpOJ18uQFII=
X-Received: by 2002:a05:6214:f2e:b0:880:4f97:d17b with SMTP id
 6a1803df08f44-882925b26c3mr240638936d6.19.1763510922382; Tue, 18 Nov 2025
 16:08:42 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5ms6CEykTOCFyJ4GVx2hBGX3EzrtNwgE4z+2_+LuYASRAg@mail.gmail.com>
In-Reply-To: <CAH2r5ms6CEykTOCFyJ4GVx2hBGX3EzrtNwgE4z+2_+LuYASRAg@mail.gmail.com>
Date: Tue, 18 Nov 2025 18:08:29 -0600
X-Gm-Features: AWmQ_bnHizEjya4WdL9153ruAB5KL5WSA7fa31UU8wpMfkZ_KMKuOrNF6taG4ew
Message-ID: <CAH2r5mvxS05AKK4XbMR_mvnjAdfQOurvrXvZqLuJmvGd7OYyOw@mail.gmail.com>
Subject: Re: Multichannel mount failures to Samba depending on IP address
 (single channel works)
To: Shyam Prasad <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On a loosely related note is there a way to configure the "interfaces"
line in smb.conf to be "everything that would show up by default AND
localhost too" (man smb.conf indicates that localhost and 127.0.0.1
are filtered out of the interface list by default - but of course it
works to mount non-multichannel to localhost)

On Tue, Nov 18, 2025 at 5:46=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Saw an interesting multichannel failure scenario to Samba today:
>
> Samba server smb.conf has
>    "server multi channel support =3D yes"
> in the [global] section but it does not include a line for
> "interfaces" (uses the default)
>
> On localhost, mounting to current Samba from Linux (tried various
> versions of cifs.ko so does not appear to be a recent regression),
> noticed:
>
> 1) mount -t cifs //locahost/share /mnt                                   =
 worked
> 2) mount -t cifs //localhost/share /mnt -o multichannel          failed
> 3) mount -t cifs //127.0.0.1/share /mnt                                  =
 worked
> 4) mount -t cifs //127.0.0.1/share /mnt -o multichannel          failed
> 5) mount -t cifs //192.168.1.190/share /mnt -o multichannel   worked
>
> When mounting with "localhost" or "127.0.0.1" as the server name (non
> multichannel) note that it does not show [CONNECTED] in
> /proc/fs/cifs/DebugData
>
> Server interfaces: 3 Last updated: 3 seconds ago
> 1) Speed: 1Gbps
> Capabilities: None
> IPv4: 192.168.1.198
> Weight (cur,total): (0,1)
> Allocated channels: 0
>
> 2) Speed: 1Gbps
> Capabilities: None
> IPv6: 2603:8080:2200:13fc:c82b:b16f:52c8:2329
> Weight (cur,total): (0,1)
> Allocated channels: 0
>
> 3) Speed: 1Gbps
> Capabilities: None
> IPv6: 2603:8080:2200:13fc:5b60:a7d6:77d7:72cc
> Weight (cur,total): (0,1)
> Allocated channels: 0
>
> Note that when mounting to "192.168.1.190" (non-multichannel) it only
> shows two instead of three interfaces (not sure why it drops one of
> the IPv6 ones) but it does correctly show [CONNECTED]
>
> Server interfaces: 2 Last updated: 1 seconds ago
> 1) Speed: 1Gbps
> Capabilities: None
> IPv4: 192.168.1.198
> Weight (cur,total): (1,1)
> Allocated channels: 1
> [CONNECTED]
>
> 2) Speed: 1Gbps
> Capabilities: None
> IPv6: 2603:8080:2200:13fc:5b60:a7d6:77d7:72cc
> Weight (cur,total): (0,1)
> Allocated channels: 0
>
> The mount failures with multichannel to 127.0.0.1 are weird - the
> first negprot/sessionsetup/tcon works fine but the second negprot then
> sessionsetup fails with the server returning with
> "STATUS_SESSION_DELETED" which seems strange (since the session is
> valid, and channel one session setup worked fine).  Any idea if this
> is a Samba server bug?
>
> Presumably the workaround is to add an "interfaces" line to smb.conf
> to force it to return 127.0.0.1 as a valid interface, but this still
> seems like it could be a server bug.  And quite confusing to users (as
> "Resource temporarily unavailable" won't make sense to them since
> single channel works fine) Any thoughts?
>
> And log messages are unlikely to help the user figure out the server
> config (or bug) issue.
>
> [12421.964837] CIFS: Attempting to mount //localhost/test
> [12422.032199] CIFS: VFS: \\localhost Send error in SessSetup =3D -11
> [12422.032234] CIFS: VFS: failed to open extra channel on
> iface:192.168.1.198 rc=3D-11
> [12422.137163] CIFS: successfully opened new channel on
> iface:2603:8080:2200:13fc:c82b:b16f:52c8:2329
> [12422.137401] CIFS: VFS: reconnect tcon failed rc =3D -11
>
> Thoughts?
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve


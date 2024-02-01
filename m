Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFDA845F21
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 19:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XO6MI34sx7y7sKtG0/owVEIu61lP2sL9c6sYjJfuMnM=; b=5arDFZB/Cyvxy4YWgG+eVKt9GJ
	ZEwKeC60tm0RVJ/JaM/ycL1zHDHJsvKi4Na8sMz6RoKI0AdKQjgb7rTrGLZBXRiBbJSvXLxpw04Hl
	7+UNI088rfNDOpltS3FPsDWGvT5HykwXKLlbk1KOJsU7CC1rT39R5duBAtUyM4LsYPkAI8LPZNWEm
	UtvRIQFxHgxIDZmgIFzV1YUHHv9Q9bvUmTGykBWMZWjoJO2sMPgBRhgT93RbcCN/p2GCc9fNmheb/
	s7YwW+mpvjVMeCLme28lGfmowgKsTU1vC18Ft5tCJB/zkRHRXG512jWfcQyl2j4zUsgjOm798/qYR
	r3QsO2Ug==;
Received: from ip6-localhost ([::1]:55764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVbO0-007ILY-8N; Thu, 01 Feb 2024 18:02:04 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:54600) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVbNv-007ILR-NF
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 18:02:01 +0000
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5112ea89211so1165626e87.1
 for <samba-technical@lists.samba.org>; Thu, 01 Feb 2024 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706810517; x=1707415317; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XO6MI34sx7y7sKtG0/owVEIu61lP2sL9c6sYjJfuMnM=;
 b=iVz9E9RT3f+tIKa8WOHt4aEx0V04fZAVp0wxnGk/kH/H2IglA6ZD9Id32DaULH3tsz
 Mwmwi/EP0ZbgOlyrPmEOV/Do2F7+wlwMixph8RS471Mv48Z3YNutuh1/BICaSUVRk8Xe
 Hd4HnlwDUlNbluTqT028FGLrhCw1/qgD/fSx934Uv8Obz2XJ1XVvY5bPYsyg8MV1Ds9i
 TFHBt6mCm7MPktP19uztgwcYEQvvz/GSesx8MSbHWegwKsXJ7sdnEDLjfZW2JMBelC22
 Ht0Ui/NCKxT28jfK4BG60u2flnBqKMQfe/SYvQIgV0kYNkv+4ImVdHawoEBskBSLdeFR
 flkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706810517; x=1707415317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XO6MI34sx7y7sKtG0/owVEIu61lP2sL9c6sYjJfuMnM=;
 b=GV6TEAjN3wzGn9DVW9fsrGYS1u2DVt5c+s0ATefegQUgN54jWpEZVffslkJ14SeoDU
 zBhVHU/b1xkvWIAqmC6sQPpuMw3gQ3af4NKwgl+vndijR59ql8lQyB1dXmdU9Zra/o6X
 O4/NcHwuh3hco+uZvFHrtuzqPp0EVBJ3wenkZigFML5uf1G34B9ozDg1rOylvf77jyLo
 NrkfHUBv++z1TGzstmyNIqxhP9PACtVPypYWIJIjkLhycCo6UX5mg6nrc5/qZIhB8no7
 m3/ARShXHXpxN85jLAa2SaKkisWy2qZr8/wwNhVQNxyjFScLdwMZlPyPqxztHehdcNgR
 JM2w==
X-Gm-Message-State: AOJu0YzgSxNK2xo7JbiTuItSG1ZWTocSWu6F3Kp4qbwp8b6p+PNZJ04h
 O7v+P6/lPTdvz/YFsSh9cQ1l0DhD2sEUIwTWeXMNZNjXsBUXbcnT9wRynMXi4HeT9j6HlyYvq5o
 LZwjnDvVwQwLm/iYh+xCK/egzC+Q=
X-Google-Smtp-Source: AGHT+IHuqoNPXgvjEts1kVWihMQu4JBgCDfOEuP3f3vDrRUiz+eDTghA25P/bF2vzA9TqscdoYX0lhuA7pck61vIO68=
X-Received: by 2002:ac2:4579:0:b0:511:33d4:c99b with SMTP id
 k25-20020ac24579000000b0051133d4c99bmr127913lfm.43.1706810517341; Thu, 01 Feb
 2024 10:01:57 -0800 (PST)
MIME-Version: 1.0
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
In-Reply-To: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
Date: Thu, 1 Feb 2024 12:01:45 -0600
Message-ID: <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
Subject: Re: State of unix extensions and symlink support
To: LuKaRo <lists@lrose.de>
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
Cc: Paulo Alcantara <pc@manguebit.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

To clarify, are you asking about symlinks that appear as symlinks both
to the client and the server?

There are many cases where emulated symlinks (that appear as symlinks
to the client, but expose no security risk on the server as they are
emulated) - "mfysmlinks" (also what the Mac client uses) are preferred
to enable.   The Linux client has this mount option so that symlinks
can be emulated without requiring the server to support reparse points
(see Paulo's recent patches for example) which are common for Windows
for symlinks or without requiring the SMB3.1.1 Unix Extensions.

On Thu, Feb 1, 2024 at 10:17=E2=80=AFAM LuKaRo via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi everyone,
>
> is it possible to create symbolic links using the Linux cifs client
> within a Samba share on a Linux server? Or is that entirely not possible
> at the moment? I have read that smb3 unix extensions are part of Samba
> 4.18, but only when compiling in developer mode?
>
> Thanks for anyone who can shed some light in this regard,
>
> Lukaro
>
>


--=20
Thanks,

Steve


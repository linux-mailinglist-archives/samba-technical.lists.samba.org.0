Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B09131FD
	for <lists+samba-technical@lfdr.de>; Sat, 22 Jun 2024 06:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PjkLr3hnbU4GGot+aDOsUETk9dtYm8kWyhcqcUqDqRM=; b=hh1zL5e+rWwrk9ae9wBlp2j9Mz
	Wk0kn5Vpci77yq3fBGZHeZk1OqDv3XFJJbGmGi8ZGdybJKlXbaByutMhIWWouS7mD4HVDTmPRKtOh
	T8WPijzuu8PnWHVbAJGxZsWCaHJYU3ki+LuW/TVvVJvYQyPxm/8Zp1AM5rSXGvld4+afPkXJpDK6t
	IAgLp1zTirWE3HLymYv0XnjQkaSGemT5TuAszYppDI0B62dhb0uMhcyNaqwBEnLU54npV8DvB/2kw
	FSVGYMH5o1ErFzEmMfsmm2hBuYA2SoPJLCKe/kNIbxS+Tx8oOj8h+LXYmT6dFAGJ9A833uyJ/Oqqe
	SN7itDuw==;
Received: from ip6-localhost ([::1]:24762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKsmW-00014u-1R; Sat, 22 Jun 2024 04:55:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:56359) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKsmK-00014n-M4
 for samba-technical@lists.samba.org; Sat, 22 Jun 2024 04:55:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-364a3d5d901so1933475f8f.0
 for <samba-technical@lists.samba.org>; Fri, 21 Jun 2024 21:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egnyte.com; s=google; t=1719032108; x=1719636908; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GVwKbGNaKk96ET1ZnEV9Itlwc1KP2IkXr2PclAetGIk=;
 b=bHQx1pjJ98hBHiRRC26lq6XF7sxGF8bMhtDIIvqchGHjuRxkaAMdpiuT1G+8fmcovu
 B74iC8gSyvTISkFxSZeXf0l+0bU4q/2Xl6pS0k7lQezGrCQUsG/LkfQOiYWekpmZQb5Q
 Vz6MfhFSSC+4l5rlVBHYXlS2rgj2FjrtDaCEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719032108; x=1719636908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVwKbGNaKk96ET1ZnEV9Itlwc1KP2IkXr2PclAetGIk=;
 b=JtjbPCQGZdgAw6VKTGmR+LoWBho/m2W71EBydMIc8WXgaRQv++oWz81M4tbkqwtQ8u
 bUxo+e5nIJHJn6olPKcLelt7AHhr8gl9wpatgiPaytL1nAdxB/AwE8nRlLwIizAdJqdq
 Xvs/e5YFzZNtG65pEEq11vFBVkWlfuvVgdNaUe4oRFywgYamXGb0uMeg0p1turMscru5
 m7lFI/dLu+Ii3uIGeEeVspEZZvPXudauWNztcf/N92+787+YX4JAYk4QZjta/iN3OZU8
 2jrwZ8Qm5Ups1R5hModPu6+JjJklK0DEcGCbCJtZ0BzX9BkkHe8HRWZVYvnclgELqaGU
 W9nw==
X-Gm-Message-State: AOJu0Yx1ZmzZv+p7gS+h4hM6sQulQ8PwrBI7stNsA3X6VOZVkgaJnrzH
 38BIjEBVh2X5EuJQis6yE0xDjMnU6YEgoT/YYtu4+KvVRgWEVI+4rvjZH4sdAQtgj6cU7CcqBfQ
 klWwH1K9Z9bjl1izMC3AgvKN6jwdlkFVo1SkHvQ==
X-Google-Smtp-Source: AGHT+IF90lUO1HyjsAlxD4rLY5+B2urR0lINfKOWldLJm5q5QTtPC702aJy03R9nBCGXBX7OwKcpGcsDiPmJ/QUvYrM=
X-Received: by 2002:adf:e443:0:b0:362:9888:c37 with SMTP id
 ffacd0b85a97d-36317b82b6emr6773053f8f.35.1719032107401; Fri, 21 Jun 2024
 21:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>
 <6f38ea75-1646-48fc-8bea-c7cf28b83c07@samba.org>
In-Reply-To: <6f38ea75-1646-48fc-8bea-c7cf28b83c07@samba.org>
Date: Sat, 22 Jun 2024 10:24:56 +0530
Message-ID: <CAF2c6-Gq4O95Hu6pRH_5pj=W_48an9Bn3777y2s-OLv+6OrMkQ@mail.gmail.com>
Subject: Re: Understanding fstat call in streams_xattr
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Varun Mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Varun Mittal <vmittal@egnyte.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Going through other parts of the code, I can see similar jugglery being
done at other places
Adding +/-1 to the ea lengths.
It seems my VFS backend did not return the expected error if the attribute
was not found.
This was causing streams_xattr_openat not to create that 1-byte attribute,
which fstat was expecting.
Once I changed the error, it worked.

On Fri, Jun 21, 2024 at 2:28=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:

> On 6/21/24 6:32 AM, Varun Mittal via samba-technical wrote:
> > Why is there -1 in the result ?
> > If I simply remove this -1, I was able to get setxattr to work
>
> that looks like the place where we're stripping off the trailing nul
> byte which in the past was required to have in order to implement
> zero-bytes sized streams with an xattr backend when in the past xattrs
> didn't allow for 0-byte sized xattrs, so we had to store an empty byte.
>
> -slow
>
> --
> SerNet Samba Team Lead
> Samba Support, Consulting and Development
> Samba Team Member      https://samba.org/
> SAMBA+ packages       https://samba.plus/
>

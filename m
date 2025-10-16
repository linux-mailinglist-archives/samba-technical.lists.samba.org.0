Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4FBE12DE
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 03:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NhXpNt5UXUXiz5jBvZva67jJz20jfIcaD8d1CiGWqnE=; b=4M77HZviaGBTGM2MSrd4AYXL2C
	E22JFMBT/NbqpsQOoT8C39te76U0y3ScyVCOMf++/9dYNSbZeH5fgCnM+XiWETXBCT2sqCvUZKrqi
	L7pb//CacYgaUK9j2QUq5yqiZPoXVFBm4/UY7p0VzN5w3Fj5oLX3jGaTidEg60T4baGQZEGXNj3/q
	GhdBab0z1b/2UQkBAC9bWIYbJGBT5WW2N5QdQVdWvp/XW6MG+4Fs5XqhfEbkFs6eoCixsO1Pk//Yy
	cVi1t+u+kMkUAJVy0qDqbZIDd1VdAbcmt5hP8Jn6bwiESjQqzdEI/62Qq7xdye4fonpdUKdYqhOJn
	v80yHoDg==;
Received: from ip6-localhost ([::1]:22554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9Cy8-007tov-5f; Thu, 16 Oct 2025 01:39:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:57848) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9Cy3-007too-PV
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 01:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82B966034F
 for <samba-technical@lists.samba.org>; Thu, 16 Oct 2025 01:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E409C4CEF8
 for <samba-technical@lists.samba.org>; Thu, 16 Oct 2025 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760578783;
 bh=NhXpNt5UXUXiz5jBvZva67jJz20jfIcaD8d1CiGWqnE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ehR4mtxZpG1HtChuZG0ohdH4pnl84kRn0mCw9JtZq/csxlFhXIJFvHzsN/kXkjjWI
 PxWERL6D8BLhYCmnN+W7ve2qwHm8eDHy6liyFH8kbGLTfJruUO57GPdm/I3sxwgNZf
 7sdpZkWd8xQ4tc8m4PKclyO5iJ57Kya8xDY2EG76iNkeQlsgnhWV/pKZwCMs1wfgpg
 z6Neh7XgsjmjnVt7WXB0AzOIcwVrD2DbYT6Zxf6zxozuhmHpqovuOJ2nqeNYQsLx0u
 2j27TErBU3/vybHGhQ6rbQaj+95pT4q5+Uel6lA804gs2cgQEjgaN+MLzeQ7HdYt67
 ZHT6fKaOLhvyQ==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b457d93c155so20671266b.1
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 18:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7kULlbNJiSpuyVznOMwXMyWSf9TLsS3OXheBiwUj5YEqrWwz5kE/rk8x/JxrAbVle45GSZNg+1qYSABWHqgM=@lists.samba.org
X-Gm-Message-State: AOJu0YwSv3Azf/uje4OjZ4C5houOiDC+eqpU19WQYzV6DymYuXpe8iZJ
 z7U//eYcRknRUn6o//FBgGO3oieDlu3hWfFBUvz9cJRgdvyyvMiIGoik5s6oG19qQz11y2IIRZa
 lQcIiu1Zg4yF24vebz56dID5by9Cpj0M=
X-Google-Smtp-Source: AGHT+IFkuj2gn7j4EKFSb8mXxfaPao6rWf4LSgGhFV/1DY7kYAtV9Z2dgD6/f3T5VanUmKryMjD3HNMvXh6rn8NDpWk=
X-Received: by 2002:a17:907:80a:b0:b48:6b19:e65c with SMTP id
 a640c23a62f3a-b50aba9d735mr3027700166b.42.1760578781745; Wed, 15 Oct 2025
 18:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251015150527.1109622-1-metze@samba.org>
In-Reply-To: <20251015150527.1109622-1-metze@samba.org>
Date: Thu, 16 Oct 2025 10:39:29 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-qN17m=CCnyUksiZZD0F7221kFh9xpV0FhRk8hSQiNgQ@mail.gmail.com>
X-Gm-Features: AS18NWCrRIOBjY9SmWEj0Dw7rfBTOpn4PjO_y6WdvXCqZgpA9Y4_1st5Jo8ZUec
Message-ID: <CAKYAXd-qN17m=CCnyUksiZZD0F7221kFh9xpV0FhRk8hSQiNgQ@mail.gmail.com>
Subject: Re: [PATCH] smb: server: let free_transport() wait for
 SMBDIRECT_SOCKET_DISCONNECTED
To: Stefan Metzmacher <metze@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 16, 2025 at 12:05=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> We should wait for the rdma_cm to become SMBDIRECT_SOCKET_DISCONNECTED!
>
> At least on the client side (with similar code)
> wait_event_interruptible() often returns with -ERESTARTSYS instead of
> waiting for SMBDIRECT_SOCKET_DISCONNECTED.
> We should use wait_event() here too, which makes the code be identical
> in client and server, which will help when moving to common functions.
>
> Fixes: b31606097de8 ("smb: server: move smb_direct_disconnect_rdma_work()=
 into free_transport()")
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!


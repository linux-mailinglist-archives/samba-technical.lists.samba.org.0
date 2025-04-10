Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC3A837C4
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 06:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k76mb+u7zApBfWzu7BVrx90hjzt5rYt8ED6AW9HTevQ=; b=t/OBX5BftPB0Ngq8IUAxcfXyvx
	e8tQlSRUZm8kRZVJeNBD2mkhTdWj/fy4dVEkhoqsfYbB6wtIpsSBOauCFMpwpqusNQmVs5wdsl20m
	gLdVbucS0R/0J6d4uh+cuqvQSsetZs5aCOcoW+MRnzCU591uNpGDdsQQj6kmyhS28a9FOQ/oifQyL
	FGkUzn2Rm77ka6Hwa10xv32QpVTVsZSfAi2i9VXuPF5FHt9zlPkWWQ+P+UpNMDno0mr56Q1mpoP8Q
	MSj9DjCf8E8L6W+YXsqABIdCGmTjf1yLu9Mpi5+ZwKKyw6FEj20PUlejx3UIxtuDR0o6kjkE4pAVY
	Y8YbMl5A==;
Received: from ip6-localhost ([::1]:57378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2jS4-0025bV-KW; Thu, 10 Apr 2025 04:23:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254]:45280) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2jS0-0025bN-Ia
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 04:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B5706112C
 for <samba-technical@lists.samba.org>; Thu, 10 Apr 2025 04:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADBEC4CEDD
 for <samba-technical@lists.samba.org>; Thu, 10 Apr 2025 04:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744257894;
 bh=0E3g6a7VU39tX4orEaXaCrW/m/DxKNviAA7Os2YbDYg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S8y/vKdgiMzTS64aRvtn9zHgJ/uQXrtHMcEb71Vur1crITVb4h7bZIvZPaMFYVY9U
 mRNu6nFIHgQyHEAEFtXp8EuAKJOcdSWfDCkxAGiOquLDgytc3Gt0AJ3mOvcs92bnaC
 CYlSvqiYEaeAOO99s2HByPnW5PTmUAlROlUx4X0ufaqbYdYQ+3uUiJvMNhfGkbNK4U
 zEsZ+07GWKegBerCbRxFSAezd4lQtcrtipVXxRlTKysM0Q6ZEUdEuXPL7jtXD4s2pP
 GH8Q4VDbah/N4TrCRASJibS4LT3q7QpjEQyxL5RF9NfetzywT8Ou9FCq8hqHyoORQa
 lCidzIsJ48mzQ==
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2c818343646so218745fac.3
 for <samba-technical@lists.samba.org>; Wed, 09 Apr 2025 21:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXaBwhemI56AmJOKQ9coPHZrqhlmf524b1sq9Q4uKONAwlSj6mrGqmNqpxlGD0TAB6dGVjTPcxhYjiAsMYfvu4=@lists.samba.org
X-Gm-Message-State: AOJu0YyMWxazhD/Di/AIysgt/L041FW+mqeL1QigiqT7R0wA1hf4YikE
 GDx3V1MPTL67t/f/EtYnddhZSFNCPdNt0pmrtviqGl/K+yySgSZaarHtIMPx1j4dhxnClI3g08D
 qP/ngRNBYPv3Hsd2QnfPCN9p5v8w=
X-Google-Smtp-Source: AGHT+IFYnyrAHsAH/wwBWUWeV6+zdS++LQaHBq33b2XuUbkgGwmSTtI6n/I9yma2lDqUlhHYGZyuUgavDIL0ATLYwxc=
X-Received: by 2002:a05:6871:71c5:b0:2b8:3c87:b491 with SMTP id
 586e51a60fabf-2d0b5e370b4mr531321fac.26.1744257893982; Wed, 09 Apr 2025
 21:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtHccZDP-QdWsb508iNpjeaCPsC8bxrpUgXk3y77aEcfg@mail.gmail.com>
In-Reply-To: <CAH2r5mtHccZDP-QdWsb508iNpjeaCPsC8bxrpUgXk3y77aEcfg@mail.gmail.com>
Date: Thu, 10 Apr 2025 13:04:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-4DUOKDHKKxO0rrTCeMCfMrxzRwzMzdSf3ZY6BBUMrPw@mail.gmail.com>
X-Gm-Features: ATxdqUF-pnGzPiRnutQkRbHYArYewg0nASIQIZ69WO0YMWrBHgnBgp6iEJ0VutA
Message-ID: <CAKYAXd-4DUOKDHKKxO0rrTCeMCfMrxzRwzMzdSf3ZY6BBUMrPw@mail.gmail.com>
Subject: Re: [PATCH] Add missing defines for new File System Attributes
To: Steve French <smfrench@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 10, 2025 at 12:55=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> Trivial patch to add the two new defines for FileSystemAttributes
>
>
> Two new file system attributes were recently added. See MS-FSCC 2.5.1:
>            FILE_SUPPORTS_POSIX_UNLINK_RENAME and
>            FILE_RETURNS_CLEANUP_RESULT_INFO
>
> Update the missing defines for ksmbd.ko and cifs.ko
>
> See attached
Looks good to me:)
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
>
>
> --
> Thanks,
>
> Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E046B0BCC
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 15:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=aZ8wXtwtKfacUTuskFUHk2le9eoctQ/jnsI5C4vqgig=; b=GsDeOvbpxV6yy4MSclojMVbskz
	SdWr/M91uT7lwQ15QQU60qyqFgnOim7LZjUsGc9o/1FqWaLSmXpoG6+Hyen3TvIcNN/BlFlYJKZ8Z
	aNRx/g0ut8Hq2TkS4bBpgwZGtgweBi79YkpDqlCxkPsBqmybVUXIGeA8bfZcb8/Jh+eExZh2/qWNK
	Dkqbm4Wr6Pt6J1ILvX8E6CxRmleKel7PkMUpGifOCAJnPYzS9H6RoadKBvvyBFYdihEo07aCnLZew
	z3g4/rgajwr9p9EFGA9B/NCC61f/jctFL2P1oi74qAOVA1s045Tjh45R9rcfR6XRo4lKo74W8B+md
	tP9UZH/g==;
Received: from ip6-localhost ([::1]:47034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZv4t-000I8D-B3; Wed, 08 Mar 2023 14:47:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16144) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZv4n-000I83-Re
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 14:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Message-ID:Date:From:CC;
 bh=aZ8wXtwtKfacUTuskFUHk2le9eoctQ/jnsI5C4vqgig=; b=GQ4Rk3V5CkOjJjzcFbMcpVWy6K
 AJfd6YIlsAhrGpCGzMvzSBliDfvNB9xcZ7YKSwLCnmywg4wq4TESI/PRke2L97I+bcOQg8navl51x
 fv6r/PYBzPsX7Mce0DvdKsOYKJqGhmEar2D8Epf6cZphbz9hOdJS8fJBfRn2tk16dQS1Y1zUGiJ5I
 7czVHj15rbPlCJbGp5wr0vFp56oM2jmFGwubr+pRUVqAc9ijIXm38IXGgJEguF+UwpktraVhJ2xRn
 1RgkoXlPv6mQ0CslBTIym3sIoTI2ReBCZZJduxgHf2BXb9yWzLLgAGoTp77Ol3n3t07rnvR5JemMf
 /fz768r3uQ3yWj7jH+ywmBEdSYdnI5ggLemYNGdULyLH+aiRjXzdDCwpzQAGq4G/G3TP7ludDFJWl
 u42enRYu1+votBDk7P5bh6+PB3zMSj1XN4bVV4Bq1rzXRjVeMTxMv8vJfiRmhQHf7PNNQQlXdnm1Q
 t3ubO/Kyuqp4JyvST26e8rDm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZv4n-001Ttp-6Z
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 14:47:33 +0000
Resent-From: Ralph Boehme <slow@samba.org>
Resent-To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Resent-Date: Wed, 8 Mar 2023 15:47:32 +0100
Resent-Message-ID: <9d4f3484-bba6-70a3-a0d5-429034ba36dc@samba.org>
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37638) 
 by hr2.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZuQS-001TNi-Vk
 for slow@samba.org; Wed, 08 Mar 2023 14:05:58 +0000
Received: by mail-pf1-x429.google.com with SMTP id z11so10283828pfh.4
 for <slow@samba.org>; Wed, 08 Mar 2023 06:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284350;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZ8wXtwtKfacUTuskFUHk2le9eoctQ/jnsI5C4vqgig=;
 b=SQ55UPjGhNouv4KQ64VxBXY8Reh2MNcDUO6TSyLBVNCZDT8axL+XOWQIFHVjqQujEm
 ioT/CWZgZllW1S1Tp/SEFbUVkdDrK5jqxOSYep+NUz3hgzFJzc507Sy5L47z14ZmSnxS
 D/d2HqePpHuUucrYbt5HLQeXZQ8T/9PD/9T9hSMuffoIqDzERGlIfqxZ2+nP+iHl53ki
 +VXBGBx+LKHgfTZBTEj1Xc8LQHqgX7TNtDom6Ug7zVmkHsvwxAfGvLbrDaO/nPg3C1cC
 +xsdAhGefegzO1lZXsyPtHwu7Q3nlRNAadIZvmO7lfc95kHotHPbmLCyzk2otzTpPrK+
 kYVw==
X-Gm-Message-State: AO0yUKVFy6TBCQis7PyDAICoPZbX4hJipiFPnRah8mRTNpgNqF5s4fzI
 1Yj287HbQ4DOAoD/xeA27Sc8B2/DOnv6TbWyxxDnvgsGidt//q97lsuwyw==
X-Google-Smtp-Source: AK7set8FY4kidMLcJTLzqVixKSp71xozHHGz02w/bH2cKpPgLnYQcPtQ228yTXe0JnB7Z7Ny7xjW7iYRHd4Vq0VXDvo=
X-Received: by 2002:a62:8787:0:b0:5aa:72b4:2fe1 with SMTP id
 i129-20020a628787000000b005aa72b42fe1mr7794898pfe.1.1678284349756; Wed, 08
 Mar 2023 06:05:49 -0800 (PST)
MIME-Version: 1.0
References: <ce3c72ee-b260-5913-e732-755281476aa1@samba.org>
In-Reply-To: <ce3c72ee-b260-5913-e732-755281476aa1@samba.org>
Date: Wed, 8 Mar 2023 09:05:38 -0500
Message-ID: <CAB5c7xqb3peqrnbUdqWj9ba5Dr2Whz8ZiANJKHWYZpfbvMx_JQ@mail.gmail.com>
Subject: Re: Status of openat2() RESOLVE_NO_SYMLINKS on FreeBSD
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Mar 8, 2023 at 8:48=E2=80=AFAM Ralph Boehme <slow@samba.org> wrote:
>
> Hi Andrew!
>
> Do you, or anyone else, remember the status of using an analogue to
> Linux openat2() RESOLVE_NO_SYMLINKS on FreeBSD?
>
> In case you don't remember (iirc we've discussed this before) openat2()
> RESOLVE_NO_SYMLINKS on Linux allows atomically checking a multicomponent
> path for symlinks which avoids doing the work manually per-component in
> Samba, which is a performance hog.
>
> I see FreeBSD openat() has O_RESOLVE_BENEATH and you were talking about
> adding support here
>
> <https://www.truenas.com/community/threads/truenas-13-0-beta-experiences.=
98936/page-2#post-685088>
>
> I see a bunch of MRs in the work from you on gitlab:
>
> <https://gitlab.com/samba-team/samba/-/merge_requests?scope=3Dall&state=
=3Dopened&author_username=3Danodos325>
>
> But none of them seems to be about this particular issue.
>
> -slow
>
> --
> Ralph Boehme, Samba Team                 https://samba.org/
> SerNet Samba Team Lead      https://sernet.de/en/team-samba
> SAMBA+ Samba packages                   https://samba.plus/

I have a WIP branch to add RESOLVE_NO_SYMLINKS here:
https://github.com/truenas/os/pull/256
This week I'm planning to go through investigation of Samba 4.18 on
FreeBSD and validate that the flag works as expected. Then I'll begin
socializing it with upstream FreeBSD.


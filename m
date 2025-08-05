Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5DB1ADA4
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 07:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JxAFZakqSI9Nx20jThuvOg1h+zHRc2zti9C160ZI/sM=; b=gKEmPp3rHr51miQ/uSShqAjiL2
	6TrIKXnHg+GyR7MwQm5ef/U1AAVs5RiYYjLWXw2QZtUahjSPjVXcLO+51rAuqVtO3JHHVA8iz48he
	B/uZTbRDPgekIYgx98uE51FIopxf36/saC6QBNt1axT5Yv4zqw1tIz001jVf0sK2YefIvtmhYhIaG
	FgGy/tlNi9CJ7VbCNdG5gf0AlmWVR0KlIOxiDROpgKL4Nxh0cP6jswb9AU/drtmoESdimGOUk5h9i
	ScM9jNkfZ+u1sMXCr+pHOEe6uZCrpAoyehXzLMXKAY481yeHcugFWLJ4H9VhYNyQo8SOeysXVsxlV
	vtAJNoAw==;
Received: from ip6-localhost ([::1]:47802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujAU0-00EKJV-2A; Tue, 05 Aug 2025 05:45:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:49396) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujATu-00EKJL-8A
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 05:45:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-321265ae417so2108321a91.2
 for <samba-technical@lists.samba.org>; Mon, 04 Aug 2025 22:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754372699; x=1754977499; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxAFZakqSI9Nx20jThuvOg1h+zHRc2zti9C160ZI/sM=;
 b=KtUq9iYYi82OfUq/Jxi5rcktMdjQnqV/lslTmSQ0/HBd0g3NVki/flt3L9kHMyzBNb
 OfTO65axFpcQcngzZV5ljFTTRo51kYpdhJ3BdDwgPDownosYY71tRVR3SeHIcQ0hGZcV
 ln3fyoRibdsgaHKC2nn+uMSK+4aAtprqr2Bd/fCyrzMOXNoJAe+f+kqpEONRgieo4ouO
 qRS2WXf5+wE9RlbSigh67AwI9/1WbdklFFmXxQe0Ddb3zi8n1H/O9v4eCDV6Hp1wUtqp
 YirmvvUvfUzeMlDRDbGdpZuZcV9MyDlIVXUkX52ZBx6O1QFRBilBZ+gEGuk2Poth3+yv
 0p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754372699; x=1754977499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxAFZakqSI9Nx20jThuvOg1h+zHRc2zti9C160ZI/sM=;
 b=WcAlDJ2Aa7G6fYavVKLCzDk0zoBXt/7aH+BC5GondtXXRoR5Ss+VQ+dDKwxRNe48So
 CqVcvjOook+eLgGH4ejBtK51p/J2HB0vCIxTeAMrULGD8Q904uzf4U8BTKBTPRjznBep
 Cl8oChYHHVNMc4xoINOMaxRYWywk4f4gl8YP448J3UKRkCcdTwpvPUINIKpQ9PlvyiYb
 9kucTwemY76icajcEyVPLYKtOyAsbqnBlJ/krowupUSBKYkHewCIbuteY20gBeU2xPtx
 bYDNUdlRx0pa9rk/i5pqwXq65HNxEmTYGpxfompRiFa4/jXmkEaBiwqCM53wWuaLNlSp
 rqqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz9jzTAcGbscwJDhDr9fYOLGr0l3IguYohjqkugbHrbqjKTCG3ztJmOoB9AU/ouI7y3ZP1olb9qQZhCxwlgPM=@lists.samba.org
X-Gm-Message-State: AOJu0YzOrq9vXobtAOrs4rTa+GXV5eQ5u7a7L9ciMV6UojvpMLD/98hb
 8d4fH/pMZ3i6m1zwu+kBIZqSXf4UIGBzN9HE96lPUcrqNNWkxfFFkX5NVE9T/Bn21mOFi+in76g
 9uKLWEkRGzyBjjqRl/rxoGD7+Hw+81U0=
X-Gm-Gg: ASbGncv5K68BopGlcM8CCN54HlcleBfPliznQGJe6Infdme3+aLXtsCJOIjuVR2EaBK
 ai8LR9SnbKhlXriYNokJPVjPtxoJI6Sxjmw4tQ6hiDsnZaMJtTpga8kg5aGQ8ryxSJlSRLa/T9h
 2Mw1FrTcoEzlBYrqDI5qyeqRi0TGczaXJQhvrrBojaBIVfTOwHSecMISoV22W/Rbq4tbYUqWrxC
 QZlb7E=
X-Google-Smtp-Source: AGHT+IFKHVxL1gsNPJCBNz38YQraN6Z9T4Jd07rxkuLmJALbC4I4N8EKhSG35DDtAFHlg68NLZcWlXYKi0NZtintYwM=
X-Received: by 2002:a17:90b:4d89:b0:31e:1311:2033 with SMTP id
 98e67ed59e1d1-3211630cda6mr16963769a91.29.1754372699371; Mon, 04 Aug 2025
 22:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAANATT62tvz4yx1gnRu4MkfA8tsWaJwhxX68YE_9hGjELNXGJw@mail.gmail.com>
In-Reply-To: <CAANATT62tvz4yx1gnRu4MkfA8tsWaJwhxX68YE_9hGjELNXGJw@mail.gmail.com>
Date: Tue, 5 Aug 2025 15:44:48 +1000
X-Gm-Features: Ac12FXwFayBSsC-wDdNb6-Uqkc0ZDgpBTJzBZ5dlUStgq51xZNBhxOh8-wGB0Yw
Message-ID: <CAN05THTQv5e9qXeJD-Di9kZpomjbeadHg5mkmKtCTi3v5fYMXQ@mail.gmail.com>
Subject: Re: Samba support for vectored IO
To: shweta sodani <sodanishweta@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shweta,
This sounds like a great project.

I don't know the internals of the ceph API, but have you considered
io_uring as an alternative?
io_uring now supports zero-copy starting from, I think 6.15, and has a
very nice API
if you do not need to touch the actual data.

As you are likely just copying buffers between a file descriptor and a
socket it seems to me that io_uring may be a good fit.
Io_uring has other great benefits too as a general async api between
userspace and kernel and will allow batching many requests inside a
single userspace-to-kernel syscall.

io_uring is imho the future of async systemcalls or anything that is
performance sensitive.

Sorry for derailing,  but it could be an idea to investigate.

regards
ronnie s

On Tue, 5 Aug 2025 at 15:14, shweta sodani via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Team,
>
>
> I am working under "Guenther Deschner", Currently I am working on one
> feature to integrate in Samba that needs your suggestions.
>
> I=E2=80=99m working on a feature called =E2=80=9CZero-Copy Support in Sam=
ba using the
> libcephfs API.=E2=80=9D The goal is to improve data transfer performance =
by
> avoiding unnecessary memory copies.
>
> Current Flow:
>
> In the existing design, when Samba reads data, it allocates a continuous
> memory buffer (DATA_BLOB) and passes it to the file system layer. The fil=
e
> system then copies data from its internal buffer into this Samba buffer.
>
> Zero-Copy Approach:
>
> With the Zero-Copy feature, we eliminate this extra copy step. Instead of
> copying data from the file system into Samba=E2=80=99s buffer, we directl=
y use the
> buffer provided by the CephFS library (libcephfs). This library is used i=
n
> the "vfs_ceph_new"module and now offers APIs that support Zero-Copy by
> exposing its internal buffers to the VFS layer.
>
> Integration Challenge:
>
> The main challenge is that the Zero-Copy API in libcephfs returns data as=
 a
> list of buffers (using iovec), while Samba currently expects file data in=
 a
> single, continuous buffer. This mismatch complicates integration.
>
> Observations and Next Steps:
>
> While exploring Samba's internals, I noticed that the smbd_smb2_request
> structure does include an iovec vector and a count field in both its inpu=
t
> and output path. However, these are primarily used for metadata or reques=
t
> framing, not for actual file data. For reading and writing file data, Sam=
ba
> still relies on a single flat buffer.
>
> To make full use of libcephfs=E2=80=99s Zero-Copy capabilities, Samba wou=
ld need to
> support vectored I/O operations (e.g., preadv, pwritev) for file data
> handling. Is there any ongoing discussion or plan to support this in Samb=
a?
> I=E2=80=99d welcome any suggestions, guidance, or thoughts on how best to=
 approach
> this.
>
> --
> with regards
> Shweta Sodani


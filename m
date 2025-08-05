Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7FB1AD85
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 07:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=T0bMtFjJ6JeMwb9fy4l7Vir9d+EB0IyU/W1161xJk68=; b=oUBPu3eVY/T/PLrcbzvVwnD+WR
	9hkVkqwNCxtL9YZcHBYzicZ7hKgaqQ7tWNjm7ZW/qvntCcoOBq6n2ZycnWnaETHtHPi59+xrDgqdY
	yiSW4WkyiBMoLJLaapi/5EO5RgRBFPg3vN+iuNjW8u/RNoYEOeWtLa/SQxBSQZr2qD2F/pAIrKiF/
	fpXzyELAj99auXLKS/omSr4Iq9UCBTZ5P6dnPOHlvfExrABs6HP2LCCamI0c6gCKANC2YhJqZER96
	q8j43z85PN8K6g8Ci3e8Y6vmOd7LrZ4KANHX0BZzxJSmPnFULxMM1+Rl3rxfHfNWIrOjKRuaFo8bR
	ijNtxjSQ==;
Received: from ip6-localhost ([::1]:35738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uj9zi-00EKCg-Fl; Tue, 05 Aug 2025 05:13:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:56659) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uj9zd-00EKCZ-8m
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 05:13:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76b77a97a04so3070164b3a.1
 for <samba-technical@lists.samba.org>; Mon, 04 Aug 2025 22:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754370822; x=1754975622; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=915kNXooMH2aC3g1a6mu60xhyF7t/X333yj8Bvrfozg=;
 b=U4XGi7h2KCWSIijq6mztH0dToJi2vLGoyNRiiUDfkY0A8tcc7PW6L5qvvSzHnFa5y/
 ZmfXRxitUWJr1YMV2Ev+HOCUZ2/45VfJRilta9ElHQek2T9fKmIIz7YLnmTjXRIrQytV
 s2zPLQrEXCretdfxb7CrnG21V8wm3mmc0U1uhyWOvLMrnvccycdlnMbgi+KB9rUnUUcr
 vTePGmnzpyfrowam00lJNCAWS7MqS6qF8zMS1DXVglTN0BrBG2ETz45qDeqM3WejZ3aU
 mS15eb3ZiNoCIYTvHwcLRbfd/J4gPUn2ZZ42RQY+5C+mVve0qfvsd/zmSbZOkq9erGpW
 NiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754370822; x=1754975622;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=915kNXooMH2aC3g1a6mu60xhyF7t/X333yj8Bvrfozg=;
 b=fy1yHi8DRQ6Es41FgX/XjgSErZgo2yNBAYXhGA3Apna80OwYgsT/rZZDtS+rv9C4WT
 eqzpj5iFcr9Oly4Nu20wChgdCGtFZYrN+7vmSMVNOKckCJ7EEeSZjKMV6WaPH6PhgEVQ
 Qiv+vb4H7LjS+aOquh2tXkUfOYpDu2Xzp2gEIb1g63WayxgoqPFKVF01xJwX4cuBl6B8
 1d9+zCrb/ErGQwihkidJPsB9MXW3chhu6jj+o8yDXk5HlvspOaRaeAUgkccOSi+RRLew
 Wqc6fJxJoLxX/uPFkQcCixFFHXCefqwor8Fn9ZnSoJ2jGlIBqqJ4wT+CQM3Rmz2lXZ0u
 mTxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpoW2ns0REVNHVwYniwnvc1/Aa52k/PidzF+QnUGuM0AtQNYNJ7G3QzPJHd8Hm1coLUF6QfxCJkC18Cv3n48U=@lists.samba.org
X-Gm-Message-State: AOJu0YzBez7AxvCGB6DB6aVTPgkTBAfAWUQ+QHFWzpwbNFAGO6Dc7bu4
 WzJUzi7r8hVWbrNg65dWSoQudJNsaw4fU/br9chzg8nXSfiUtC3Gq2rz/PZljDGOw2iEEgieh1s
 Yuz7ZpKXw4kfSxYOu0zwdj8qaXtULB8xqRW9o
X-Gm-Gg: ASbGnct8yKJXvhNidfFqYGifqZSMKLbdTE6oKgYg10Qoj0UibfhlevqIZAh6RNopmzd
 UBIEPIUnIYx61Rg7nMj2fq0oGoXpJ+gDEzkMX/ztLP5tO8yjkY3fq1OHPOqcARX2WYAOkfNMIMh
 0hH2ExaggccWYaMH8olfXHVWoPEMTNiBg/vTGcdD65HcqgNmrWHdTpOqlFaxCKvr29hx20FvGlb
 uilvjNar+LsTMsCkA==
X-Google-Smtp-Source: AGHT+IHCCaFE77UR34IoZpAqLOJPxESQGQ6wr1GGAXq6H8tv53Tiw+sS3K/WrMHCtmpBrIiCrKADntgfUZqjgCkuXgU=
X-Received: by 2002:a05:6a20:a11f:b0:240:6dc:9162 with SMTP id
 adf61e73a8af0-24006dcd51emr10441341637.40.1754370822397; Mon, 04 Aug 2025
 22:13:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Aug 2025 10:43:30 +0530
X-Gm-Features: Ac12FXzaiThb-g5tZRKiwEJ_iMlNHjsGsfxOU38TJjcQIjK0mrrernd-ty0tvBY
Message-ID: <CAANATT62tvz4yx1gnRu4MkfA8tsWaJwhxX68YE_9hGjELNXGJw@mail.gmail.com>
Subject: Samba support for vectored IO
To: metze@samba.org, slow@samba.org, samba-technical@lists.samba.org
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
From: shweta sodani via samba-technical <samba-technical@lists.samba.org>
Reply-To: shweta sodani <sodanishweta@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team,


I am working under "Guenther Deschner", Currently I am working on one
feature to integrate in Samba that needs your suggestions.

I=E2=80=99m working on a feature called =E2=80=9CZero-Copy Support in Samba=
 using the
libcephfs API.=E2=80=9D The goal is to improve data transfer performance by
avoiding unnecessary memory copies.

Current Flow:

In the existing design, when Samba reads data, it allocates a continuous
memory buffer (DATA_BLOB) and passes it to the file system layer. The file
system then copies data from its internal buffer into this Samba buffer.

Zero-Copy Approach:

With the Zero-Copy feature, we eliminate this extra copy step. Instead of
copying data from the file system into Samba=E2=80=99s buffer, we directly =
use the
buffer provided by the CephFS library (libcephfs). This library is used in
the "vfs_ceph_new"module and now offers APIs that support Zero-Copy by
exposing its internal buffers to the VFS layer.

Integration Challenge:

The main challenge is that the Zero-Copy API in libcephfs returns data as a
list of buffers (using iovec), while Samba currently expects file data in a
single, continuous buffer. This mismatch complicates integration.

Observations and Next Steps:

While exploring Samba's internals, I noticed that the smbd_smb2_request
structure does include an iovec vector and a count field in both its input
and output path. However, these are primarily used for metadata or request
framing, not for actual file data. For reading and writing file data, Samba
still relies on a single flat buffer.

To make full use of libcephfs=E2=80=99s Zero-Copy capabilities, Samba would=
 need to
support vectored I/O operations (e.g., preadv, pwritev) for file data
handling. Is there any ongoing discussion or plan to support this in Samba?
I=E2=80=99d welcome any suggestions, guidance, or thoughts on how best to a=
pproach
this.

--=20
with regards
Shweta Sodani

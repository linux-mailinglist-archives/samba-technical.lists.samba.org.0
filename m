Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF6B1B07B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 10:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XoQbyVTbrHp7BPlU4b/fAkbzBUFepSnDt/FPTKYIMbE=; b=XeP+YSm6BCGrFuzwhJlB70dybZ
	yQNG5Rk+UXifyD5Zw9MHlcsywHVIkwZuV1pew9u77HISJsqwFyghf1UbhnA+1KF2zLEDe6zFFOxs8
	8kLiamrA080qadnbmbTfgpo7z5HvrXpYMPkYgFVazlws9BYbGyuZY433OkHZ568nLVYi6ZhOm+N4C
	5/gUe8vTfPBPduftL7CfHiR8t8vuP/Y4ybjCC3nzwQ2K2dUhwy+R26oaLZRMiapaxAZxcqL978YoG
	l8uHX3Zwb0YL4E+xSUP9H5U9QEubNwMofxrkzs6dt9ywwOhi+H2x+ezf+SghL6YjnCy0M9bFVDCrK
	wtCW3MDw==;
Received: from ip6-localhost ([::1]:40778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujDPK-00EKvo-32; Tue, 05 Aug 2025 08:52:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:47157) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujDPF-00EKvh-PU
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 08:52:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-240418cbb8bso35218155ad.2
 for <samba-technical@lists.samba.org>; Tue, 05 Aug 2025 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754383943; x=1754988743; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7/iVhHLVwJjhQVbZJEWBYUQ7t4dC9aP78c+7cDlPyFA=;
 b=KVyemtW6tO7FB313k9ukcCKg4AjWv0MFhsaBeA1N3eaLsidZS5JPavHKJHRPKEfNCD
 VWXVEZpA4SaBmUog9NmWYXLA9zFjegvEBsmxifwZ/hXGpJoesySVEANdd8Y7cAK+5fJu
 RdNn0kuNg/0NT+wBrAtd5O4Ijh0AueuU2zrbgDYZj0IlxcfCGPSRGjeJk11QdBBfxRbJ
 0pqKVPUpkz1qsDFmpo3whUPjT6nIPZCnJSfMM9oeXJ0ghrXYDSbjmT96mXjEHGtSdVQk
 GVfkD4icnEnz/WAIxsV2wxwfLmEBeVzuBsTrHi/Rpki2P8vSQv9cQI7otiSwKavzdSYy
 YnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754383943; x=1754988743;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7/iVhHLVwJjhQVbZJEWBYUQ7t4dC9aP78c+7cDlPyFA=;
 b=pgoehJBvX8eaRRiDJyJI9yErblmcX8vF3aWMdJAfv1ZEfk24KhX4OVF7z2ifW4wIMj
 TyKTjLkroSpkUOqu9AaOVSTgn2vttVbXhTfKs36DI1wYch3/v0+A9XYrnwNeB1jK9zhY
 NkCx6n8vGUcv8TFRgiANyahSUKG1taAmbggLRT8LyS5dvAaW7CfFt8nBQ0AZsVVSJ0kU
 JtADPeG/A9QIm47hdLY672sc2PAKNnLfhTnUU157Ut4/HU0nGV5q+CyjmXZcH0lPGje2
 7bQlN0IaD12FY5E2Hf4atIIdfsSjpuzTzljbU+Z0yHE05P3/R++xdXOZmeDZxRO3UZJK
 qY1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFfwaPcYF2TL7kiGxvlrJCUDHpx86WhCEf0RvZ/2NPJKoey/bagCATGLsuCMtU69gAGnHVgyDFUF+NT70Ua1o=@lists.samba.org
X-Gm-Message-State: AOJu0YxGOk7vQT0I68zP0uSW82bLJvd3lVqRha2YMotuu2YUkJRbOW3e
 sBPCTVqN3kBvRZM4tsAlVP69fVNmI6z5uZFozPcyt1itGYKZ0vkegeFdHtZnHT1pCsFGYUGgT28
 5yxcbVpas+5xatNHNk02HgT68RqWn7nA=
X-Gm-Gg: ASbGncuclBvuVCX5bNEeC+SOEwjhWaJHMznBRgep5GIKCa26gvYRdXIZuGq8os+jgcj
 XZjfO5X3Glo6IvHOS5GTTbgBGZLu34aP0G4IySORAe6v/UV95DnSXcbDMolH3RXq35VNEhvh7//
 sYsae20a23uzZqOCvwDgFtKFKsD61PPUzzSrhUlVd4NX3vJsDzl5n0E4HGkqqgTzIXC4jqkCxzp
 719kT8=
X-Google-Smtp-Source: AGHT+IF4J+wvMD0FEnUjXuhTP1rs7yABBGYalwKIPvaCA92nFB6Vjk5d5oDF0H7vOoDzvY2514EWtHDWGdTWNG1FpM4=
X-Received: by 2002:a17:903:183:b0:240:8f4:b36e with SMTP id
 d9443c01a7336-24246fe08a5mr196955685ad.34.1754383943159; Tue, 05 Aug 2025
 01:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAANATT62tvz4yx1gnRu4MkfA8tsWaJwhxX68YE_9hGjELNXGJw@mail.gmail.com>
 <CAN05THTQv5e9qXeJD-Di9kZpomjbeadHg5mkmKtCTi3v5fYMXQ@mail.gmail.com>
In-Reply-To: <CAN05THTQv5e9qXeJD-Di9kZpomjbeadHg5mkmKtCTi3v5fYMXQ@mail.gmail.com>
Date: Tue, 5 Aug 2025 14:22:10 +0530
X-Gm-Features: Ac12FXxP0xM2sG5HCmOy_Lis9a_Q1WVvkRVDAZKSdeWpWfMC704XGkrk6SV2mLA
Message-ID: <CAANATT6J8kfcp8p3m3XhCEZLA-z+Qcueyy_+BULwjNDhTGPi7Q@mail.gmail.com>
Subject: Re: Samba support for vectored IO
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ronnie,

Thank you for your prompt response. At the moment, CephFS does not support
io_uring, so there are no Ceph APIs available that make use of it. While
io_uring is definitely a powerful option, it's unfortunately not something
we can consider at this time.
I'm open to hearing about any other alternatives you might suggest.

Thanks,
Shweta






On Tue, Aug 5, 2025 at 11:15=E2=80=AFAM ronnie sahlberg <ronniesahlberg@gma=
il.com>
wrote:

> Shweta,
> This sounds like a great project.
>
> I don't know the internals of the ceph API, but have you considered
> io_uring as an alternative?
> io_uring now supports zero-copy starting from, I think 6.15, and has a
> very nice API
> if you do not need to touch the actual data.
>
> As you are likely just copying buffers between a file descriptor and a
> socket it seems to me that io_uring may be a good fit.
> Io_uring has other great benefits too as a general async api between
> userspace and kernel and will allow batching many requests inside a
> single userspace-to-kernel syscall.
>
> io_uring is imho the future of async systemcalls or anything that is
> performance sensitive.
>
> Sorry for derailing,  but it could be an idea to investigate.
>
> regards
> ronnie s
>
> On Tue, 5 Aug 2025 at 15:14, shweta sodani via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Hi Team,
> >
> >
> > I am working under "Guenther Deschner", Currently I am working on one
> > feature to integrate in Samba that needs your suggestions.
> >
> > I=E2=80=99m working on a feature called =E2=80=9CZero-Copy Support in S=
amba using the
> > libcephfs API.=E2=80=9D The goal is to improve data transfer performanc=
e by
> > avoiding unnecessary memory copies.
> >
> > Current Flow:
> >
> > In the existing design, when Samba reads data, it allocates a continuou=
s
> > memory buffer (DATA_BLOB) and passes it to the file system layer. The
> file
> > system then copies data from its internal buffer into this Samba buffer=
.
> >
> > Zero-Copy Approach:
> >
> > With the Zero-Copy feature, we eliminate this extra copy step. Instead =
of
> > copying data from the file system into Samba=E2=80=99s buffer, we direc=
tly use
> the
> > buffer provided by the CephFS library (libcephfs). This library is used
> in
> > the "vfs_ceph_new"module and now offers APIs that support Zero-Copy by
> > exposing its internal buffers to the VFS layer.
> >
> > Integration Challenge:
> >
> > The main challenge is that the Zero-Copy API in libcephfs returns data
> as a
> > list of buffers (using iovec), while Samba currently expects file data
> in a
> > single, continuous buffer. This mismatch complicates integration.
> >
> > Observations and Next Steps:
> >
> > While exploring Samba's internals, I noticed that the smbd_smb2_request
> > structure does include an iovec vector and a count field in both its
> input
> > and output path. However, these are primarily used for metadata or
> request
> > framing, not for actual file data. For reading and writing file data,
> Samba
> > still relies on a single flat buffer.
> >
> > To make full use of libcephfs=E2=80=99s Zero-Copy capabilities, Samba w=
ould need
> to
> > support vectored I/O operations (e.g., preadv, pwritev) for file data
> > handling. Is there any ongoing discussion or plan to support this in
> Samba?
> > I=E2=80=99d welcome any suggestions, guidance, or thoughts on how best =
to
> approach
> > this.
> >
> > --
> > with regards
> > Shweta Sodani
>


--=20
with regards
Shweta Sodani

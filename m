Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84993B0F702
	for <lists+samba-technical@lfdr.de>; Wed, 23 Jul 2025 17:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=C0SctX4mJ0AMYv4T1JKj1e4v/voNMmGNkVzjXO48rA4=; b=Dnd5erNWV5BK7yiRG0TA7xlw/F
	CxZcoWkek1WtWFqz964HopR4888GzqwFOLOGrPIXOdZeMXUwnw7+Xp5J05LRRTlb9ikZoPEo5kKEg
	MVDLuAPY6Hf6u4geaGtH1mR8SraR5aclXcDaThCeEFenw82VMNcjedDuKtytetSaG/B/p7JctQerE
	TGlultP/iS06JMDVIK6+mdVz+dhxBLPIlUorwKXqPRfsWqLJPa+TdFnMio2hOVxFN9+Ml3iavrs8B
	v7UQRxsdLOcQnL4+OrFGqjdj1pG/UN1zOUU8ehVL1/5D9b4xHmD/XS1ue4a8QqfZS3z1+uPJYgEbz
	H/FLNqwQ==;
Received: from ip6-localhost ([::1]:39538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uebOH-00BgQM-LA; Wed, 23 Jul 2025 15:28:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62286) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uebOD-00BgQF-Qa
 for samba-technical@lists.samba.org; Wed, 23 Jul 2025 15:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=C0SctX4mJ0AMYv4T1JKj1e4v/voNMmGNkVzjXO48rA4=; b=jtyEKW0b8gCdb5xqk+t5kLaNWA
 TU45tkMjwM2b0YwEYmN6Sy80FuLVx5RhG9xoWfjD52IO+n+5ANyfMQGHpnxunEt6TmaTIoiPEtiDo
 v2s3Nn1VSq1VIRk81AuyQS1WAnz7hOfcFEn9JapdnK29cyh2EPvpj/dzrZ3L9o2L3rvgfEIME5jgQ
 PJHaAyP9E/gWkzx3Du7N2TWXPhgQsfmlc3UrBBXWDIEzSQKF/OdZBCSXH9gV/KB3o0vGB50Fw+cRE
 Xiz0enidZUgGqO/566zhbT45K+DdpGMcePqHHTFSZWTN4/gVKSHpjEzoTmzSD5u8ymyKz3YidquQO
 +FJbLaQIlAAlTvCdlAALEl1Cv8FvdfhWXauHY1PxpEupCMkg1e3PvolF9yer8N5GkEK2vIpyzTq99
 OaFzCtK/0NJSpQ/85oLbaoQ0fxkM4XIVhvKYIE9OfQIBk33uUCV5F8sFlE5wmrQc7urAmeCxMYr9E
 0mqYnu0fu/QYRgRLBve3XJhF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uebOC-00GdXq-2X; Wed, 23 Jul 2025 15:28:17 +0000
Date: Wed, 23 Jul 2025 08:28:14 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: smbclient posix_mkdir over SMB3.1.1
Message-ID: <aID_jqKNLziXDXfJ@jeremy-HP-Z840-Workstation>
References: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
 <aIBOfm6OKYlATpAs@jeremy-HP-Z840-Workstation>
 <CAH2r5mvEAfDMhNyhzL877EjBsmdBavWeLQaVQKc+gmueUSXrrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mvEAfDMhNyhzL877EjBsmdBavWeLQaVQKc+gmueUSXrrQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 23, 2025 at 09:24:40AM -0500, Steve French wrote:
>Looks like a little bit of progress, but still fails all posix operations:
>
>smb: /> posix_mkdir dir0 0755
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>Failed to open file \dir0. NT_STATUS_REVISION_MISMATCH
>smb: /> chmod 0776 file1
>NT_STATUS_ACCESS_DENIED chmod file \file1 0776
>smb: /> posix_open newposixfile 0777
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
>Failed to open file \newposixfile. NT_STATUS_REVISION_MISMATCH

Oh. It's going into SMB1 send functions whilst it
should be using SMB3 of course.


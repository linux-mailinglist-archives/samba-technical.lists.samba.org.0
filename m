Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A7897D89
	for <lists+samba-technical@lfdr.de>; Thu,  4 Apr 2024 03:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=uDBpEQ/XUPwAH1ZCdos5+O9pwCNM/F7hK/EKc285V/k=; b=50dIfODd3yQw6ooZ8y96kd5pIN
	yMfgcg086cs8v4MV7wbkP5pQdkk3qr1Cnb8Eq+G6X+/Wp3SukBRHV+vbi2u/7B6P2Cy1Hb+795M+O
	sJopoTNU/X31Xv5w9Ex4ydZEjpYK/V7cXL6G8O3ocNZ3RpedWOctevsM6nLW8Qd6JTh8quWp07jso
	FbBnueMeYxCD2s+baJHRDWRMj0mtM9VPmA/Gfu8b2/kcrTdGtFBlZwLufZ4qsIHP0cLKnTAXRBkcQ
	A6TPS60sdrTOC1+QrVw4Ro9Tt2wRfo59I3WJ12q1qFZ3nZuOS6fjvVPDhN/3Qqcq1/1SEHkU2nqVH
	OD3U3gRg==;
Received: from ip6-localhost ([::1]:22372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rsCNS-003rna-UI; Thu, 04 Apr 2024 01:58:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62530) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsCNN-003rnT-MZ
 for samba-technical@lists.samba.org; Thu, 04 Apr 2024 01:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uDBpEQ/XUPwAH1ZCdos5+O9pwCNM/F7hK/EKc285V/k=; b=mYx/ATevIqYLZTvtFWlg0QoDgL
 OXV8tt7bUksFOyydGaPXTpNJK+BIp5qkcTOtqUvQPyjHb+R5xyDt30OtZHbTDBbo/4jyBEidjang+
 ZMbxGhKldHAug0rxxdL875b+f3unNLB+rb/tdTrVuByFJHZKRFlD0ZyD6+k6PZEvkHYmh+0hLnAMo
 D7lqj5k+XlXK9kYGsS/dsQ5SyvkWG10Ewx0DQ9xS7NVFhAWEzBHgkJA0pJGD437d267MWsCGKlNTx
 NyXh/2B04gcEIpHPsJqDgi88kIPZwuHUXBIQ5leQvwlVHAzwdadBWPzZAONhkeyASGf756J7cucQj
 BDRRfHPGElX1buYEf33gbXV+ntWSIwrWscG3Br5J7GyhTfZ1pgccyk/r6lard7xgh0OIZj3PJIrHn
 igiGjVvUdvBqaX/uMNRRmj5h7P1hNaHE4AKom/XvP/OtgfuUGzYiFmZM7dr30QovU1inlJLX/vJ1a
 tSvUchsm8IWJcurbDSpKeT14;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsCNM-004Zc2-1G; Thu, 04 Apr 2024 01:58:48 +0000
Date: Thu, 4 Apr 2024 12:58:40 +1100
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Simplify copy-reflink code
Message-ID: <20240404125840.230c5d67@echidna>
In-Reply-To: <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

On Tue, 2 Apr 2024 15:43:44 +0200, Ralph Boehme via samba-technical wrote:

> Hi David,
> 
> thanks for taking a look!
> 
> On 4/2/24 11:26, David Disseldorp wrote:
> > Sounds good to me, although I'll need a bit of time this week to take a
> > look (and do some testing).  
> 
> that would be awesome!
> 
> > If it's passing the copy-chunk & dup-extent
> > torture tests on a btrfs-backed share, then I'm confident that it should
> > be fine.   
> 
> yes, they're still passing.
> 
> > However, my confidence in the tests is reduced - I thought they
> > exercised the BTRFS_IOC_CLONE_RANGE fallback code-path, so should have
> > caught [1]. Perhaps it's just that nobody tests atop btrfs?  
> 
> I guess for the common workload of copying files the fallback is just 
> never triggered.

I had a quick play with your changes. BTRFS_IOC_CLONE_RANGE fallback is
triggered by the existing smb2.ioctl.copy_chunk_tiny test. strace
indicates that it's doing the right thing on the syscall side before and
after your 48d8b9c7ad5 ("vfs_btrfs: fix BTRFS_IOC_CLONE_RANGE fallback")
change (with ret = -1 reverted back to ret = ioctl...):
  ioctl(30, BTRFS_IOC_CLONE_RANGE , {src_fd=28, src_offset=0, src_length=48, dest_offset=0}) = -1 EINVAL
  ...
  copy_file_range(28, [0], 30, [0], 48, 0) = 48

Cheers, David


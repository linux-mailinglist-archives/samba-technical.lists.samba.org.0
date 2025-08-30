Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81013B3CB0A
	for <lists+samba-technical@lfdr.de>; Sat, 30 Aug 2025 15:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=w2r31b6ZTZZA1hM3FAitQ+11WoJRiWHiNo6ir0lqUzA=; b=m1rROp4L5nPuJ76e41rPF1e5+m
	eoNdZmj3iwRqGoYd4WqlRaRqRkFaJQzaMplQ7qmEe06THaFZwFxruccHdAZZYQrFnbHoDGn3KBmS7
	xM+sSktLNoAWB2iaTq9S9NoVXZXibNxskkzC6EOFVtsTGwkyM2JpLOFWC5p+aqfIQfiJgodNFnZ+i
	VwKLTmPc+WQkKk10xNcqd9IKtAzI+MNh/+7jVvHpLogUQaw86yU+unecndvgEyoMyjv0TRER+pwub
	Dc4IoKuNgldStkr7kTP4q3zCoEuzYrZJik9O4skuCVLm5XSbsXnq+KVIReikG31MFxdkU32cw81mw
	9bSbgEyQ==;
Received: from ip6-localhost ([::1]:46886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1usLDF-000sl7-Ev; Sat, 30 Aug 2025 13:01:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18740) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1usLDB-000skz-0D
 for samba-technical@lists.samba.org; Sat, 30 Aug 2025 13:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=w2r31b6ZTZZA1hM3FAitQ+11WoJRiWHiNo6ir0lqUzA=; b=HnPkC1EnBTCOFeXQmdM1hhfEjz
 sfgcLJsHV+N7VkeNXAamtlMVl2IptrEfifO9VfB7+NbKaqSzeCTaya6mUpcem5SDGSIXE4TL0CAt4
 kHxFad++mEPoWLOrWw5zuQb6Wtn1BRWpgK//EdHcKpoE/uFGlu1TubYJQZKaMLIyvJH/k0d5ax5DX
 AMViecKVJEOOX78kKJswdHOYI0qhZeHIXZ0p9f4gsd94JQKYoEQJr+PBIGjkeMsSS3Y2DpexL79G5
 uWAIhEnAhqKwhJygVjB9MOav9OHQamvbiC4SB1v6KOWrhwHii3F7G0F5VSDq2w4sJ8UIqF6ltgVRP
 eOQujMZVit7wUi3NqOYtm3ryZgKtSu2wfhHbZOM5kvLx6X5k4XL9StUJjUSwjYGXltItuEyAsZcqk
 D+fxZoeyjbj24Yw4/26Al87zgPsxsS4YZR5zoD99YZ/VtgJgu2D0GSLPWwmbFnyp/A0LY7i0ClCS2
 8GP02QdtkuMJ+7DFdp1SaCTW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1usLD9-001acg-1v; Sat, 30 Aug 2025 13:01:39 +0000
Message-ID: <6197b8f3-7f44-42a8-a2f5-061888898865@samba.org>
Date: Sat, 30 Aug 2025 15:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in
 'smbd_get_connection'
To: Steve French <smfrench@gmail.com>
References: <202508291432.M5gWPqJX-lkp@intel.com>
 <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
 <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
 <2854f742-a0bc-4456-a372-9fa2d4e2ee3f@samba.org>
 <CAH2r5muGufmSdjxqTv9wcpbZoMsoEq=1ufFo_Yty352uDf+3-w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5muGufmSdjxqTv9wcpbZoMsoEq=1ufFo_Yty352uDf+3-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 samba-technical@lists.samba.org, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 30.08.25 um 00:31 schrieb Steve French:
> updated " smb: smbdirect: introduce smbdirect_socket_init()" patch attached
> 
> Also updated cifs-2.6.git for-next-next

Thanks! Looks good now.

metze



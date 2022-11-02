Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A622615D45
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 09:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WjaC1SIlCCNyKdjvm61oUWbWdRbXTjek+OCB3Wb+MDo=; b=kdYfjNQgMIxpZSdvhqSHbQoyAB
	XGpaKsKWbfy6WfaZrD278h92b8R2Kh/RC98JGcyAUTw16Zl5x7AEJ+8JVxFjC2s1g8Ulkb+l2c/xB
	A4KEK/YIVzjM86HYO/S3qa9fSnQTDxHN97znLavFN49t3F206/fLlvJ5iDBvaP0rdWj0DAFup0gA8
	hcMBG3MlcX+4Sv9QbWMK/IOYXgBufh+mewWtHM+j1RCQ99AqHs099b6cMF4n92V4hmsVdBRmQHtCo
	RdrGVc4sYv7J3eirrkXgugrlaw2fVEvhOZcmz2xDc0Rw3EzHmi916uCnR092WAEwMpM9YziKHFFcQ
	vCKnlt/A==;
Received: from ip6-localhost ([::1]:59440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oq8iw-00A24u-1g; Wed, 02 Nov 2022 08:03:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16150) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oq8ip-00A24l-N7
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 08:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WjaC1SIlCCNyKdjvm61oUWbWdRbXTjek+OCB3Wb+MDo=; b=cvVgYBO3abBIoP8kmZyW60qm+u
 TRSJ/GWpZh3PNHjuIB1euWo/9mwStTjpPE+exVfQkO2OGVPIRbddiZx/3XHtZv0d53YNW3fpCBo9D
 bUx8RWPjkIYypRTjxX+ZVSY3Sl3x8+1DFKzrAIMQbw7rrSd10PerEl21XQMq/vxFgAGraKDq0+xa6
 QS3dMBzGPfhK8/XdCShML6drH2kVCA5voBEnDRnK2M/uh5B8JF5pHfmmkP5zp4/FZzUpL88B2cGNV
 wuiq1H7RUjmF9eohWXLngMyBt4/STyIMDZZ1JeXaLM0pliISG41yhB1F/YcvoeHECbaCcaECnzpX0
 OUM9Hba2gD/+VixyrggCzzHFQEj2ifCycDl5VOKMlyauqKkPSExDwCBpHxmV6ZCosE7JPEx7U2Ufe
 oLqjz5zLi79YWbghFqJkFdCQoigZ8GYRE7dNSMmb3fYoMInAxjdnq8/ZIrzvbjFtcsApfFrYrx2Xg
 Q9h56dz2J0uOKqWfEEjdgDIx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oq8io-006qcY-RE; Wed, 02 Nov 2022 08:03:38 +0000
To: Ralph Boehme <slow@samba.org>, Michael Stone <mstone@debian.org>,
 1013259@bugs.debian.org, Andrew Bartlett <abartlet@samba.org>,
 Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipen@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
Date: Wed, 02 Nov 2022 09:03:38 +0100
Message-ID: <1836157.tdWV9SEqCh@magrathea>
In-Reply-To: <29df69a5-e95a-1235-ded8-c0ed56bcf635@msgid.tls.msk.ru>
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
 <29df69a5-e95a-1235-ded8-c0ed56bcf635@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 1 November 2022 11:21:55 CET Michael Tokarev via samba-technical 
wrote:
> 01.11.2022 13:14, Ralph Boehme wrote:
> > On 11/1/22 09:15, Michael Tokarev via samba-technical wrote:
> >> Control: tag -1 + upstream
> >> 
> >> Original context was at http://bugs.debian.org/1013259 , but whole
> >> thing *now* has is about completely unnecessary soname bump of libndr
> >> in 4.17 due to debugging refinements.
> > 
> > to me this looks like a packaging bug.
> 
> It indeed is, I fixed it already.

See

https://src.fedoraproject.org/rpms/samba/blob/rawhide/f/samba.spec#_148


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC076DFDB
	for <lists+samba-technical@lfdr.de>; Thu,  3 Aug 2023 07:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=iMOh2nuBQXrQXxE/Sz5LF1GClsQRcH4il8gaLijbIrU=; b=lSMEGLiO64Oq/EfQsFYAX4NjP6
	rsVTBHp0g8YcjBEPRCn62bNgVR27L17gpuY83mm8ntPtLBnFfPwTHDxzOchHEUAwTIq15QXIzxlHY
	dltCA4HJZ32rvQ9+HtVVW5GiaRM44MG0d16kL2xGgH971tQKu4EZkYkVfupz4+avop1YFRuP+QS18
	99XIuTKPVrDlq4QRIChxByMoAwCFVmXJ9tacxyunfTDFRXvFeG77WYSu1WhA/PQGngqRY2FeE9EQB
	w/qeEKhCIUAKlkc5hbxe+U0/objRKVdOHRyRD+dvcRqznuHKRnclOU7CRN3OHPherHyp/31KrBdEV
	r5dbpyJA==;
Received: from ip6-localhost ([::1]:63066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRRAX-008y6a-N7; Thu, 03 Aug 2023 05:46:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRRAR-008y6R-BO
 for samba-technical@lists.samba.org; Thu, 03 Aug 2023 05:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=iMOh2nuBQXrQXxE/Sz5LF1GClsQRcH4il8gaLijbIrU=; b=f9iOqWiSZ4hyuye3RMSo1pspa3
 BgRP/ir9a/1l/jCxmS4AATK8Q/bdKlCklv3iWIbcvj4czvxRLj1/c305P6j8/CaufQzhYwalmsvIx
 7Nm96PaWKC7X6qGhgB+83dTLASamdZA1GYjvxlurwztj63r3XLt+Y5Y4i81VHb2Q/JMEQZ3O/UhqT
 dmlGx9BqrzT6p3KfiU/6Izgers7J1bpPAYdrRKXxiVG29YyjACXLQ+GppTuMndzjjqdU1wi8Vfn3J
 KZnS3LGZchsiRk0JxRurlFQHMBGTmlp81XVKUNsWke/BBuBxC8AVt+1n4bYFBrKLqk54Ozb6/KihQ
 8HbCS5zQIxUPgSV2dm1Dqwlzs9DBSCMDRySbyjsrWw1tN1kqcUkbbhJvcAimvpwCXDOhDLTqC2XkJ
 DxCrXs1kGWnbDQ9EJKvuss4+OHjeIX1xvg7xMrUasiJ19auXgSclkj82eqzz/ISNfcc6rJiHdVmWI
 aVFOLoJn0Zt0heNnmjEjTrKF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qRRAQ-005ez8-1g; Thu, 03 Aug 2023 05:46:34 +0000
To: samba-technical@lists.samba.org, Pavel Kalugin <PKalugin@inno.tech>
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
Date: Thu, 03 Aug 2023 07:46:33 +0200
Message-ID: <12259767.O9o76ZdvQC@magrathea>
In-Reply-To: <d1755029-d396-d1a9-167d-bcbe8b027021@inno.tech>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
 <4503211.LvFx2qVVIh@magrathea>
 <d1755029-d396-d1a9-167d-bcbe8b027021@inno.tech>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 3 August 2023 03:23:26 CEST Pavel Kalugin wrote:
> On 8/2/23 10:25, Andreas Schneider wrote:
> > On Friday, 28 July 2023 00:07:03 CEST Pavel Kalugin via samba-technical
> > wrote:
> > 
> > In case you're looking into a first task. We need to replace
> > lp_set_cmdline() with lpcfg_set_cmdline() everywhere. The reason is that
> > lp_set_cmdline() leaks memory.
> > 
> > First start changing the client tools, which will be easy. The server side
> > might be a bit trickier. However it will give you a good first entry
> > point.
> > 
> > Here is an example:
> > https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lpcfg
> 
> Hi Andreas!

Hey :-)

> I'll definitely take a look at it, but unfortunately not before the weekend.

No problem. You can ask questions on the samba-technical matrix channel if you 
have some :-)


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




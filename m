Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C3641F52
	for <lists+samba-technical@lfdr.de>; Sun,  4 Dec 2022 20:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=o/GLw9leS0HkkuW4yEIRtxz++bxKOFrO6N8blNdhVfg=; b=FEwv+0bCGncTyXGpViMdplXp/m
	RLb4CMO3Ry40mV0Du/5uLoiCGj0EFXMSRXIY7x+SQI3ZsJdU4r5qgsl+NSXhHhqhvolXebyaJ4wBL
	gL6LqL1/x0Zr8lSCg7FtTJ9Unc3De/dYNsj3EYAKcX0lWEVbNzGMnj92/cTYnD6+3SiHZSaIMFuf0
	XDQprA5YlEEGUzfxJDwORGNUwgdrt1tHk30CnjjctxbhofT5e7Ob8kcPwUs85YuT6WAjoiRG7ltuk
	0QiwG55AGIGyWhCW18Inr+I92xwA50lzSX/t7hMog+vhjBb3x2oTIWmeBCICa3sK7QHczGydaUj3D
	zvkrY1cg==;
Received: from ip6-localhost ([::1]:55824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p1v2j-006GNj-PB; Sun, 04 Dec 2022 19:52:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p1v2d-006GNa-MF
 for samba-technical@lists.samba.org; Sun, 04 Dec 2022 19:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=J0vADjwxsFrqAtkNAEY9tysfKoY+Dwx5WQ7w/4nvycE=; b=z3we/qCtxhd+i9iI7Np7JfkraQ
 BvvDtbFtRI5gLn5TYTlXdCFEFJ+Jab2K3J+48FeTxSE4AJPlJFbnd6Dp9pUMtx3Er4q0yqEZcjGfe
 NHEE2x7Vt/1iPyqcKIMlErFR1f2F9U2F9b3iMQQ42hNOtLRU215zGMXA6FIUQz47HwGJShCF4EVJy
 x76PgmrlNUOczU8FClpvJO78uEdUXW+NzleqFkckGJxk2v6jcgbJNO01odylAAPCYGdPMiV1THe81
 L3BBtyiO3DvhQe2chf+LhETgYATF77zKiu6Y9hwOK/HiAQzG6YHRNJRbgIOWnFGBUG/VKoBgxhFE8
 F9ct9jaIrqGFgUFMdJzkXjQLTHxUS+T/6yphg5gY0UcP2MyzfrNRgot8HNgdMLZ5Fc2exmME6jcWH
 pmbHBbhRPksRULRpLMrLKc2VckgGICM4w2W9mdQiZs5PbDtmotdyPb8tAOnEh2DQ2xcLeO5vaZ/Nv
 CBpKeZiTdaDcDlwp4boFnLl8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p1v2b-00258x-2a; Sun, 04 Dec 2022 19:52:45 +0000
Message-ID: <196c8bbca35d2bab71210fb509972a1496276c75.camel@samba.org>
Subject: Re: [cifs-protocol] [EXTERNAL] Is MS-XCA LZ-77 plain compression
 the same as MS-DRSR DRS_COMP_ALG_WIN2K3 compression? -
 TrackingID#2211280040006230
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Upstream Samba
 Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 05 Dec 2022 08:52:39 +1300
In-Reply-To: <26645e4d-5ee5-45df-04c8-84b52c4b10b4@catalyst.net.nz>
References: <bd7ec498-e423-01d1-8e9f-eb818af7d774@catalyst.net.nz>
 <CH2PR21MB1528D67392A0E7E48AF88A27B5139@CH2PR21MB1528.namprd21.prod.outlook.com>
 <MN2PR21MB13907B0D84D694D0E688F9FFC6169@MN2PR21MB1390.namprd21.prod.outlook.com>
 <26645e4d-5ee5-45df-04c8-84b52c4b10b4@catalyst.net.nz>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kia Ora Douglas,
(moved to samba-technical)
Thanks for asking this and getting a definitive answer. 
You know this, but just to make a note: we should probably update the
comment in lzxpress_compress() to link to 
https://lists.samba.org/archive/cifs-protocol/2022-December/003914.html
 and point at the correct specification. 
Andrew,
On Sat, 2022-12-03 at 13:36 +1300, Douglas Bagnall via cifs-protocol
wrote:
> hi Obaid,
> Yes, that answers the question, at least to "easy to answer"
> threshold.
> It looks to me like they may once have been intended to be the same
> but have diverged, which doesn't matter in practice because they
> don't talk to each other. I don't need to know any more than this
> now.
> thank you,Douglas
> 
> On 3/12/22 13:10, Obaid Farooqi wrote:
> > Hi Douglas:The MS-DRSR uses a different API than what MS-XCA uses.
> > Please let me know if this does not answer your question.
> > Regards,Obaid FarooqiEscalation Engineer | Microsoft
> > -----Original Message-----From: Tom Jebo <tomjebo@microsoft.com>Sen
> > t: Monday, November 28, 2022 11:02 AMTo: Douglas Bagnall <
> > douglas.bagnall@catalyst.net.nz>; cifs-protocol@lists.samba.org
> > Cc: Microsoft Support <supportmail@microsoft.com>Subject: RE:
> > [EXTERNAL] Is MS-XCA LZ-77 plain compression the same as MS-DRSR
> > DRS_COMP_ALG_WIN2K3 compression? - TrackingID#2211280040006230
> > [dochelp to bcc][support mail to cc]
> > Hi Douglas,
> > Thanks for you request regarding MS-XCA. One of the Open
> > Specifications team members will respond to assist you. In the
> > meantime, we’ve created case 2211280040006230 to track this
> > request. Please leave the case number in the subject when
> > communicating with our team about this request.
> > Best regards,Tom JeboMicrosoft Open Specifications Support
> > -----Original Message-----From: Douglas Bagnall <
> > douglas.bagnall@catalyst.net.nz>Sent: Sunday, November 27, 2022
> > 7:30 PMTo: Interoperability Documentation Help <
> > dochelp@microsoft.com>; cifs-protocol@lists.samba.org
> > Subject: [EXTERNAL] Is MS-XCA LZ-77 plain compression the same as
> > MS-DRSR DRS_COMP_ALG_WIN2K3 compression?
> > hi Dochelp,
> > Hopefully this will be simple to answer.
> > The algorithm in MS-XCA 2.3 and 2.4 "Plain LZ77" looks quite a lot
> > like the one in MS-DRSR 4.1.10.5.21 "CompressOrDecompressWin2k3" or
> > "LZ77 + DIRECT2", although they are described using entirely
> > different words.
> > (MS-WUSP and MS-OXCRPC also have something similar).
> > If this is *not* easy to answer, I am happy to accept a "maybe". At
> > this stage I am just curious.
> > cheers,Douglas
> 
> _______________________________________________cifs-protocol mailing 
> listcifs-protocol@lists.samba.org
> https://lists.samba.org/mailman/listinfo/cifs-protocol
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst IT - Expert Open SourceSolutions

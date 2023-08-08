Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35828774E25
	for <lists+samba-technical@lfdr.de>; Wed,  9 Aug 2023 00:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mjSfDhdntyUOO73V0AWVhs9IJWrb2NmE+HrHroFU8Vo=; b=aLjEqSH03McZCZN9naesZxBUEd
	F+J+VdrNnwWUIv8vtIDVEWaUKHyM7lfs/GWGTN5Go2ahrs68eqwz2Dcf50/ITy51sYdbAAaeDlZ+O
	XYaDpyiki3M7VIKhVOrVgDBTw2zostzA8EPs/OIq4qlluZnvp5NgwSoeRLERyTihWcgBmzpmetxt+
	4DXFodTt+WcH3e2t335EwMmnTw21RgsRdfNVop6M/6GH1PjheMl9yi6eMR4irBA1JiNkFyoLkfIkE
	g/TCZ40AM7NmQ3bUkT+oAEyZRu1mUL9Daxr41lR4O9xhYWxOHFak7VKVv2hUSijIKGSQo/7Vr/5Fl
	0xb5M9Aw==;
Received: from ip6-localhost ([::1]:62136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTV32-00At5O-Vx; Tue, 08 Aug 2023 22:19:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTV2w-00At54-NQ; Tue, 08 Aug 2023 22:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=mjSfDhdntyUOO73V0AWVhs9IJWrb2NmE+HrHroFU8Vo=; b=RJPNyV2HjZD8bJPZAc4qaiXH2Z
 LYbU6fb5eUY1p8fOc1vPiSThkFO4ePva1NBL+uf2AMJ7V1T8ShZJeLRpDL/wSNO/tKq/i/T33ZY1X
 Y6mg5D01YI8i8nXuFubR4qOkX7WmywmAghljHoc255qeH7Wy0Trj+IdQvKverNER+1t5rpoN6rjDI
 suxglN/YTkFCwfVNaVcmdbsP81lsJbnFcsluuLJ8ZU0Zw1WVd/8GMOIs7BwiDHsMydEDeryDiuWTP
 iJ+h3VFViTAFIza3dmS0wq6C8/rDORUPuQO/5VIjbFwOnEex5z6m2SNL3k2mRc5AUO4iyA8K0NqHW
 P9TBC6DBE66TeMXkvZU+FOpFp5W1TiBCV5y/8FUJUWki/kOw7Ochd3uEeU7DThVSvuuD/IL54K7Mv
 TGG5uIkwJwaR3QeAfx4kmz8p/OX1RgkkMkv3bUGarTEtErIa3s+IFUaY+XzXTV0sCr2q/so8ef1WG
 fv9QZBCXveGAYgEKSN/HzUHK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qTV2v-006vwF-2n; Tue, 08 Aug 2023 22:19:22 +0000
Date: Tue, 8 Aug 2023 15:19:18 -0700
To: samba-announce@lists.samba.org, samba-technical@lists.samba.org,
 samba@lists.samba.org
Subject: INVITE: SMB3 IO Lab participation at Storage Developers Conference
 Sept. 18-21, 2023 in Freemont, CA.
Message-ID: <ZNK/Zsn9aUrrdjzN@jeremy-rocky-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Samba-people, Arnold Jones, Technical Council Managing Director
or the Storage Network Industry Association (SNIA) asked me to
forward this invitation to anyone who would like to participate
in the SMB3 IO Lab.

---------------------------------------------------------------
    Hi Samba Developers,

    Presentations are only part of what is going on at the SNIA’s
    2023 Storage Developer Conference, September 18-21, Fremont, CA.
    The SNIA SMB3 IO Lab is also an integral part of the program.

    The purpose of this IO Lab is for vendors to bring their
    implementations of SMB3 to test, identify, and fix bugs in a
    collaborative setting with the goal of providing a forum in which
    companies can develop interoperable products.  There are several new
    features that have recently been added to the SMB3 protocol:
      * SMB over QUIC support for mutual authentication.
      * Server Notification update for logon session scenario (when server
        discards a logon session before client).
      * Significant Windows security behavior defaults updates in certain
        Windows releases:
           + SMB Signing required by default.
           + Auth rate limiter on by default.
           + Guest auth fallback now off by default.
           + Mail slots off by default and SMB1 now disabled in all Windows
             releases.
      * And other SMB security updates and features.

    The IO Lab is an opportunity to learn about these new features and test
    your implementation with Microsoft Windows protocol test suites.
    During the IO Lab you can directly engage with Windows Protocol
    Support, Test Suite Development, and members of the Windows development
    team as well as network with other professionals from all over the
    world.

    This IO Lab is held in one large room (open 24 hrs.), giving
    participants an easy way to interact with both Microsoft professionals
    and with all other participants and their implementations.

    If you are reluctant to participate because you feel that your SMB
    implementation is "not ready", you should still participate! The SMB3
    IO Lab is also a development opportunity, not just a testing
    opportunity. Implementations still in development are encouraged to
    participate.  It's a great opportunity to get help and learn from the
    experts!

    This year we are pleased to announce the full participation and
    continued support of Microsoft, our 2023 SNIA SDC SMB3 IO Lab
    underwriter.

    For complete details on how to participate please see:
    http://www.snia.org/SMB3IOLab

    If you have any additional questions, please contact me at arnold@snia.org.

    I look forward to seeing you and your company at the SMB3 IO Lab this
    year!

    --  Arnold


    Arnold Jones
    Technical Council Managing Director
    SNIA

    http://www.storagedeveloper.org/
    http://www.snia.org/SMB3IOLab
---------------------------------------------------------------


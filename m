Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918D4B163C
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 20:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Hz75D9DK0piSlMYNI4Z1Shc0RLWa6b8xGXr1a2ORh00=; b=SzMbqFUzEI38KG4N4+qP7hh97F
	VFma/7yg+kfsCCqQ6AVl9idayz2jhk5vekANPUBnt+5+MIy9jiNVM1CIL05SFmnHUCxO7QGXYK/Qk
	cDlZ4tHGlZbAVvlhrRN1ty00z34qEkHilmDGHMKWzdOw8OTOLWR07MpLWgNV2bpt4SFIW9U1h72Lp
	XDZSUDYMxUxWc7QXJMTNZtLfeqEUWDHabslhOot9EiP/ulWiGE5hYMFptGQ8pru9XbDrFM1ewmD0V
	AkpjtfXSOBJjiD/lXPnvgGnXX8Pd+xWr8j1AIIHZUKpuL2b0qISm94luMq4mRAmaEuS6bbXjrpIuE
	tFgR1xvw==;
Received: from ip6-localhost ([::1]:64758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nIF6P-006Nt1-9W; Thu, 10 Feb 2022 19:27:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nIF6K-006Nss-8C
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 19:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=Hz75D9DK0piSlMYNI4Z1Shc0RLWa6b8xGXr1a2ORh00=; b=umWS7IvCzcUTaJK0rYy1gkm/65
 kugJ+I7baKxx8Fycjap7o0TkMb1gdFSyzP0CHhgsl2bzRMWwF7Jvmd3+7M2TQOaRNQ0KHeb7bavtG
 zZt5t3YSsz+F9IR92BmcVxHCm7fgIAC4NwWrNWa/mUHCvggR5TrQkyOavz7NF1bR8VVHJenVjzG0l
 rGJfq93GZi7tzr1rpgIt0iesqEvtFtYQjkAwQsPNYLs2alh4Q0bDtorgeu6lngPwRhoexelP5oVkt
 Eywvk5FCjfUohKtrD8XmHGv/AmirhMLRr3GZcbxuv5oB0IEElAqhL/IJ93S5292HeiO+RCEnwLKGw
 wfbeIBYwMaidsZOpHH2zMee+E1Ur5fIGwQK34y2mTEQ6e4zlw9+G0ewzZS5YUDsj8w9FpdSkWSQ8U
 Cqh/vkO/maAlR8dQPm73YiEthoedh7s9HnnOHzXzsKGJzyDCYcAv3KzBZ4FcrpU9xsVIrdJ01LC1l
 1RgoMuDTTArIOgsLR0pMk/3V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nIF6J-0039ED-Dv
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 19:27:31 +0000
To: samba-technical@lists.samba.org
Subject: Shell script indentation
Date: Thu, 10 Feb 2022 20:27:30 +0100
Message-ID: <5431405.rdbgypaU67@krikkit>
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

Hello,

our shell scripts are a mess and we should try to fix this. So the first 
questions is what do we want to use for indentation.

Most of the Samba scripts use 4 spaces.
CTDB uses tabs (tabwidth: 8).

We need to settle on one. Should we first collect arguments or directly start 
a vote?

4 spaces or tabs (tw: 8)


	Andreas




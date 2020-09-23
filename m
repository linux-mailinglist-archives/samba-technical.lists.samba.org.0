Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF6275A5A
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 16:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=iOIxG7JVLlXmrnl7YMr+qczqg9eHZ/9sWE9o0MfQL5w=; b=6Vmj4O6rZyFDGJFxuL3OEGluV7
	+GyL99cqiglt4/N1Vy135m2CQ0/yISCXBUUeSNKhl8ESTthcmGkYUMNcGTmMxjjEpRPNAAtZXbDsp
	ksVWQHwHmMHuOX6UW+XTND06kCD5C8Rsu/92uuqJz2pAm0RoGw+pcPYx13bD6pPVya+PXMYYeZoCX
	6hR2HrRpER161sz1P/I3wfj/aK5pMYrw6/m/H2bnAtGxlkpcovnIXtnyCdAW7mQK5TjJZrsZb0YMl
	vUjJTifxi5xYR6Edyud8EjNaIgxs8bljiuPCMjiYeHB4KoNhiFpMIF59XxqOTCnW1D7x2W5oMFwOS
	QHlYUymw==;
Received: from localhost ([::1]:31512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kL5vd-006uXr-S1; Wed, 23 Sep 2020 14:39:29 +0000
Received: from mail.ibi.tu-berlin.de ([176.94.125.225]:35790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kL5vZ-006uXk-8b
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 14:39:27 +0000
Received: from ibi-domain-MTA by mail.ibi.tu-berlin.de
 with Novell_GroupWise; Wed, 23 Sep 2020 16:19:53 +0200
Message-Id: <5F6B5958020000320001C3C9@mail.ibi.tu-berlin.de>
X-Mailer: Novell GroupWise Internet Agent 18.2.1 
Date: Wed, 23 Sep 2020 16:19:04 +0200
To: <samba-technical@lists.samba.org>
Subject: samba-tool for domain backup
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
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
From: Robert Bloch via samba-technical <samba-technical@lists.samba.org>
Reply-To: Robert Bloch <bloch@ibi.tu-berlin.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I am testing your samba-tool for domain backup. If I run the offline
version it finishes with the message “Backup succeeded”, but I find the
message “Failed to open /var/lib/samba/private/netlogon_creds_cli.tdb”
in the log.
Can I ignore this message? If not, how do I fix it?
Will I get the “Backup succeeded” message also, if the online backup
succeeds?

Regards,

Robert



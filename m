Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C725505E
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DISJktCwDKYPmDKk+dAUsts/4shP/R8dZWb2wm4CVrg=; b=vbun/qW42HtQtZSwkdVO9gEmNM
	byheddr51jh3j+FdABxEUKDYfAWrfgSggIur358misPK2B5daHrGqbWfPF4t+FJlzd/ZpWmNn4fZE
	DXiKrxwqitve4yRdJgrZvsHGjhS25Q7vfvuzFTXApG14YU0ns6Tmift2w904bENAMcakfrl1Bdpd0
	nrvBB5gh3UmXugKfDncmxU1dXc2kGjQ4B7HcMXkTyanKn5Ij5YJnoeCacuU3QSo8HQVlTQhs1IbOe
	3TRoYB5kEFvafZvJ0bLkonfz2rZGC/Sgt1VMJomcrZCuxID2M9qfREpCss0hvdfPnQVxjEFrJudYe
	4KXqsTfQ==;
Received: from localhost ([::1]:57010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPAy-000zuM-7p; Thu, 27 Aug 2020 21:11:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPAr-000zr7-DE
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=nM9r66CEdB9/SXak3xAvHaS2XLJm2u+77CyKT5deOAI=; b=Yjv2aFRRKBE21WWeuUye3WeKs4
 ykYjKqeMRxrdEDvA/sB6Q7GQW4Qq32J8Bg1/zdX64mnsSmCkyDZdYlM3lxhxhf33peUar0KWsJ8U1
 KIJPrvjvJn+fLVTv0HfwNRzPtllcFdKmC+nMGe1FXOf9QNirwbZ/9kfyRTg7GnIJ+RHBHKvwI0tR1
 liFFGmrZBxP7gOC4wSNkZF+A0lA1rWhcNPk4r3Ohgz4PT0Z4kGC+3bwrUmNkjYgs0+di5jeazKUIX
 dPDkfvZWjQpTh175zKx6C0lW9NMTYtxHW21VLofkF6agkLDekNUsCKH8M7QzORrA3JXF7O6QH2SHw
 NavfQOkak52hur3N9laqHC5DvWsIoC09h6oCTI8CHpu3irIwwcI2qD/duP9jOi2eMAIFd1bVSOnof
 bpfEycPT1Rw0bZ4YDo81ZzFeb6phTza+6f3Wx/dAs0VpIJiQ8Iod8yoxCrLOCYeL4RZdxubXwuEEv
 Sg0rqxzFOZO/jMskhJxhrx6O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPAo-000436-9W
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:06 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPAn-006i13-NU
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:11:06 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: vfs_retention: add this module to make a
 share read only with a special time period.
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-98@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-98@samba.org>
Date: Thu, 27 Aug 2020 21:11:05 +0000
Message-Id: <E1kBPAn-006i13-NU@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5Cgp2ZnNfcmV0ZW50aW9uOiBhZGQgdGhpcyBtb2R1bGUgdG8gbWFrZSBhIHNoYXJl
IHJlYWQgb25seSB3aXRoIGEgc3BlY2lhbCB0aW1lIHBlcmlvZC4KaHR0cHM6Ly9naXRodWIuY29t
L3NhbWJhLXRlYW0vc2FtYmEvcHVsbC85OApEZXNjcmlwdGlvbjogQWRkIHZmc19yZXRlbnRpb24g
bW9kdWxlIHRvIG1ha2UgYSBzaGFyZSByZWFkIG9ubHkgd2l0aCBhIHNwZWNpYWwgdGltZSBwZXJp
b2QuDQpTaW5jZSB0aGUgc3VnZ2VzdGlvbiBvZiBtYWlsICJSZTogYWJvdXQgdGhlIHdvcm0gZmVh
dHVyZSIuCg==

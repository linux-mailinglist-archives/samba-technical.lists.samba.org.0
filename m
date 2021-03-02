Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AB3295E8
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 05:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3nz3kCnSVuG1Z3lbkZzek/drJFaiUb/PRJePaxYiZDI=; b=Jp1G9lnGcSWotmsUNyq1f4Pb6Y
	HzZki2CrmrwejEgjrrfTbgz7KpG7vCOzNvH5inyqdAshTq7Wuk4YpAEX9cANIxOsKv4GbrLgy9HQs
	y3KhCCxUpGB1DoWBqlitx/dbyDpRyP/v51SDL99HXILIs4xYsFtqEOqeKX28JefGDAwwZ44Ce7/Rz
	N0+HJ+vbSToVqrGgnQj1duQlI1vu63nr7FS0o17Z9BKkbLjLAvGcP3QIEJ6nntfuM/bSdAQOKqUJh
	g+Icmua3/DEvcy0Ywo1kd3WcA2yPeHL3uDn0GLE3ATPAsNn5d5sFWm0Zv5xU7h7tYbr52PQsxhPJA
	auuDnTjw==;
Received: from ip6-localhost ([::1]:19172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lGwkx-003ooN-GJ; Tue, 02 Mar 2021 04:35:35 +0000
Received: from p3plsmtpa07-04.prod.phx3.secureserver.net
 ([173.201.192.233]:43546) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lGwks-003ooG-7a
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 04:35:32 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id Gw3tl0FlgiRGaGw3tlhNsa; Mon, 01 Mar 2021 20:51:06 -0700
X-CMAE-Analysis: v=2.4 cv=V8a4bcri c=1 sm=1 tr=0 ts=603db62a
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=Ur4h9UQ0h4y-klxGdTUA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
To: samba-technical@lists.samba.org
Subject: TimeMachine support for Big Sur - missing F_FULLFSYNC?
Message-ID: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
Date: Mon, 1 Mar 2021 22:51:04 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK/idzl5opf4ZTkcwaak5mtS//hcrvd5rhy8SaFp2oRWl4dSG1vq2+aG2evM/CzB+35cGdIiY/yWW9b/9VE5guf2wB8BXyYm2MD8xh69Bg2LRfr8W/vA
 aMycK1QznyqaN2/a1+BKpNcnXGox2wK9Dg62ozzmI9t3hnySVaQH3MgDYgxAmn3b8wHZ+3jzNjpS4j0ZmqkqCXW1OFxsXkFyTXU=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've installed Big Sur on one of my Macs and am trying to configure
Time Machine over SMB to my Ubuntu 18.04 server, running Samba 4.7.6.
The share works fine, but TM refuses to use it. Upon inspecting the
TM client log, I find it spews:

 > Big Sur
> 2021-03-01 21:16:54  '/Volumes/TimeMachine' does not support SMB FullFSync
> 2021-03-01 21:16:54  '/Volumes/TimeMachine' not offered as a Time Machine destination because it does not have the correct capabilities.

Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC advertisement?
I find some mentions of earlier versions supporting F_FULLSYNC (no extra
"F"!), but zero mention of either fullsync or fullfsync in release notes
for any Samba/vfs_fruit version. Is that just a typo, in which case, why
is Big Sur complaining?

Apologies for posting to samba-technical if this is inappropriate here,
but thanks for any enlightenment!

Tom.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9B53CFE1
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 19:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LgiQ84xU2YFARIcuRFEF9QUYiPQKWuYfnmICPyU0Wro=; b=iAnKMKiSz3mDjy+j9wOn67xkns
	4l5D9zhtteJdZrGLj0Zc0Awb1Pqu3o/bvfZBAQ76EljWY4KlWl+o692qxJmX3FDuCGeg4097AeCC5
	/L7lLgI+Yug2jRt8rs1GQAxjhz8hecscXSxpmGNqRYgpQSxNgE9s4YYKewKU2mRGvgYIhxslgkMBv
	Gtw4wgNK/GmuAMqZUwsRKYI07/VHH8KXRK9yo3+ESJ+7yrAWh0BmqeG8WcR1Gygsjp8UbiWYjeyVJ
	0YI/WNJ91V+rhLcj3diU5QKMojhBr+gi6Fa3j2Qi669SortA+AmVU9cBSbK+NXBY3gsUG8EIUzPby
	pmSy+3vA==;
Received: from ip6-localhost ([::1]:30368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nxBXe-0075f5-Pt; Fri, 03 Jun 2022 17:56:58 +0000
Received: from [104.200.28.160] (port=45092 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nxBXa-0075ew-Gg
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 17:56:56 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 66D5E1514;
 Fri,  3 Jun 2022 17:56:50 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: AD DC option to use acl_tdb rather than acl_xattr?
Date: Fri, 03 Jun 2022 13:56:49 -0400
Message-ID: <5979975.vuYhMxLoTh@edfu>
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,
During the sambaXP conference you mentioned that there may be an option to 
swap the vfs/xattr backend even on an AD DC. I'm interested in using this as 
it ought to avoid the need for always running our AD DC container images in a 
privileged mode.  You mentioned it should be OK for our use-case where the 
sysvol is not heavily used. Unfortunately, I haven't found any documentation 
for it. I looked over the interactive help from 'samba-tool' as well as the 
wiki and didn't see anything that jumped out at me.  

I was hoping you could point me in the right direction. Even if it's an 
unreleased feature, or needs a "cheat code".  Thank you very much!

--John M.




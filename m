Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88EA7DA1
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 10:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4+xIePoiZeNi4oDm+5mdH47PwyU0kVmCUL1Ba5EBmMc=; b=1fjQlyo47s3P0eKwBVxQzJ/W/X
	NZpWfDAGbjj3R+CWIqH66ur3LwDgDr/aqdGqus5Yg5Me3OdMluGO0dW2h+U6S/JVCeb7SUrqaq9aM
	sYuXc/LaDGkYxXavaUKeATdQ/nkceVxV0S49olbpLmC3yqiuT3+ms/uw0SFI0arDZMkUYP84tlUDe
	oSCxIc2lRP9w4A+0YOgXp7K9z/pdBjWtkxyu9yoAfu4kDV8v1QeM1Hgw1S4Te+kGP8UhPSxHlXGyV
	x9WQpmLeHY+JoPP7YMq7aqADSwu0IW9EmQOWb22Ha1Za6GvcGU1+E7Som5N4XF12cSSKrmVETqtl9
	znDRomUA==;
Received: from localhost ([::1]:42116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5QZk-003LJN-8T; Wed, 04 Sep 2019 08:23:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5QZf-003LJG-Tj
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 08:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=4+xIePoiZeNi4oDm+5mdH47PwyU0kVmCUL1Ba5EBmMc=; b=ZyBrGH/n5o+cvjMN7ZWPBYKYXH
 /k9HV4sIT9QivWMMwGl3Hmy7Of6dR6V1HfCoJyhGgJPFO5QM1qZ9ug2yqGeGl9wb2XZxeQa0kycSu
 C3texhLQT2qkf2GaOdM/AmBkkMxnGV30H3ee+zUBzl/f/gI7XvrCWEGTd6X9++NoHpoc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5QZe-0003FD-UC
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 08:23:31 +0000
Message-ID: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
Subject: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 04 Sep 2019 20:23:27 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is quite late for Samba 4.11 but I wondered what folks would think
of marking 'encrypt passwords' as deprecated so we can consider to
remove this code in Samba 4.12 (eg master) later this year?

This would dovetail with the SMB1 deprecation effort and I hope also
help find users who can't live without this (because SMB2 doesn't have
this at all).  

I'm unclear if this even works, given bugs like:
https://bugzilla.samba.org/show_bug.cgi?id=9705

If this is supported I'll polish up the attached patch and then write a
WHATSNEW for 4.11.

It doesn't commit us to doing anything in master / 4.12 (and we might
want to wait till closer to the end of the year for feedback), but I
took a stab at seeing what it might allow us to remove and this was the
diffstat (and there is probably more if we tried):

 /docs-xml/smbdotconf/security/encryptpasswords.xml  |   43 -
 b/docs-xml/smbdotconf/security/encryptpasswords.xml |    4 
 b/lib/replace/wscript                               |    1 
 b/source3/auth/auth.c                               |    9 
 b/source3/auth/pampass.c                            |  132 ---
 b/source3/auth/proto.h                              |   14 
 b/source3/auth/wscript_build                        |    8 
 b/source3/param/loadparm.c                          |    1 
 b/source3/smbd/globals.h                            |    1 
 b/source3/smbd/negprot.c                            |   62 -
 b/source3/smbd/reply.c                              |    6 
 b/source3/smbd/sesssetup.c                          |  104 --
 b/source3/utils/testparm.c                          |   26 
 b/source3/wscript                                   |    1 
 b/source3/wscript_build                             |    1 
 b/source4/auth/ntlm/wscript_build                   |    8 
 b/source4/smb_server/smb/negprot.c                  |   63 -
 b/source4/smb_server/smb_server.h                   |    3 
 lib/replace/crypt.c                                 |  770 --------------------
 source3/auth/auth_unix.c                            |  104 --
 source3/auth/pass_check.c                           |  294 -------
 source4/auth/ntlm/auth_unix.c                       |  769 -------------------
 22 files changed, 70 insertions(+), 2354 deletions(-)

What do folks think?

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




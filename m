Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6B53FABD
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jun 2022 12:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/5BlZS8EWaHMkG4nwmJctdaod7zqdovxo/D7Q2gED6E=; b=XV+gKiNxSTEuD9sv9eFR4SQeZj
	qFw9aDqXHnV7OHRTdzlvqAM91sIUbj+DGqJk+2Vg5b50KDlgtP8tq7RgAH09SUqFHTM37aCGAr4Rj
	soNJpPDE+y54zBPCf4fNnbYOSJ0qqtHaAWCy3ZJQIgrHDwmgkaBD1VI2B+6ph/EMYqDve2VH8VH/x
	QJapxaWC/PtFV29nDSJTai1kqEgftGY+fKftYEIpmbwmm2p7Apu5JnoZ3EmqO1Z6+F8Q2WfC2gzxd
	pp9NYr2Kx3rQ1xpq9mQJ+sX0cT2n4vb2SjAlUvltCKSwoYdqyEizZNGrDbRI3eZtwYfebRt4RX9BH
	ly2VKepQ==;
Received: from ip6-localhost ([::1]:56078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyW37-007g8i-6m; Tue, 07 Jun 2022 10:02:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62086) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyW32-007g8X-Vq
 for samba-technical@lists.samba.org; Tue, 07 Jun 2022 10:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/5BlZS8EWaHMkG4nwmJctdaod7zqdovxo/D7Q2gED6E=; b=ua/PqVOZnYgnvoJfXyJvBesjI4
 0kZMKRxgWFLrx/afTWckQnNiygLjFPzRuTyFsVOadBpr9zQIYhB/e5E8tlddR38ywXmlt3C5UBK54
 fOL+XV0FYSUHba5zWZV9xzPRGUEg69xq/mMc/0yUeY+b2zrbRhK+V6iMynYZs/S9pJiL/BnW+y7uD
 thXsdNzvPyXMYZoTYQrRrf+42db/V0I+zZd6AhL2qp73OlsZdILcHTXDFVe8rL1IuSI0LPawmOXvf
 A3CGSTSLYR7UYLq5UP+V72slN5UWai8So0bDIrGj75wQ9Q1reCoo1nn3SevvSTCWBDvPIUXnD33Gj
 VFcoc+o/kXyd54f3oCfdBcQKhknUkDNpDQBrqDKezvYVEm5+gQYqv4GNAV/L1u3uKjrzXd+yfK06d
 xpVQovmXhsHt5osw3xlMogv/hRiMvVyBEuh/QD8euix3oryJwi4W6F3c74ZuhkcEEEg09HgTO3trB
 ZG1Kdu21XAdImEFLqFG3h8Pa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nyW2w-004NSl-GX; Tue, 07 Jun 2022 10:02:47 +0000
Message-ID: <add80d159f1399d7efce0ec93e38cecdc4d52963.camel@samba.org>
Subject: Re: AD DC option to use acl_tdb rather than acl_xattr?
To: John Mulligan <phlogistonjohn@asynchrono.us>, 
 samba-technical@lists.samba.org
Date: Tue, 07 Jun 2022 22:02:42 +1200
In-Reply-To: <5979975.vuYhMxLoTh@edfu>
References: <5979975.vuYhMxLoTh@edfu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Fri, 2022-06-03 at 13:56 -0400, John Mulligan via samba-technical
wrote:
> Hi Andrew,
> During the sambaXP conference you mentioned that there may be an
> option to 
> swap the vfs/xattr backend even on an AD DC. I'm interested in using
> this as 
> it ought to avoid the need for always running our AD DC container
> images in a 
> privileged mode.  You mentioned it should be OK for our use-case
> where the 
> sysvol is not heavily used. Unfortunately, I haven't found any
> documentation 
> for it. I looked over the interactive help from 'samba-tool' as well
> as the 
> wiki and didn't see anything that jumped out at me.  
> 
> I was hoping you could point me in the right direction. Even if it's
> an 
> unreleased feature, or needs a "cheat code".  Thank you very much!

Thanks for asking, and I'm glad I burned the midnight oil to listen to
your talk, these things are worth attending in real time.

So the trick here is that samba-tool domain provision will honour the
smb.conf it was loaded with.  

so you can set (eg):
        vfs objects = dfs_samba4 acl_xattr xattr_tdb
       xattr_tdb:file = $prefix_abs/statedir/xattr.tdb

(where $prefix_abs is of course a real path)

And Samba will use those during the provision. 

This is how selftest works, see selftest/target/Samba4.pm

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



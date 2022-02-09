Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD04AEBFC
	for <lists+samba-technical@lfdr.de>; Wed,  9 Feb 2022 09:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=I/zKMz2er7OP8zBpyrkT9QkAvfHcLQ+B68ZMtZXRmLc=; b=Tkbx4qFW3Dr+D7mLxAarsDFhG8
	ROSYNbehZ1CctwCQcQi8ANn9zQ44W37bwHdAECVs541/Osp9iJjZ9aCYLV9d9FHzidIpCTfnbm7mF
	PXtJrUc1aieDgA7MtR3T9uq6j7cFF4upKzaIBKkWfPF1qlveBmor5LQ1+w7zU/FwVMGTeYe7zbqIM
	jpRbpFc5B9Tw5yKZE908UqDZZtH0wUEy5lcfR3LK0GH4r/JIG2mxVmT4V5/5zXNn/tsKbbpfeeNAK
	03bPqdsYB7Zk3T7LQxsUgW62FaLeoMDr9/Vq7SzueG3ymh40OIcWhsxm55R1KGKrov7CD7ypRqGVK
	2Os9a7UA==;
Received: from ip6-localhost ([::1]:42202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHi82-005pp5-Mz; Wed, 09 Feb 2022 08:15:06 +0000
Received: from air.basealt.ru ([194.107.17.39]:40708) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nHi7w-005pos-Nb
 for samba-technical@lists.samba.org; Wed, 09 Feb 2022 08:15:03 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 58DF4589436; Wed,  9 Feb 2022 07:55:48 +0000 (UTC)
Received: from nir-nwb.smb.basealt.ru (unknown [85.140.7.54])
 by air.basealt.ru (Postfix) with ESMTPSA id C793D58958B
 for <samba-technical@lists.samba.org>; Wed,  9 Feb 2022 07:55:45 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Announcement of GPUI utilitiy
Organization: BaseALT
Message-ID: <8c1a1aa2-3383-a231-44fa-d45a61f5b541@basealt.ru>
Date: Wed, 9 Feb 2022 11:55:45 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all!

BaseALT team recently released first version ( 0.1.0 ) of GPUI software: 
https://github.com/august-alt/gpui . It is designed as a Group Policy 
Template file editor. It complements ADMC software ( 
https://github.com/altlinux/admc/ ) which was designed as a Samba domain 
tree (LDAP) editor.

As for now you may try to load ADMX files into GPUI and attempt to edit 
local Registry.pol file using graphical interface written in C++/Qt5. At 
the moment it may be buggy but we will be glad to hear your feedback.

I can see that David Mulder is already found some bugs like:

* https://github.com/altlinux/admc/issues/348
* https://github.com/altlinux/admc/issues/347

And we're working on resolution.

-- 
With best regards, Igor Chudov
Modern Hardware Platform Development Manager
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34


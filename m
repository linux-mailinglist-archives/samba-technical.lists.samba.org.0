Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC694CB7A55
	for <lists+samba-technical@lfdr.de>; Fri, 12 Dec 2025 03:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wo6R6yr3cC8IptwRUuE5brZrvt11Y9pnMzSskaamYzw=; b=DsDetodzZQz/5ExdbqCXJgXnjq
	CwqxIrpqxib5Hx2izP9qBQW3rpCczJ5X2fMKq2vCkEx1Tva8qgw6QyRWXXkFELWu+TSn9fl0NRCLx
	jg3drdda/JFPt68NSUZsGwt4IAwnLds+EBianKtMWE3l343ciQfAaWLA1+ielP+4UnsbACmZ3mxL0
	guLCN8e6uWXi1xrzD1j1iQilwbCMFvsFm+yod7jSvgBtxJybO69gd8+nuVYC4Xs0CqFxu3YuPjqKj
	dqZmd4cH65gQ1oVujCGDqdNnk5c/3NJEF/ZZ578RPjisCfLpOMjghIGgZZv72YZHYVwiWxljmac83
	pBXv9UdQ==;
Received: from ip6-localhost ([::1]:64666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vTsde-00G3Iq-VF; Fri, 12 Dec 2025 02:12:11 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:46244) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vTsda-00G3Ij-A1
 for samba-technical@lists.samba.org; Fri, 12 Dec 2025 02:12:08 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-8823d5127daso7653036d6.0
 for <samba-technical@lists.samba.org>; Thu, 11 Dec 2025 18:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765505524; x=1766110324; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wo6R6yr3cC8IptwRUuE5brZrvt11Y9pnMzSskaamYzw=;
 b=UWJQVQUtTHZvB6cl3MoVfBdG1dB/pwiDeb6HRexbjfSzzWlihXbCJjDdo/p2QhYC/d
 BHhpDBZMTjAhWCjRQsLVfH/BA6f+x0FkPTWXsJGmum23jXi6N/KePvwNCPly1mdxcr4E
 OH8/KkCw+x3k8eSq6AAi5ZbnI2WB1JfZ8Y0v2eV93WFGsGPHXWR5PCvjpcHLAagtnCVK
 LHhY8d3IeSBri4eTgju5DNiOzuu85o0eGsVSYbiYNrMvL61WKSYZc+PRvU4WmgGTWo2k
 onMN3vy15ruwkh7lC8o/Vb4Ez6yZuvw0i58BEMhgUKKoZQ4u95Krw7yvrBPbyXKP0n/q
 Xp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765505524; x=1766110324;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wo6R6yr3cC8IptwRUuE5brZrvt11Y9pnMzSskaamYzw=;
 b=vdrDX6yu88psIhhswnow6VB1nJ6XpNFLPDYiHE592Z940WOeScQjP4pwWFJMx+0Pvz
 ShUtMGM8Wx25ALab0LCD+ivOdKOAeIaEmTuw44HgKUSUd7DLV+TzmXoNurdYFmlGtcv4
 lOhiwE1cuBtNDoTszSLsIv4fZqONub/+RCp3UoR8t/IfVrcgkDHLoqNMimdOfTfrPbGd
 6ke/XtHikI9k7Jm6URt5b0tB1oBCjany9HG4WoqLduAsau17eU+Za/GRzyrc5kuk7IgW
 QUpPjSrn6XN5QLWT8PAWTt45kiaaZSNg4BsigQhn2nF9DWp/2ZQUBkuvBawk6JqZEqiU
 Djxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0qrgyLh+6uWoWePbh5FK36gFx5mY+MihYd8pj8frGX1RzSAFju5eBjkF4B3FJrI2sqHtxhEL0jqzARp6pYK8=@lists.samba.org
X-Gm-Message-State: AOJu0Yx4cBIRQO54yJ1Of71NEu6XR2EmQBk/7mw9S0MVECHEps2GCASr
 e4DLMMbodamjaYInda2sXRQAswydeI+NvDnaWmzNWrkK1v3q4xGnzYoA9MyB6D1Jw1pzbu6rCL4
 kMDKmWt4GuuHEFnAh0P32XDBA2nlYn+w=
X-Gm-Gg: AY/fxX5vHRBrk7SWkMIiPrHZACtG3/BSPE6E9xVUg4PcjhztIF6c/JCFSES5WNKqJ+X
 oIQhyvk6WfDiLuf/fD302B7TkMzH+8AaxRTiwhC+N3DVutRsm7RRPb9jg/zVrTTSaBxFX6I5KaE
 B46pNRFvA1NwRWDLO7z+w4m3NF3qDL8zcwKwhAnJF5dnzn81ePpZYvifCOuJQDJU2uIZ9E2FDK7
 6TGd1ixj3V4mOmk8Q0eMKnP5sQN7UjtSpRxQssg2DvU2xwiKg28nFzlTM54r6aagd5omvK5aLZB
 M6KWwqtC3Hxh/Z7XbSNtc+0vh+Tqnnm0t1gxn4z2af7VnF1RknQs1h6+mSl4I2nbDmx7Z++EZa7
 wcfO0YyHMaucpZQqeyGxSOW2Mhhyu6ag4cCrb5G+/RXrGdEhLuqo=
X-Google-Smtp-Source: AGHT+IFXBHwVOlwfT93qVwzLIJbaQCTisSyBbBYw05BeQYrDjkp2eyggAKtZPWWGkuc5i43ToUZ5cfc5UmQWtWCq7uk=
X-Received: by 2002:a05:6214:3c8a:b0:888:59c6:7c43 with SMTP id
 6a1803df08f44-8887e185fd9mr11220096d6.63.1765505523981; Thu, 11 Dec 2025
 18:12:03 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 20:11:52 -0600
X-Gm-Features: AQt7F2rBpbO1j5_3Xz0Ll0Rn95z8uYOalH5YQSNDnlwvobYi-VBeKSCOpUldJSo
Message-ID: <CAH2r5msAbUgccRkUFLPAyzR9+7L=4+=q6csmx6WXTAzMwOriYQ@mail.gmail.com>
Subject: [GIT PULL] smb3 client fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Please pull the following changes since commit
3d99347a2e1ae60d9368b1d734290bab1acde0ce:

  Merge tag 'v6.19-rc-part1-smb3-client-fixes' of
git://git.samba.org/sfrench/cifs-2.6 (2025-12-09 16:09:32 +0900)

are available in the Git repository at:

  git://git.samba.org/sfrench/cifs-2.6.git tags/v6.19-rc-part2-smb3-client-fixes

for you to fetch changes up to ab0347e67dacd121eedc2d3a6ee6484e5ccca43d:

  smb/client: remove DeviceType Flags and Device Characteristics
definitions (2025-12-11 00:53:07 -0600)

----------------------------------------------------------------
12 smb3 client fixes
- Fix three incorrect error code defines
- Add four missing error code definitions
- Add parenthesis around NT_STATUS code defines to fix checkpatch warnings
- Five patches to remove some duplicated protocol definitions, moving
to common code shared by client and server
- Add missing protocol documentation reference (for change notify)
- Correct struct definition (for duplicate_extents_to_file_ex)
----------------------------------------------------------------
ChenXiaoSong (11):
      smb/client: fix NT_STATUS_NO_DATA_DETECTED value
      smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
      smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
      smb/client: add 4 NT error code definitions
      smb: add documentation references for smb2 change notify definitions
      smb/client: add parentheses to NT error code definitions
containing bitwise OR operator
      smb: move notify completion filter flags into common/smb2pdu.h
      smb: move SMB2 Notify Action Flags into common/smb2pdu.h
      smb: move file_notify_information to common/fscc.h
      smb: update struct duplicate_extents_to_file_ex
      smb: move File Attributes definitions into common/fscc.h

ZhangGuoDong (1):
      smb/client: remove DeviceType Flags and Device Characteristics definitions

 fs/smb/client/cifspdu.h |   65 ----
 fs/smb/client/nterr.c   |    5 +
 fs/smb/client/nterr.h   | 1014 ++++++++++++++++++++++++------------------------
 fs/smb/common/fscc.h    |   56 +++
 fs/smb/common/smb2pdu.h |   48 +--
 5 files changed, 581 insertions(+), 607 deletions(-)


-- 
Thanks,

Steve

